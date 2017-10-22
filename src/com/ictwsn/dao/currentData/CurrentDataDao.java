package com.ictwsn.dao.currentData;

import java.util.List;

import com.ictwsn.bean.CanMsgDataBean;
import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.bean.CanSignalBean;



public interface CurrentDataDao {
	public CanSignalBean getCanSignal(int id,String signalName);
	public List<CanMsgDataBean> getMessageList(String signalName);
	public List<CanMsgDataBean> getMessageList(String signalName,String startTime);
}
