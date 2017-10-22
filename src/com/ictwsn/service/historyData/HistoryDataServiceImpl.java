package com.ictwsn.service.historyData;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ictwsn.bean.CanMsgFabricBean;
import com.ictwsn.dao.historyData.HistoryDataDao;
@Service
public class HistoryDataServiceImpl implements HistoryDataService {
	
	@Resource HistoryDataDao dao;

	@Override
	public String showDataFabric(int number,int size) {
		Map<String,ArrayList<String>> map=dao.showDataFabric(number,size);
		Set<String> set=map.keySet();
		Iterator<String> it=set.iterator();
		StringBuffer historyData=new StringBuffer();
		while(it.hasNext()) {
			String key=(String) it.next();
			ArrayList<String> signalList=map.get(key);
			String messageStr=signalList.get(signalList.size()-1);
			historyData.append("<li><a href=\"showMatrixTable.do?messageStr=").append(messageStr).append("\"><span class=\"folder\">").append(key).append("</span></a>\n").append("<ul style=\"display:none\">\n");		
			for(int i=0;i<(signalList.size()-1);i++) {
				historyData.append("<li><span class=\"file\">").append(signalList.get(i)).append("</span></li>\n");
			}
			historyData.append("</ul></li>\n");
		}
		return historyData.toString();
	}

	@Override
	public int getHistoryDataCount() {
		return dao.getHistoryDataCount();
	}

	@Override
	public CanMsgFabricBean showMatrixTable(String messageStr) {
		// TODO Auto-generated method stub
		return dao.showMatrixTable(messageStr);
	}

	@Override
	public String QueryByTime(String startTime, String endTime) {
		dao.QueryByTime(startTime, endTime);
		return null;
	}
}
