package com.ictwsn.service.historyData;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ictwsn.dao.historyData.HistoryDataDao;
@Service
public class HistoryDataServiceImpl implements HistoryDataService {
	
	@Resource HistoryDataDao dao;

	@Override
	public int searchHistoryData(String ecuName, int page, String startTime,String endTime) {
		// TODO Auto-generated method stub
		return dao.searchHistoryData(ecuName, page, startTime, endTime);
	}
	 

	
	


}
