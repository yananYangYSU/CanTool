package com.ictwsn.dao.dbManage;

import java.util.ArrayList;
import java.util.Map;

public interface DatabaseDao {
	public boolean exportDataBase(String fileType);
	public boolean importDataBase(String fileType,String fileName);
	public Map<String, ArrayList<String>> getTreeData();
	public String getCurrentData(String data);
}
