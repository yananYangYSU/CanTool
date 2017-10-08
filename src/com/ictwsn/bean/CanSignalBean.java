package com.ictwsn.bean;
/**
 * canSignalBean实体类
 * @author yanan
 *
 */
public class CanSignalBean {
	private String signalName;
	private int startBit;
	private int bitLength;
	private int bitType;
	private double resolution;
	private double offset;
	private double minValue;
	private double maxValue;
	private String unit;
	private String[] nodeNames;
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
	public String[] getNodeNames() {
		return nodeNames;
	}
	public void setNodeNames(String[] nodeNames) {
		this.nodeNames = nodeNames;
	}

}
