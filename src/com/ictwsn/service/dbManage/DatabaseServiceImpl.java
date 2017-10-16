package com.ictwsn.service.dbManage;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Map;

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
	 
	public Map<String,ArrayList<String>> getTreeData() {
		 return dao.getTreeData();
	 }

	 public String getCurrentData(String data) {
		 return dao.getCurrentData(data);
	 }

	
	


}
