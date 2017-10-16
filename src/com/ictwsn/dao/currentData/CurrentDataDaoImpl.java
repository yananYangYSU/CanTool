package com.ictwsn.dao.currentData;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import org.springframework.stereotype.Repository;
import com.ictwsn.bean.CanMsgDataBean;
import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.bean.CanSignalBean;
import com.ictwsn.dao.MySQLBaseDao;
import com.ictwsn.util.cantool.CanMessageStore;
import com.ictwsn.util.cantool.LoadDataBase;
import com.ictwsn.util.cantool.UncodeCanMsg;

@Repository
public class CurrentDataDaoImpl extends MySQLBaseDao implements CurrentDataDao {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs=null;
	UncodeCanMsg ucm=UncodeCanMsg.getInstance();
	@Override
	public CanPhyDataBean getRealPhyData(String id,String signalName) {
		// TODO Auto-generated method stub
		String canMessage=CanMessageStore.getAcceptMsgStr(id);
		CanPhyDataBean cpdbList=ucm.getCanPhyData(signalName,canMessage);
		return cpdbList;
	}
	@Override
	public CanSignalBean getCanSignal(String id, String signalName) {
		// TODO Auto-generated method stub
		ArrayList<CanSignalBean> csbList=LoadDataBase.getCanSignalMap().get(id);
		for(CanSignalBean csb:csbList){
			if(csb.getSignalName().equals(signalName))
				return csb;
		}
		return null;
	}
	@Override
	public int insertCanMessage(CanMsgDataBean cmdb) {
		String sql="insert into can_msg_data(id,dcl,byteStr,time)values(?,?,?,?)";
		return this.jt.update(sql,new Object[]{cmdb.getId(),cmdb.getDcl(),cmdb.getData().toString(),cmdb.getTime()}); 
	}



}
