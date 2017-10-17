package com.ictwsn.dao.historyData;

import java.util.ArrayList;
import java.util.Map;

import com.ictwsn.bean.CanPhyDataBean;

/**
 * 历史数据dao层接口类
 * @author YangYanan
 * @desc
 * @date 2017-10-18
 */
public interface HistoryDataDao {
	public ArrayList<CanPhyDataBean> searchHistoryData(String ecuName,int page,String startTime,String endTime);
	public int getHistoryDataCount(String ecuName,int page,String startTime,String endTime);//条件查询历史数据数量
	public Map<String,ArrayList<String>> getHistoryData();
}
