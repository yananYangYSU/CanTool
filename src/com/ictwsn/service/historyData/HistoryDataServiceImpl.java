package com.ictwsn.service.historyData;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.dao.historyData.HistoryDataDao;
@Service
public class HistoryDataServiceImpl implements HistoryDataService {
	
	@Resource HistoryDataDao dao;

	@Override
	public ArrayList<CanPhyDataBean> searchHistoryData(String ecuName, int page, String startTime,String endTime) {
		// TODO Auto-generated method stub
		return dao.searchHistoryData(ecuName, page, startTime, endTime);
	}

	@Override
	public int getHistoryDataCount(String ecuName, int page, String startTime,
			String endTime) {
		// TODO Auto-generated method stub
		return dao.getHistoryDataCount(ecuName, page, startTime, endTime);
	}
	 

	
	


}
