package com.ictwsn.util.cantool;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import com.ictwsn.bean.CanSignalBean;
import com.ictwsn.util.CurrentConn;
/**
 * can信息及信号数据库加载类
 * @author YangYanan
 * @desc 将can信息与信号列表封装到静态map数组中,返回给调用的对象
 * @date 2017-10-13
 */
public class LoadDataBase {
	
	private static Map<Integer,ArrayList<CanSignalBean>> canSignalMap=new HashMap<Integer,ArrayList<CanSignalBean>>();
	private static Map<Integer,ArrayList<CanSignalBean>> tempCanSignalMap=new HashMap<Integer,ArrayList<CanSignalBean>>();
	
	private LoadDataBase(){}//禁止实例化

	static{   
		loadCanSignal();//静态块,只初始化一次,读取can信息数据库到map中
	}
	/**
	 * 加载Can信息与信号数据库
	 * 将can信息与信号列表封装到静态map数组中
	 * @throws SQLException 
	 */
	private static int loadCanSignal(){
		Connection conn=CurrentConn.getInstance().getConn();
		tempCanSignalMap.clear();
		try {
			String sql="select id from can_message";
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery(sql);
			while(rs.next()){
				int id=rs.getInt(1);
				ArrayList<CanSignalBean> canSignalList=new ArrayList<CanSignalBean>();
				try {
					sql="select * from can_signal where messageId="+id;
					st=conn.createStatement();
					ResultSet rs2=st.executeQuery(sql);
					while(rs2.next()) {
						CanSignalBean csb=new CanSignalBean();
						csb.setSignalName(rs2.getString(3));
						csb.setStartBit(rs2.getInt(4));
						csb.setBitLength(rs2.getInt(5));
						csb.setBitType(rs2.getInt(6));
						csb.setResolutionValue(rs2.getDouble(7));
						csb.setOffsetValue(rs2.getDouble(8));
						csb.setMinPhyValue(rs2.getDouble(9));
						csb.setMaxPhyValue(rs2.getDouble(10));
						csb.setUnit(rs2.getString(11));
						csb.setNodeNames(rs2.getString(12));
						canSignalList.add(csb);	
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				tempCanSignalMap.put(id, canSignalList);
			}
		}catch(Exception e){
			e.printStackTrace();
		}

		/**
		 * 方法的实现上为了防止多线程访问冲突,设置临时map数组
		 */
		if(canSignalMap!=null){
			canSignalMap.clear();
			canSignalMap=tempCanSignalMap;
			return 1;
		}else{
			return 0;
		}
		
	}
	/**
	 * 重新加载can信息及信号数据库
	 * 
	 * @return
	 */
	public static int reLoadCanSignal(){
		return loadCanSignal();
	}
	/**
	 * 获取can信息及信号数据库Map
	 * @return map数组
	 */
	public static Map<Integer,ArrayList<CanSignalBean>> getCanSignalMap(){
		return canSignalMap;
	}
	

}
