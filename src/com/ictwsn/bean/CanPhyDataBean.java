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
public class CanPhyDataBean {
	
	private int autoId;
	private String ecuName;
	private double data;
    private String unit;
    private String time;
	public int getAutoId() {
		return autoId;
	}
	public void setAutoId(int autoId) {
		this.autoId = autoId;
	}
	public String getEcuName() {
		return ecuName;
	}
	public void setEcuName(String ecuName) {
		this.ecuName = ecuName;
	}
	public double getData() {
		return data;
	}
	public void setData(double data) {
		this.data = data;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}

}
