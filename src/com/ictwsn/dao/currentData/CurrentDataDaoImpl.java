package com.ictwsn.dao.currentData;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;
import com.ictwsn.bean.CanMsgDataBean;
import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.bean.CanSignalBean;

import com.ictwsn.dao.MySQLBaseDao;
import com.ictwsn.util.CurrentConn;
import com.ictwsn.util.cantool.CanMessageStore;
import com.ictwsn.util.cantool.LoadDataBase;
import com.ictwsn.util.cantool.UncodeCanMsg;

@Repository
public class CurrentDataDaoImpl extends MySQLBaseDao implements CurrentDataDao {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs=null;
	UncodeCanMsg ucm=UncodeCanMsg.getInstance();
	CanMessageStore cms=CanMessageStore.getInstance();
	@Override
	public CanPhyDataBean getRealPhyData(int id,String signalName) {
		// TODO Auto-generated method stub
		String canMessage=cms.getAcceptMsgStr(id);
		CanPhyDataBean cpdb=ucm.getCanPhyData(signalName,canMessage);
		cpdb.setSignalName(canMessage);
		return cpdb;
	}
	@Override
	public CanSignalBean getCanSignal(int id, String signalName) {
		// TODO Auto-generated method stub
		ArrayList<CanSignalBean> csbList=LoadDataBase.getCanSignalMap().get(id);
		for(CanSignalBean csb:csbList){
			if(csb.getSignalName().equals(signalName))
				return csb;
		}
		return null;
	}
	
	@Override
	public List<CanMsgDataBean> getMessageList(String signalName) {
		String sql="SELECT id,dcl,byteStr,time from can_msg_data,can_signal where conv(can_msg_data.id,16,10)=can_signal.messageId and signalName=? ORDER BY can_msg_data.autoId desc LIMIT 0,10 ;";
		List<CanMsgDataBean> cmdbList=jt.query(sql,new Object[]{signalName},new ResultSetExtractor<List<CanMsgDataBean>>() {
			public List<CanMsgDataBean> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<CanMsgDataBean> list = new ArrayList<CanMsgDataBean>();
				while (rs.next()) {
					CanMsgDataBean bean=new CanMsgDataBean();
					bean.setId(rs.getString(1));
					bean.setDcl(rs.getInt(2));
					String[] dataList=rs.getString(3).trim().split(" ");
					ArrayList<String> datas=new ArrayList<String>();
					for(int i=0;i<dataList.length;i++){
						datas.add(dataList[i]);
					}
					bean.setData(datas);
					bean.setTime(rs.getString(4));
					list.add(bean);
				}
				return list;
			}
		});
		return cmdbList;
	}
	@Override
	public List<CanMsgDataBean> getMessageList(String signalName,String startTime) {
		String sql="SELECT id,dcl,byteStr,time from can_msg_data,can_signal where conv(can_msg_data.id,16,10)=can_signal.messageId and signalName=? and time>?";
		List<CanMsgDataBean> cmdbList=jt.query(sql,new Object[]{signalName,startTime},new ResultSetExtractor<List<CanMsgDataBean>>() {
			public List<CanMsgDataBean> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<CanMsgDataBean> list = new ArrayList<CanMsgDataBean>();
				while (rs.next()) {
					CanMsgDataBean bean=new CanMsgDataBean();
					bean.setId(rs.getString(1));
					bean.setDcl(rs.getInt(2));
					String[] dataList=rs.getString(3).trim().split(" ");
					ArrayList<String> datas=new ArrayList<String>();
					for(int i=0;i<dataList.length;i++){
						datas.add(dataList[i]);
					}
					bean.setData(datas);
					bean.setTime(rs.getString(4));
					list.add(bean);
				}
				return list;
			}
		});
		return cmdbList;
	}
}
