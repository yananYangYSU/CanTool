package com.ictwsn.util.cantool;
/**
 * canMessage信息的一个内存仓库
 * @author yanan
 *
 */
public class CanMessageStore {
	private static String canAcceptMsgStr="T12FFFFF7800111213141516FF0000\r";
	//private static String canSendMsgStr="";
	
	private CanMessageStore(){}//禁止实例化

	/**
	 * 从CanMessage仓库中获取指定id的信息
	 * @param id can信息id
	 * @return id符号返回字符串,否则返回-1
	 */
	public static String getAcceptMsgStr(String id){
		if(canAcceptMsgStr.contains(id))
			return canAcceptMsgStr;
		else
			return "-1";
	}

}
