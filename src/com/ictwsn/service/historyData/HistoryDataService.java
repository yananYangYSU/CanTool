package com.ictwsn.service.historyData;
 
import java.util.ArrayList;
import java.util.Map;

import com.ictwsn.bean.CanMsgFabricBean; 

/**
 * 历史数据service层接口类
 * @author YangYanan
 * @desc
 * @date 2017-10-18
 */
public interface HistoryDataService {
	public String showDataFabric(int number,int size);
	public CanMsgFabricBean showMatrixTable(String messageStr);
	public int getHistoryDataCount();
	public String QueryByTime(String startTime,String endTime);
	public String SearchHistoryData();
}
