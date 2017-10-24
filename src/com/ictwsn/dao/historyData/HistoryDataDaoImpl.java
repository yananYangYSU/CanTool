package com.ictwsn.dao.historyData;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ictwsn.bean.CanMsgDataBean;
import com.ictwsn.bean.CanMsgFabricBean;
import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.dao.MySQLBaseDao;
import com.ictwsn.util.CurrentConn;
import com.ictwsn.util.cantool.UncodeCanMsg;
import com.ictwsn.util.cantool.UncodeCanMsgForMatrix;

@Repository
public class HistoryDataDaoImpl extends MySQLBaseDao implements HistoryDataDao {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs=null;
	ResultSet rs2=null;
	
	/**
	 * 实时数据显示dao层 的实现
	 * 将can信息和解析出的物理值通过一定的显示规则封装至map数组
	 * @throws SQLException 
	 */
	@Override
	public Map<Integer, ArrayList<String>> showDataFabric(int number,int size) {
		Map<Integer,ArrayList<String>> DataMap=new HashMap<Integer,ArrayList<String>>();
		String sql=null;
		String message=null; 
		try {
			sql="select * from can_msg_data order by autoId desc limit ?,?";
			conn=CurrentConn.getInstance().getConn();
			pst=conn.prepareStatement(sql);
			pst.setInt(1, number);
			pst.setInt(2, size);
			rs=pst.executeQuery();
			int key=1;
			while(rs.next()){
				ArrayList<String> signal=new ArrayList<String>();
				int id=Integer.parseInt(rs.getString(2),16); //将十六进制id转换成十进制，用于匹配messageid
				String messageName=null;//获取messageName
				try {
					sql="select messageName from can_message where id=?";
					pst=conn.prepareStatement(sql);
					pst.setInt(1, id);
					rs2=pst.executeQuery();
					while(rs2.next()) {
							messageName=rs2.getString(1);
					}
				}catch(Exception e){
					e.printStackTrace();
				}

				String messageStr=null;
				if(rs.getString(2).length()==3) {
					messageStr="t"+rs.getString(2)+rs.getInt(3)+rs.getString(4).replaceAll(" ","");
				}else if(rs.getString(2).length()==8) {
					messageStr="T"+rs.getString(2)+rs.getInt(3)+rs.getString(4).replaceAll(" ","");
				}
				ArrayList<CanPhyDataBean> canPhy=new ArrayList<CanPhyDataBean>();
				CanMsgDataBean canMsg=UncodeCanMsg.getInstance().splitDataStr(messageStr);
				signal.add(messageStr);
				message=rs.getString(5).substring(0, 19)+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+id+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+messageName+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+rs.getInt(3)+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+rs.getString(4); //key由time,id.name,dcl,data组成
				canPhy=UncodeCanMsg.getInstance().parseCanData(UncodeCanMsg.getInstance().splitDataStr(messageStr));
				signal.add(message);
				for(int i=0;i<canPhy.size();i++) {
					CanPhyDataBean canphy=canPhy.get(i);
					String signalStr=canphy.getSignalName()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+canphy.getPhyValue()+canphy.getUnit()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+canphy.getHexStr()+"&nbsp;&nbsp;&nbsp;"+canphy.getBinaryStr();
					signal.add(signalStr);
				}
				DataMap.put(key, signal);
				key++;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			CurrentConn.getInstance().closeResultSet(rs);
			CurrentConn.getInstance().closeResultSet(rs2);
			CurrentConn.getInstance().closePreparedStatement(pst);
			CurrentConn.getInstance().closeConnection(conn);
		}
		return DataMap;
	}

	@Override
	public int getHistoryDataCount() {
		return this.jt.queryForInt("select count(0) from can_msg_data");
	}

	@Override
	public CanMsgFabricBean showMatrixTable(String messageStr) {
		// TODO Auto-generated method stub
		return UncodeCanMsgForMatrix.getInstance().showMatrixTable(messageStr);
	}
	
	@Override
	public Map<Integer, ArrayList<String>> QueryByTime(String startTime, String endTime,int number,int size) {
		Map<Integer, ArrayList<String>> map=new HashMap<Integer, ArrayList<String>>();
		// TODO Auto-generated method stub
		try {
			conn=CurrentConn.getInstance().getConn();
			String sql="select * from can_msg_data where time between ? and ? limit ? ,?";
			pst=conn.prepareStatement(sql);
			pst.setString(1, startTime);
			pst.setString(2, endTime);
			pst.setInt(3, number);
			pst.setInt(4, size);
			rs=pst.executeQuery();
			int i=1;
			while(rs.next()) {
				String messageName=null;
				int id=Integer.parseInt(rs.getString(2), 16);
				try {
					sql="select messageName from can_message where id=?";
					pst=conn.prepareStatement(sql);
					pst.setInt(1, id);
					rs2=pst.executeQuery();
					while(rs2.next()) {
							messageName=rs2.getString(1);
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				ArrayList<String> list=new ArrayList<String>();
				list.add(rs.getString(2));
				list.add(messageName);
				list.add(rs.getString(3));
				list.add(rs.getString(4));
				list.add(rs.getString(5).substring(0,19));
				map.put(i, list);
				i++;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			CurrentConn.getInstance().closeResultSet(rs);
			CurrentConn.getInstance().closeResultSet(rs2);
			CurrentConn.getInstance().closePreparedStatement(pst);
			CurrentConn.getInstance().closeConnection(conn);
		}
		return map;
	}
	
	public Map<Integer, ArrayList<String>> SearchHistoryData(int number,int size) {
		Map<Integer, ArrayList<String>> map=new HashMap<Integer, ArrayList<String>>();
		try {
			conn=CurrentConn.getInstance().getConn();
			String sql="select * from can_msg_data order by autoId desc limit ?,?";
			pst=conn.prepareStatement(sql);
			pst.setInt(1, number);
			pst.setInt(2, size);
			rs=pst.executeQuery();
			int i=1;
			while(rs.next()) {
				String messageName=null;
				int id=Integer.parseInt(rs.getString(2), 16);
				try {
					sql="select messageName from can_message where id=?";
					pst=conn.prepareStatement(sql);
					pst.setInt(1, id);
					rs2=pst.executeQuery();
					while(rs2.next()) {
							messageName=rs2.getString(1);
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				ArrayList<String> list=new ArrayList<String>();
				list.add(rs.getString(2));
				list.add(messageName);
				list.add(rs.getString(3));
				list.add(rs.getString(4));
				list.add(rs.getString(5).substring(0,19));
				map.put(i, list);
				i++;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			CurrentConn.getInstance().closeResultSet(rs);
			CurrentConn.getInstance().closeResultSet(rs2);
			CurrentConn.getInstance().closePreparedStatement(pst);
			CurrentConn.getInstance().closeConnection(conn);
		}
		return map;
	}
	
	public int totleCount(String startTime,String endTime) {
		int i=0;
		if(startTime==null&&endTime==null) {
			try {
				conn=CurrentConn.getInstance().getConn();
				String sql="select * from can_msg_data";
				pst=conn.prepareStatement(sql);
				rs=pst.executeQuery();
				while(rs.next()) {
					i++;
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
		}else {
			try {
				conn=CurrentConn.getInstance().getConn();
				String sql="select * from can_msg_data where time between ? and ?";
				pst=conn.prepareStatement(sql);
				pst.setString(1, startTime);
				pst.setString(2, endTime);
				rs=pst.executeQuery();
				while(rs.next()) {
					i++;
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		return i;
		
	}

}
