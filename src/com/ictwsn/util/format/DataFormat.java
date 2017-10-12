package com.ictwsn.util.format;
/**
 * 数据格式化工具类
 * @author YangYanan
 * @desc 进制转换,字符串倒置等
 * @date 2017-8-18
 */
public class DataFormat {
	private static DataFormat dataFormat=null;
	
	private DataFormat(){}
	
	public synchronized static DataFormat getInstance() {
		if (dataFormat == null) {  
			dataFormat = new DataFormat();
		}  
		return dataFormat;
	}
	/**
	 * 2位16进制数转8位2进制
	 * @param hexStr 2位16进制数 例如 1F 
	 * @return 8位2进制,左端补0
	 */
	public String hexToBinary(String hexStr){
		String zeroStr="00000000";
		String binStr=Integer.toBinaryString(Integer.parseInt(hexStr,16));//16进制转2进制
		return zeroStr.substring(0,8-binStr.length())+binStr;//进行补位操作,左端补0凑成8位二进制数
	}
	/**
	 * 16进制数转10进制
	 * @param hexStr 16进制数 例如 132332F 
	 * @return 10进制整数
	 */
	/*public int hexToOctal(String hexStr){
		int OctalStr=Integer.parseInt(hexStr,16);//16进制转10进制
		return OctalStr;
	}*/
	/**
     * 字符串倒置输出
     * @param oldStr 旧字符串 例如:"12345"
     * @return 倒置后的新字符串 例如:"54321"
     */
	/*public static String reverseStr(String oldStr){
		char[] tmp=oldStr.toCharArray();
		int length=tmp.length;
		String newStr="";
		for(int i=length-1;i>=0;i--)
			newStr+=tmp[i];
		return newStr;
	}*/

}
