package com.ictwsn.bean;
/**
 * canSignalBean实体类
 * @desc 对应数据库can_signal表,
 * 该数据结构用于存储例如:"SG_ BCM_KeySt : 1|2@0+ (1,0) [1|3] ""  PEPS,ICM,AVM,CDU,HVAC"的数据库信息
 * @author yanan
 * 
 */
public class CanSignalBean {
	private String signalName; //信号名称
	private int startBit;      //开始字节位置索引
	private int bitLength;     //字节段长度
	private int bitType;       //格式类型 0 Motorola 1 Intel
	private double resolution; //A的值
	private double offset;     //B的值
	private double minValue;   //物理值最大值
	private double maxValue;   //物理值最小值
	private String unit;       //物理单位
	private String nodeNames;  //要发送的节点名称,逗号分隔
	
	public String getSignalName() {
		return signalName;
	}
	public void setSignalName(String signalName) {
		this.signalName = signalName;
	}
	public int getStartBit() {
		return startBit;
	}
	public void setStartBit(int startBit) {
		this.startBit = startBit;
	}
	public int getBitLength() {
		return bitLength;
	}
	public void setBitLength(int bitLength) {
		this.bitLength = bitLength;
	}
	public int getBitType() {
		return bitType;
	}
	public void setBitType(int bitType) {
		this.bitType = bitType;
	}
	public double getResolution() {
		return resolution;
	}
	public void setResolution(double resolution) {
		this.resolution = resolution;
	}
	public double getOffset() {
		return offset;
	}
	public void setOffset(double offset) {
		this.offset = offset;
	}
	public double getMinValue() {
		return minValue;
	}
	public void setMinValue(double minValue) {
		this.minValue = minValue;
	}
	public double getMaxValue() {
		return maxValue;
	}
	public void setMaxValue(double maxValue) {
		this.maxValue = maxValue;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getNodeNames() {
		return nodeNames;
	}
	public void setNodeNames(String nodeNames) {
		this.nodeNames = nodeNames;
	}

}
