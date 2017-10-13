package com.ictwsn.dao.currentData;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.dao.MySQLBaseDao;
import com.ictwsn.util.CurrentConn;
import com.ictwsn.util.cantool.CanMessageStore;
import com.ictwsn.util.cantool.UncodeCanMsg;

@Repository
public class CurrentDataDaoImpl extends MySQLBaseDao implements CurrentDataDao {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs=null;
	@Override
	public String getRealDataInitStr(String id,String signalName) {
		// TODO Auto-generated method stub
		UncodeCanMsg ucm=UncodeCanMsg.getInstance();
		String canMessage=CanMessageStore.getAcceptMsgStr(id);
		CanPhyDataBean cpdbList=ucm.getCanPhyData(signalName,canMessage);
		return cpdbList.getData()+"#"+cpdbList.getTime();
	}



}
