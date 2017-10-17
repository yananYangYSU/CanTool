package com.ictwsn.dao.dbManage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Repository;
import com.ictwsn.dao.MySQLBaseDao;
import com.ictwsn.util.CurrentConn;
import com.ictwsn.util.format.DataBaseFactory;
import com.ictwsn.util.format.JsonFactoryImpl;
import com.ictwsn.util.format.XmlFactoryImpl;

@Repository
public class DatabaseDaoImpl extends MySQLBaseDao implements DatabaseDao {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs=null;
	private PreparedStatement pst2 = null;
	private ResultSet rs2=null;
	private DataBaseFactory dbFactory;
	@Override
	public boolean exportDataBase(String fileType) {
		if(fileType!=null&&fileType.equals("xml")){
			dbFactory=XmlFactoryImpl.getInstance();//exportDataBase.xml
		}else{
			dbFactory=JsonFactoryImpl.getInstance();//exportDataBase.json
		}
		boolean result=dbFactory.exportFile(this.getCanDataBaseMap());

		return result;
	}
	@Override
	public boolean importDataBase(String fileType, String fileName) {
		if(fileType!=null&&fileType.equals("xml")){
			dbFactory=XmlFactoryImpl.getInstance();//exportDataBase.xml
		}else{
			dbFactory=JsonFactoryImpl.getInstance();//exportDataBase.json
		}
		Map<String,ArrayList<String>> databaseMap=dbFactory.importFile(fileName);
		boolean result=this.updateDataBase(databaseMap);

		return result;
	}
	public static void main(String[] args){
		DatabaseDaoImpl a=new DatabaseDaoImpl();
		a.getCanDataBaseMap();
	}
	/**
	 * 查询数据库message和signal表,组合各个属性成字符串,封装到map数组中
	 * @return 字符串形式报存的数据库信息数组
	 */
	private Map<String, ArrayList<String>> getCanDataBaseMap(){
		Map<String,ArrayList<String>> map=new HashMap<String, ArrayList<String>>();
		StringBuffer msgStr=new StringBuffer();
		try{
			String sql="SELECT id,messageName,dcl,nodeName from can_message";
			conn=CurrentConn.getInstance().getConn();
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				int id=rs.getInt(1);
				sql="SELECT signalName,startBit,bitLength,bitType,resolutionValue,offsetValue,minPhyValue,maxPhyValue,unit,nodeNames from can_signal where messageId=?";
				pst2=conn.prepareStatement(sql);
				pst2.setInt(1,id);
				rs2=pst2.executeQuery();
				ArrayList<String> sglList=new ArrayList<String>();
				while(rs2.next()){
					//SG_ CDU_HVACAutoModeButtonSt : 2|1@0+ (1,0) [0|1] ""  HVAC
					msgStr.setLength(0);
					msgStr.append("SG_ ").append(rs2.getString(1)).append(" : ");
					msgStr.append(rs2.getString(2)).append("|").append(rs2.getString(3)).append("@");
					msgStr.append(rs2.getString(4)).append("+ (").append(rs2.getString(5)).append(",");
					msgStr.append(rs2.getString(6)).append(") [").append(rs2.getString(7)).append("|").append(rs2.getString(8)).append("] ");
					msgStr.append("\"").append(rs2.getString(9)).append("\"  ").append(rs2.getString(10));
					sglList.add(msgStr.toString());
				}
				//BO_ 856 CDU_1: 8 CDU
				msgStr.setLength(0);
				msgStr.append("BO_ ").append(rs.getString(1)).append(" ").append(rs.getString(2));
				msgStr.append(": ").append(rs.getString(3)).append(" ").append(rs.getString(4));
				map.put(msgStr.toString(),sglList);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			CurrentConn.getInstance().closeResultSet(rs2);
			CurrentConn.getInstance().closePreparedStatement(pst2);
			CurrentConn.getInstance().closeResultSet(rs);
			CurrentConn.getInstance().closePreparedStatement(pst);
			CurrentConn.getInstance().closeConnection(conn);
		}
		return map;

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
	public boolean updateDataBase(Map<String,ArrayList<String>> canDatabaseMap){
		if(canDatabaseMap.size()==0)
			return false;
		
		Connection conn=CurrentConn.getInstance().getConn(); //获取连接
		PreparedStatement pst=null;
		/**
		 * 清空message和signal表
		 */
		this.deleteDataBase();
		/**
		 * 更新数据库message表
		 */
		Iterator<String> iter = canDatabaseMap.keySet().iterator();
		String key="";
		int id=0;
		while (iter.hasNext()){
			key = iter.next();
			Pattern pattern1 = Pattern.compile("(BO).\\s(\\d*)\\s(.*)\\:\\s(\\d)\\s(.*)");
			Matcher matcher1 = pattern1.matcher(key); 
			if (matcher1.find()) {
				try {
					id=Integer.parseInt(matcher1.group(2));
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
			/**
			 * 更新signal
			 */
			for(String value:canDatabaseMap.get(key)){
				Pattern pattern2 = Pattern.compile("\\s(\\w*)\\s.\\s(\\d*).(\\d*).(.*).\\s.(.*)\\,(.*)\\)\\s\\[(.*)\\|(.*)\\]\\s\"(.*)\"\\s\\s(.*)");
				Matcher matcher2=pattern2.matcher(value);
				if(matcher2.find()) {
					try {
						String sql="insert into can_signal(messageId,signalName,startBit,bitLength,bitType,resolutionValue,offsetValue,minPhyValue,maxPhyValue,unit,nodeNames)values(?,?,?,?,?,?,?,?,?,?,?)";
						pst=conn.prepareStatement(sql);
						pst.setInt(1,id);
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
					}
				}
			}
		}

		CurrentConn.getInstance().closePreparedStatement(pst);
		CurrentConn.getInstance().closeConnection(conn);

		return true;
	}
	/**
	 * 查询数据库的message和signal信息，将属性组成组成字符串键值对，封装至map集合
	 * @return map数据集合
	 */
	public Map<String,ArrayList<String>> getTreeData(){
		Map<String,ArrayList<String>> nameMap=new HashMap<String,ArrayList<String>>();
		String sql=null;
		ResultSet rs2=null;
		ArrayList<String> signalName=new ArrayList<String>();
		try {
			sql="select * from can_message";
			conn=CurrentConn.getInstance().getConn();
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			while(rs.next()){
				int id=rs.getInt(1);
				try {
					sql="select signalName from can_signal where messageId="+id;
					pst=conn.prepareStatement(sql);
					rs2=pst.executeQuery();
					while(rs2.next()) {
						signalName.add(rs2.getString(1));	
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				nameMap.put("BO_ "+id+" "+rs.getString(2)+": "+rs.getInt(3)+" "+rs.getString(4), signalName);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			CurrentConn.getInstance().closePreparedStatement(pst);
			CurrentConn.getInstance().closeConnection(conn);
			CurrentConn.getInstance().closeResultSet(rs2);
			CurrentConn.getInstance().closeResultSet(rs);
		}
		return nameMap;
	}
}
