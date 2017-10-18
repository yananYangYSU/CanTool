package com.ictwsn.service.historyData;

import java.util.ArrayList;
import java.util.List;

import com.ictwsn.bean.CanPhyDataBean;

/**
 * 历史数据service层接口类
 * @author YangYanan
 * @desc
 * @date 2017-10-18
 */
public interface HistoryDataService {
	public String getHistoryData(int number,int size);
	public int getHistoryDataCount();
}
