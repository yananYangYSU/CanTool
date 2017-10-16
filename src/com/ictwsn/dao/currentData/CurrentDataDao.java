package com.ictwsn.dao.currentData;


import java.util.List;

import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.bean.CanSignalBean;



public interface CurrentDataDao {
	public CanPhyDataBean getRealPhyData(String id,String ecuName);
	public CanSignalBean getCanSignal(String id,String signalName);
}
