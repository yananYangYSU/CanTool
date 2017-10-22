package com.ictwsn.service.dbManage;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import com.ictwsn.dao.dbManage.DatabaseDao;

@Service
public class DatabaseServiceImpl implements DatabaseService {
	
	@Resource DatabaseDao dao;

	@Override
	public boolean exportDataBase(String fileType) {
		// TODO Auto-generated method stub
		return dao.exportDataBase(fileType);
	}

	@Override
	public boolean importDataBase(String fileType, String fileName) {
		// TODO Auto-generated method stub
		return dao.importDataBase(fileType, fileName);
	}
	 
	public String getTreeData() {
		Map<String,ArrayList<String>> nameMap=dao.getTreeData();
		Set<String> set=nameMap.keySet();
		String[] id=null;
		Iterator it=set.iterator();
		StringBuffer treeStr=new StringBuffer();
		while(it.hasNext()) {
			String message=(String) it.next();
            id=message.split(" ");
			treeStr.append("<li><span class=\"folder\" >").append(message).append("</span>\n").append("<ul style=\"display:none\">\n");
			ArrayList<String> signalList=nameMap.get(message);		
			for(String signal:signalList) {
				treeStr.append("<li><a href=\"currentDataIndex.do?id=").append(id[1]).append("&signalName=").append(signal).append("\"><span class=\"file\">").append(signal).append("</span></a></li>\n");
			}
			treeStr.append("</ul></li>\n");
		}
		return treeStr.toString();
	 }
}
