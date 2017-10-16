package com.ictwsn.dao.exportData;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.springframework.stereotype.Repository;
import com.ictwsn.dao.MySQLBaseDao;


@Repository
public class ExportDataDaoImpl extends MySQLBaseDao implements ExportDataDao {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs=null;
	
	
	
	



}
