package com.ictwsn.dao.dbManage;

public interface DatabaseDao {
	public boolean exportDataBase(String fileType);
	public boolean importDataBase(String fileType,String fileName);
}
