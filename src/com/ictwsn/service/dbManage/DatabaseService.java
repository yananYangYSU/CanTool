package com.ictwsn.service.dbManage;

import java.util.ArrayList;
import java.util.Map; 
/**
 * 运营商service层接口类
 * @author YangYanan
 * @desc
 * @date 2017-8-18
 */
public interface DatabaseService {
	public boolean exportDataBase(String fileType);
	public boolean importDataBase(String fileType,String fileName);
	public String getTreeData();
	public String getCurrentData(String data);
}
