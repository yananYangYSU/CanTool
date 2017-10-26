package com.ictwsn.service.login;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import com.ictwsn.dao.login.LoginDao;
import com.ictwsn.util.cantool.CanMessageStore;

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

	@Override
	public int saveCanSet(int baudRate, int dataBit, int stopBit) {
		
		try {
			CanMessageStore.getInstance().setBaudRate(baudRate);
			CanMessageStore.getInstance().setDataBit(dataBit);
			CanMessageStore.getInstance().setStopBit(stopBit);
		} catch (Exception e) {
			 e.printStackTrace();
			 return 0;
		}
		return 1;
	}

 


	


}
