package com.ictwsn.dao.currentData;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

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



}
