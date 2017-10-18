package com.ictwsn.service.login;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.ictwsn.dao.login.LoginDao;

@Service(value="lService")
@Scope("prototype")
public class LoginServiceImpl implements LoginService {
	
	@Resource LoginDao dao;

	@Override
	public Map<String,String> getAvaPort() {
		// TODO Auto-generated method stub
		return dao.getAvaPort();
	}

	@Override
	public int login(String portName,int baudRate,int startBit,int stopBit) {
		// TODO Auto-generated method stub
		return dao.login(portName, baudRate, startBit, stopBit);
	}

	@Override
	public int logoff() {
		// TODO Auto-generated method stub
		return dao.logoff();
	}

 


	


}
