package com.ictwsn.bean;

import java.util.ArrayList;

/**
 * can信息实体类
 * 用于cantool装置和cantoolApp直接的信息传递
 * @author yanan
 *id:为CAN标准ID的范围0-0x7FF. 
 *dcl:表示数据长度DLC，范围0..8
 *data:表示1字节(8bit)16进制数据,DD的数量由L的数值决定
 *interval:表示range 00000-FFFF,代表周期发送的毫秒数。
 *0000代表是发送一次，0001-FFFF代表CanTool装置以mmmm为周期，发送该命令到总线
 */
public class CanDataBean {
	
	private String id;
	private int dcl;
	private ArrayList<String> data;
    private String interval;
    
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
    
	public String toString(){
		return "id:"+this.id+"dcl:"+this.dcl+"interval:"+this.interval+"dataSize:"+this.data.toString();
		
	}
}
