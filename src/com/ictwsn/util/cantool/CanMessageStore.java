package com.ictwsn.util.cantool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.ictwsn.bean.CanMsgDataBean;
import com.ictwsn.util.CurrentConn;

/**
 * canMessage信息的一个内存仓库
 * @author yanan
 *
 */
public class CanMessageStore {
	private static int canState=1;//默认开启
	private static int canSpeed=0;//默认0ms
	private static int baudRate=9600;
	private static int dataBit=8;
	private static int stopBit=1;
	
	private CanMessageStore(){}//禁止实例化
	private static CanMessageStore store = null;  //CurrentConn类单例对象
	//静态工厂方法 ,保证只有该类只有一个实例,节省内存
	public synchronized static CanMessageStore getInstance() {
		if (store == null) {  
			store = new CanMessageStore();
		}  
		return store;
	}
	public void setMessage(String messageStr){
		CanMsgDataBean cmdb=UncodeCanMsg.getInstance().splitDataStr(messageStr);
		if(cmdb.getDcl()!=-1){//数据合法
			//CanMessageStore.canAcceptMsgStr=messageStr;
			insertCanMessage(cmdb);
		}

	}
	private int insertCanMessage(CanMsgDataBean cmdb) {
		Connection conn = null;
		PreparedStatement pst = null;
		int result=0;
		String sql="insert into can_msg_data(id,dcl,byteStr,time)values(?,?,?,?)";
		try{
			conn=CurrentConn.getInstance().getConn();
			pst=conn.prepareStatement(sql);
			pst.setString(1,cmdb.getId());
			pst.setInt(2,cmdb.getDcl());
			pst.setString(3,cmdb.listToString());
			pst.setString(4,cmdb.getTime());
			result=pst.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			CurrentConn.getInstance().closePreparedStatement(pst);
			CurrentConn.getInstance().closeConnection(conn);
		}
		return result;
	}
	public void setCanState(int canState){
		CanMessageStore.canState=canState; 
	}
	public int getCanState(){
		return canState; 
	}
	public void setCanSpeed(int canSpeed){
		CanMessageStore.canSpeed=canSpeed; 
	}
	public int getCanSpeed(){
		return canSpeed; 
	}
	public int getBaudRate() {
		return baudRate;
	}
	public void setBaudRate(int baudRate) {
		CanMessageStore.baudRate = baudRate;
	}
	public int getDataBit() {
		return dataBit;
	}
	public void setDataBit(int DataBit) {
		CanMessageStore.dataBit = DataBit;
	}
	public int getStopBit() {
		return stopBit;
	}
	public void setStopBit(int stopBit) {
		CanMessageStore.stopBit = stopBit;
	}
	public static void main(String[] a){
		//CanMessageStore.setMessage("t03d80011223344556677\r");//存储起来
	}


}
