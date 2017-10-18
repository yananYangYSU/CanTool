package com.ictwsn.dao.login;
import java.util.Map;

public interface LoginDao {
	public Map<String, String> getAvaPort();  //获取当前可用的所有串口,封装成数组
	public int login(String portName,int baudRate,int startBit,int stopBit); //连接串口
	public int logoff(); //断开串口
}
