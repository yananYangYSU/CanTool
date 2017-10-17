package com.ictwsn.dao.historyData;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ictwsn.bean.CanMsgDataBean;
import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.dao.MySQLBaseDao;
import com.ictwsn.util.CurrentConn;
import com.ictwsn.util.cantool.UncodeCanMsg;

@Repository
public class HistoryDataDaoImpl extends MySQLBaseDao implements HistoryDataDao {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs=null;
	
	@Override
	public ArrayList<CanPhyDataBean> searchHistoryData(String ecuName, int page, String startTime,
			String endTime) {
		/**
		 * 补充代码
		 */
		
		return null;
	}

	@Override
	public int getHistoryDataCount(String ecuName, int page, String startTime,
			String endTime) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Map<String, ArrayList<String>> getHistoryData() {
		Map<String,ArrayList<String>> DataMap=new HashMap<String,ArrayList<String>>();
		conn=CurrentConn.getInstance().getConn();
		String sql=null;
		//key和value
		String message=null;                               
		ArrayList<String> signal=new ArrayList<String>();  
		ArrayList<CanPhyDataBean> canPhy=new ArrayList<CanPhyDataBean>();
		//查询message数据
		try {
			sql="select * from can_msg_data";
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				int id=Integer.parseInt(rs.getString(2),16); //将十六进制id转换成十进制，用于匹配messageid
				//根据数据id查询name，表格需要使用
				String messageName=null;
				try {
					sql="select messageName from can_message where id="+id;
					pst=conn.prepareStatement(sql);
					ResultSet rs2=pst.executeQuery();
					while(rs2.next()) {
							messageName=rs2.getString(1);
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				message=rs.getDate(5)+"&nbsp;&nbsp;&nbsp;"+rs.getString(2)+"&nbsp;&nbsp;&nbsp;"+messageName+"&nbsp;&nbsp;&nbsp;"+rs.getInt(3)+"&nbsp;&nbsp;&nbsp;"+rs.getString(4); //key由time,id.name,dcl,data组成
				//组装message字符串，组装表格所需数据
				String messageStr=null;
				if(rs.getString(2).length()==3) {
					messageStr="t"+rs.getString(2)+rs.getInt(3)+rs.getString(4)+"\\r";
				}else if(rs.getString(2).length()==8) {
					messageStr="T"+rs.getString(2)+rs.getInt(3)+rs.getString(4)+"\\r";
				}
				canPhy=UncodeCanMsg.getInstance().parseCanData(UncodeCanMsg.getInstance().splitDataStr(messageStr));
				for(int i=0;i<canPhy.size();i++) {
					CanPhyDataBean canphy=canPhy.get(i);
					String signalStr=canphy.getSignalName()+"&nbsp;&nbsp;&nbsp;"+canphy.getPhyValue()+canphy.getUnit()+"&nbsp;&nbsp;&nbsp;"+canphy.getHexStr()+"&nbsp;&nbsp;&nbsp;"+canphy.getBinaryStr();
					signal.add(signalStr);
				}
				DataMap.put(message, signal);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return DataMap;
	}



}
