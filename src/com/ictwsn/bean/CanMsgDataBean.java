package com.ictwsn.bean;

import java.util.ArrayList;

/**
 * can信息实体类
 * 用于cantool装置和cantoolApp直接的信息传递
 * @author yanan
 * @describe
 * id:为CAN标准ID的范围0-0x7FF. 
 * dcl:表示数据长度DLC，范围0..8
 * data:表示1字节(8bit)16进制数据,DD的数量由L的数值决定
 * interval:表示range 00000-FFFF,代表周期发送的毫秒数。
 * 0000代表是发送一次，0001-FFFF代表CanTool装置以mmmm为周期，发送该命令到总线
 */
public class CanMsgDataBean {
	
	private String id;
	private int dcl;
	private ArrayList<String> data;
    private String interval;
    private String time;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getDcl() {
		return dcl;
	}
	public void setDcl(int dcl) {
		this.dcl = dcl;
	}
	public ArrayList<String> getData() {
		return data;
	}
	public void setData(ArrayList<String> data) {
		this.data = data;
	}
	public String getInterval() {
		return interval;
	}
	public void setInterval(String interval) {
		this.interval = interval;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String toString(){
		return "id:"+this.id+"dcl:"+this.dcl+"interval:"+this.interval+"dataSize:"+this.data.toString();
		
	}
	/**
	 * ArrayList转字符串
	 * @param list String类型的ArrayList数组例如 {"1A","2B","FF"}
	 * @return "1A 2B FF "
	 */
	public String listToString(){
		if(this.data.size()==0)
			return "";
		StringBuffer str=new StringBuffer();
		for(String i:this.data)
			str.append(i).append(" ");
		return str.toString();
	}
}
