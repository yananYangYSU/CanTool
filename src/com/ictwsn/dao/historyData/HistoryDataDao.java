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
	public Map<String,ArrayList<String>> getHistoryData(int number,int size);
	public int getHistoryDataCount();
}
