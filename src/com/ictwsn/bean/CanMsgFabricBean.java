package com.ictwsn.bean;

import java.util.ArrayList;

public class CanMsgFabricBean {
	private String canMessage;
	private String dataSeries;
	private int fabricNum;
	private ArrayList<String> indexList;
	
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
	public ArrayList<String> getIndexList() {
		return indexList;
	}
	public void setIndexList(ArrayList<String> indexList) {
		this.indexList = indexList;
	}

}
