package com.ictwsn.dao.historyData;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;
import com.ictwsn.dao.MySQLBaseDao;

@Repository
public class HistoryDataDaoImpl extends MySQLBaseDao implements HistoryDataDao {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs=null;
	
	@Override
	public int searchHistoryData(String ecuName, int page, String startTime,
			String endTime) {
		/**
		 * 补充代码
		 */
		
		return 0;
	}



}
