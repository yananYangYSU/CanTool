package com.ictwsn.dao.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

 
import com.ictwsn.dao.MySQLBaseDao;
import com.ictwsn.util.CurrentConn;

@Repository
public class LoginDaoImpl extends MySQLBaseDao implements LoginDao {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs=null;



}
