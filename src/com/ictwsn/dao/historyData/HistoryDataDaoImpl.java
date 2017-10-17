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
		CanMsgDataBean canMsg=new CanMsgDataBean();
		//UncodeCanMsg uncode=UncodeCanMsg.getInstance().p
		Map<String,ArrayList<String>> DataMap=new HashMap<String,ArrayList<String>>();
		conn=CurrentConn.getInstance().getConn();
		String sql=null;
		ArrayList<String> signalName=new ArrayList<String>();
		//查询message数据
		try {
			sql="select * from can_msg_data";
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				int id=rs.getInt(2);
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
				//解析message，组装表格所需数据
				
				try {
					sql="select signalName from can_signal where messageId="+id;
					pst=conn.prepareStatement(sql);
					ResultSet rs2=pst.executeQuery();
					while(rs2.next()) {
						signalName.add(rs2.getString(1));	
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				
				DataMap.put(rs.getString(6)+"  "+rs.getInt(2)+"   "+rs.getString(3)+"  "+rs.getInt(4)+"   "+"data", signalName);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return DataMap;
	}



}
