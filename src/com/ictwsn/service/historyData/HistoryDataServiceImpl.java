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
			historyData.append("<li><a href=\"showMatrixTable.do?messageStr=t31d86211F553238765AB\"><span class=\"folder\">").append(key).append("</span></a>\n").append("<ul style=\"display:none\">\n");
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

	@Override
	public CanMsgFabricBean showMatrixTable(String messageStr) {
		// TODO Auto-generated method stub
		return dao.showMatrixTable(messageStr);
	}
	@Override
	public String QueryByTime(String startTime, String endTime) {
		Map<Integer,ArrayList<String>> map=dao.QueryByTime(startTime, endTime);
		Set<Integer> set=map.keySet();
		Iterator it=set.iterator();
		StringBuffer Str=new StringBuffer();
		while(it.hasNext()) {
			ArrayList<String> list=new ArrayList<String>();
			int key=(Integer) it.next();
			list=map.get(key);
			Str.append("<tr>");
			Str.append("<td width=\"140px\">").append(list.get(0)).append("</td>");
			Str.append("<td width=\"140px\">").append(list.get(1)).append("</td>");
			Str.append("<td width=\"140px\">").append(list.get(2)).append("</td>");
			Str.append("<td width=\"140px\">").append(list.get(3)).append("</td>");
			Str.append("<td width=\"140px\">").append(list.get(4)).append("</td>");
			Str.append("</tr>");
		}
		return Str.toString();
	}
}
