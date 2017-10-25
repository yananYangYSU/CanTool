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

	@Resource
	HistoryDataDao dao;

	@Override
	public String showDataFabric(int number, int size) {
		Map<Integer, ArrayList<String>> map = dao.showDataFabric(number, size);
		Set<Integer> set = map.keySet();
		Iterator it = set.iterator();
		StringBuffer historyData = new StringBuffer();
		while (it.hasNext()) {
			int key = (Integer) it.next();
			ArrayList<String> signalList = map.get(key);
			historyData
					.append("<li><a href=\"showMatrixTable.do?messageStr=")
					.append(signalList.get(0))
					.append("\"><span class=\"folder\">")
					.append(signalList.get(1))
					.append("</span></a>\n")
					.append("<ul style=\"display:none\">\n")
					.append("<li><table class=\"table table-hover text-center\">");
			for (int i = 2; i < signalList.size(); i++) {
				historyData.append(signalList.get(i));
			}
			historyData.append("</table></li></ul></li>\n");
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
	public String QueryByTime(String startTime, String endTime, int number,
			int size) {
		Map<Integer, ArrayList<String>> map = dao.QueryByTime(startTime,
				endTime, number, size);
		Set<Integer> set = map.keySet();
		Iterator it = set.iterator();
		StringBuffer Str = new StringBuffer();
		while (it.hasNext()) {
			ArrayList<String> list = new ArrayList<String>();
			int key = (Integer) it.next();
			list = map.get(key);
			Str.append("<tr>");
			Str.append("<td width=\"140px\">").append(list.get(0))
					.append("</td>");
			Str.append("<td width=\"140px\">").append(list.get(1))
					.append("</td>");
			Str.append("<td width=\"140px\">").append(list.get(2))
					.append("</td>");
			Str.append("<td width=\"140px\">").append(list.get(3))
					.append("</td>");
			Str.append("<td width=\"140px\">").append(list.get(4))
					.append("</td>");
			Str.append("</tr>");
		}
		return Str.toString();

	}

	@Override
	public String SearchHistoryData(int number, int size) {
		Map<Integer, ArrayList<String>> map = dao.SearchHistoryData(number,
				size);
		Set<Integer> set = map.keySet();
		Iterator it = set.iterator();
		StringBuffer Str = new StringBuffer();
		while (it.hasNext()) {
			ArrayList<String> list = new ArrayList<String>();
			int key = (Integer) it.next();
			list = map.get(key);
			Str.append("<tr>");
			Str.append("<td width=\"140px\">").append(list.get(0))
					.append("</td>");
			Str.append("<td width=\"140px\">").append(list.get(1))
					.append("</td>");
			Str.append("<td width=\"140px\">").append(list.get(2))
					.append("</td>");
			Str.append("<td width=\"140px\">").append(list.get(3))
					.append("</td>");
			Str.append("<td width=\"140px\">").append(list.get(4))
					.append("</td>");
			Str.append("</tr>");
		}
		return Str.toString();
	}

	@Override
	public int totleCount(String startTime, String endTime) {

		return dao.totleCount(startTime, endTime);
	}
}
