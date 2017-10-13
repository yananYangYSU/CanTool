package com.ictwsn.bean;
/**
 * canMessageBean实体类
 * @desc 对应数据库can_message表,
 * 该数据结构用于存储例如:"BO_ 792 BCM_BCAN_1: 8 BCM"的message数据库信息
 * @author yanan
 */
public class CanMessageBean {
	private int id;                //id,唯一值
	private String messageName;    //信息名称
	private int dcl;               //信息长度 dcl=8代表 8个两位16进制数
	private String nodeName;       //发送此信息的Node名
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMessageName() {
		return messageName;
	}
	public void setMessageName(String messageName) {
		this.messageName = messageName;
	}
	public int getDcl() {
		return dcl;
	}
	public void setDcl(int dcl) {
		this.dcl = dcl;
	}
	public String getNodeName() {
		return nodeName;
	}
	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}
	

}
