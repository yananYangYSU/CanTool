package com.ictwsn.service.historyData;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.dao.historyData.HistoryDataDao;
@Service
public class HistoryDataServiceImpl implements HistoryDataService {
	
	@Resource HistoryDataDao dao;

	@Override
	public String getHistoryData(int number,int size) {
		Map<String,ArrayList<String>> map=dao.getHistoryData(number,size);
		Set<String> set=map.keySet();
		Iterator it=set.iterator();
		StringBuffer historyData=new StringBuffer();
		while(it.hasNext()) {
			String key=(String) it.next();
			historyData.append("<li><a href=\"distribution.jsp\"><span class=\"folder\">").append(key).append("</span></a>\n").append("<ul>\n");
			ArrayList<String> signalList=map.get(key);		
			for(String signal:signalList) {
				historyData.append("<li><span class=\"file\">").append(signal).append("</span></li>\n");
			}
			historyData.append("</ul></li>\n");
		}
		return historyData.toString();
	}

	@Override
	public int getHistoryDataCount() {
		return dao.getHistoryDataCount();
	}
}
