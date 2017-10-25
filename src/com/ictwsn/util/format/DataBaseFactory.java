package com.ictwsn.util.format;

import java.util.ArrayList;
import java.util.Map;
/**
 * 数据库导入导出操作接口类
 * @author yanan
 *
 */
public interface DataBaseFactory {
	public boolean exportFile(Map<String,ArrayList<String>> canDatabaseMap);//导出
	public Map<String,ArrayList<String>> importFile(String fileName);//导入

}
