package com.ictwsn.service.currentData;

import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.bean.CanSignalBean;


/**
 * 运营商service层接口类
 * @author YangYanan
 * @desc
 * @date 2017-8-18
 */
public interface CurrentDataService{
	public CanPhyDataBean getRealPhyData(String id,String signalName);
	public CanSignalBean getCanSignal(String id,String signalName);
}
