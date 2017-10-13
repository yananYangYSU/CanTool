package com.ictwsn.dao.historyData;

/**
 * 历史数据dao层接口类
 * @author YangYanan
 * @desc
 * @date 2017-10-18
 */
public interface HistoryDataDao {
	public int searchHistoryData(String ecuName,int page,String startTime,String endTime);
 
}
