package com.ictwsn.bean;

import java.util.ArrayList;

public class CanMsgFabricBean {
	private String canMessage;
	private String dataSeries; //heatmap字符串
	private int fabricNum;     //包含信息数
	private ArrayList<CanMegParseBean> cmpbList;
	
	public String getCanMessage() {
		return canMessage;
	}
	public void setCanMessage(String canMessage) {
		this.canMessage = canMessage;
	}
	public String getDataSeries() {
		return dataSeries;
	}
	public void setDataSeries(String dataSeries) {
		this.dataSeries = dataSeries;
	}
	public int getFabricNum() {
		return fabricNum;
	}
	public void setFabricNum(int fabricNum) {
		this.fabricNum = fabricNum;
	}
	public ArrayList<CanMegParseBean> getCmpbList() {
		return cmpbList;
	}
	public void setCmpbList(ArrayList<CanMegParseBean> cmpbList) {
		this.cmpbList = cmpbList;
	}

}

