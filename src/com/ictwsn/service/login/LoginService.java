package com.ictwsn.service.login;

import java.util.Map;


/**
 * 登录service层接口
 * @author YangYanan
 * @desc
 * @date 2017-8-18
 */
public interface LoginService {
	public Map<String,String> getAvaPort(); //获取当前可用的所有串口,封装成数组
	public int login(String portName,int baudRate,int startBit,int stopBit); //连接串口
	public int logoff(); //断开串口
}
