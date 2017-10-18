package com.ictwsn.dao.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.ictwsn.dao.MySQLBaseDao;
import com.ictwsn.util.rxtx.SerialPortListener;

@Repository
public class LoginDaoImpl extends MySQLBaseDao implements LoginDao {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs=null;
	private SerialPortListener sp=SerialPortListener.getInstance();
	@Override
	public Map<String, String> getAvaPort() {
		// TODO Auto-generated method stub
		return sp.listPort();
	}

	@Override
	public int login(String portName, int baudRate,int startBit,int stopBit) {
		if(sp.listPort().get(portName)==null)
			return 0;//没有找到串口	
		if(sp.openPort(portName)==0)
			return 0;
		if(sp.read(0,baudRate,startBit,stopBit)==0)
			return 0;
		return 1;
	}

	@Override
	public int logoff() {
		// TODO Auto-generated method stub
		try{
			sp.close();
		}catch(Exception e){
		}
		return 1;
	}



}
