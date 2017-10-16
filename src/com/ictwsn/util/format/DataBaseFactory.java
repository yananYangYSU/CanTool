package com.ictwsn.util.format;

import java.util.ArrayList;
import java.util.Map;

public interface DataBaseFactory {
	public boolean exportFile(Map<String,ArrayList<String>> canDatabaseMap);
	public Map<String,ArrayList<String>> importFile(String fileName);

}
