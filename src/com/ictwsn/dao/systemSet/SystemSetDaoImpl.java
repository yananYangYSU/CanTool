package com.ictwsn.dao.systemSet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

 
import com.ictwsn.dao.MySQLBaseDao;
import com.ictwsn.util.CurrentConn;


@Repository
public class SystemSetDaoImpl extends MySQLBaseDao implements SystemSetDao {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs=null;
}