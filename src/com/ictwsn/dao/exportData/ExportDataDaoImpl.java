package com.ictwsn.dao.exportData;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.ictwsn.dao.MySQLBaseDao;
import com.ictwsn.util.CurrentConn;


@Repository
public class ExportDataDaoImpl extends MySQLBaseDao implements ExportDataDao {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs=null;
	



}
