package com.ictwsn.dao.dbManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import com.ictwsn.util.CurrentConn;

//数据库导入函数
public class DataBaseIODao {     
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs=null;

	private static DataBaseIODao dbIODao = null;  //CurrentConn类单例对象

	private DataBaseIODao(){}

	//静态工厂方法 ,保证只有该类只有一个实例,节省内存
	public synchronized static DataBaseIODao getInstance() {
		if (dbIODao == null) {  
			dbIODao = new DataBaseIODao();
		}  
		return dbIODao;
	}
	/**
	 * 清空数据库
	 * @return
	 */
	private boolean deleteDataBase(){
		conn=CurrentConn.getInstance().getConn(); //获取连接
		int res=0;
		try {
			String sql="delete from can_message";
			pst=conn.prepareStatement(sql);  
			res=pst.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			CurrentConn.getInstance().closePreparedStatement(pst);
			CurrentConn.getInstance().closeConnection(conn);
		}
		return res!=0?true:false;
	}
	/**
	 * 更新database的message表和signal表
	 * @param canDatabaseMap
	 * @return 执行结果 true/false
	 */
	public boolean updateDatabase(Map<String,ArrayList<String>> canDatabaseMap){
		String flag = null;
		Connection conn=CurrentConn.getInstance().getConn(); //获取连接
		PreparedStatement pst=null;
		/**
		 * 删除数据库
		 */
		if(this.deleteDataBase()==false)
			return false;
		/**
		 * 更新数据库
		 */
		Iterator<String> iter = canDatabaseMap.keySet().iterator();
		String key="";
		while (iter.hasNext()){
			key = iter.next();
			Pattern pattern1 = Pattern.compile("(BO).\\s(\\d*)\\s(.*)\\:\\s(\\d)\\s(.*)");
			Matcher matcher1 = pattern1.matcher(key); 
			while (matcher1.find()) {
				try {
					String sql="insert into can_message(id,messageName,dcl,nodeName)values(?,?,?,?)";
					pst=conn.prepareStatement(sql);  
					pst.setInt(1, Integer.parseInt(matcher1.group(2)));   //设置参数
					pst.setString(2, matcher1.group(3));
					pst.setString(3, matcher1.group(4));
					pst.setString(4, matcher1.group(5));
					pst.executeUpdate();
				}catch(SQLException e) {
					e.printStackTrace();
					return false;
				}
			}

			for(String value:canDatabaseMap.get(key)){
				Pattern pattern2 = Pattern.compile("\\s(\\w*)\\s.\\s(\\d*).(\\d*).(.*).\\s.(.*)\\,(.*)\\)\\s\\[(.*)\\|(.*)\\]\\s\"(.*)\"\\s\\s(.*)");
				Matcher matcher2=pattern2.matcher(value);
				while(matcher2.find()) {
					try {
						String sql="insert into can_signal(messageId,signalName,startBit,bitLength,bitType,resolutionValue,offsetValue,minPhyValue,maxPhyValue,unit,nodeNames)values(?,?,?,?,?,?,?,?,?,?,?)";
						pst=conn.prepareStatement(sql);
						pst.setInt(1, Integer.parseInt(flag));
						pst.setString(2, matcher2.group(1));
						pst.setInt(3, Integer.parseInt(matcher2.group(2)));
						pst.setInt(4, Integer.parseInt(matcher2.group(3)));
						pst.setInt(5, Integer.parseInt(matcher2.group(4)));
						pst.setDouble(6, Double.parseDouble(matcher2.group(5)));
						pst.setDouble(7, Double.parseDouble(matcher2.group(6)));
						pst.setDouble(8, Double.parseDouble(matcher2.group(7)));
						pst.setDouble(9, Double.parseDouble(matcher2.group(8)));
						pst.setString(10, matcher2.group(9));
						pst.setString(11, matcher2.group(10));	
						pst.executeUpdate();
					}catch(SQLException e) {
						e.printStackTrace();
						return false;
					}finally{
						CurrentConn.getInstance().closePreparedStatement(pst);
						CurrentConn.getInstance().closeConnection(conn);
					}
				}
			}
		}
		return true;
	}

}

