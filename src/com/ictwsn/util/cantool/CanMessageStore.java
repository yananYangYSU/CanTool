package com.ictwsn.util.cantool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.ictwsn.bean.CanMsgDataBean;
import com.ictwsn.util.CurrentConn;
import com.ictwsn.util.format.DataFormats;

/**
 * canMessage信息的一个内存仓库
 * @author yanan
 *
 */
public class CanMessageStore {
	private static String canAcceptMsgStr="T12FFFFF7800111213141516FF\r";
	//private static String canSendMsgStr="";
	private static String lastCanAcceptMsgStr="";
	private static String tempStr="";
	
	private CanMessageStore(){}//禁止实例化
	private static CanMessageStore store = null;  //CurrentConn类单例对象
	//静态工厂方法 ,保证只有该类只有一个实例,节省内存
	public synchronized static CanMessageStore getInstance() {
		if (store == null) {  
			store = new CanMessageStore();
		}  
		return store;
	}
	/**
	 * 从CanMessage仓库中获取指定id的信息
	 * @param id can信息id
	 * @return id符号返回字符串,否则返回-1
	 */
	public String getAcceptMsgStr(int id){
		boolean findFlag=false;
	
		while(!findFlag){
			tempStr=canAcceptMsgStr;
			if(tempStr.equals(lastCanAcceptMsgStr)){
				
			}else{
				if(tempStr.startsWith("t")){
					if(Integer.parseInt(tempStr.substring(1,4),16)==id){
						break;
					}
				}else{
					if(Integer.parseInt(tempStr.substring(1,9),16)==id){
						break;
					}
				}
			}
			
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {}
		}
		
		lastCanAcceptMsgStr=tempStr;
		
		return tempStr;


	}
	public void setMessage(String messageStr){
		CanMsgDataBean cmdb=UncodeCanMsg.getInstance().splitDataStr(messageStr);
		if(cmdb.getDcl()!=-1){//数据合法
			canAcceptMsgStr=messageStr;
			insertCanMessage(cmdb);
		}

	}
	public int insertCanMessage(CanMsgDataBean cmdb) {
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

	public static void main(String[] a){
		//CanMessageStore.setMessage("t03d80011223344556677\r");//存储起来
	}


}
