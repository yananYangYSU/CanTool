package com.ictwsn.bean;

public class CanPhyDataBean {
	
	private int autoId;
	private String signalName;
	private double phyValue;
    private String unit;
    private String binaryStr;
    private String hexStr;
    private String time;

   
	public int getAutoId() {
		return autoId;
	}
	public void setAutoId(int autoId) {
		this.autoId = autoId;
	}
	public String getSignalName() {
		return signalName;
	}
	public void setSignalName(String signalName) {
		this.signalName = signalName;
	}
	public double getPhyValue() {
		return phyValue;
	}
	public void setPhyValue(double phyValue) {
		this.phyValue = phyValue;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getBinaryStr() {
		return binaryStr;
	}
	public void setBinaryStr(String binaryStr) {
		this.binaryStr = binaryStr;
	}
	public String getHexStr() {
		return hexStr;
	}
	public void setHexStr(String hexStr) {
		this.hexStr = hexStr;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		if(time!=null&&time.length()>=19)
			this.time = time.substring(0,19);
		else
			this.time=time;
	}
	public String toString(){
		return signalName+" "+phyValue+" "+unit+" "+binaryStr+" "+hexStr;
	}

}
