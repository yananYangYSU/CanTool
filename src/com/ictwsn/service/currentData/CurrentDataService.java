package com.ictwsn.service.currentData;

import java.util.ArrayList;

import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.bean.CanSignalBean;


/**
 * 运营商service层接口类
 * @author YangYanan
 * @desc
 * @date 2017-8-18
 */
public interface CurrentDataService{
	public ArrayList<CanPhyDataBean> getRealDataList(int id,String signalName);
	public ArrayList<CanPhyDataBean> getRealDataList(int id,String signalName,String startTime);
	public CanPhyDataBean getRealPhyData(int id,String signalName);
	public CanSignalBean getCanSignal(int id,String signalName);
}
