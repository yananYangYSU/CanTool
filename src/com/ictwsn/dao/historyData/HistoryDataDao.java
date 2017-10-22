package com.ictwsn.dao.historyData;

import java.util.ArrayList;
import java.util.Map;

import com.ictwsn.bean.CanMsgFabricBean; 

/**
 * 历史数据dao层接口类
 * @author YangYanan
 * @desc
 * @date 2017-10-18
 */
public interface HistoryDataDao {
	public Map<String,ArrayList<String>> showDataFabric(int number,int size);
	public CanMsgFabricBean showMatrixTable(String messageStr);
	public int getHistoryDataCount();
	public Map<Integer,ArrayList<String>> QueryByTime(String startTime,String endTime);
}
