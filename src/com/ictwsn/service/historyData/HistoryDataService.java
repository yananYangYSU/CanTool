package com.ictwsn.service.historyData;

/**
 * 历史数据service层接口类
 * @author YangYanan
 * @desc
 * @date 2017-10-18
 */
public interface HistoryDataService {
	public int searchHistoryData(String ecuName,int page,String startTime,String endTime);//条件查询历史数据
	public int getHistoryDataCount(String ecuName,int page,String startTime,String endTime);//条件查询历史数据数量
}
