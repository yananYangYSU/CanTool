package com.ictwsn.util.cantool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	 */
	private static int loadCanSignal(){
		ArrayList<CanSignalBean> canSignalList=new ArrayList<CanSignalBean>();
		CanSignalBean csb=new CanSignalBean();
		Connection conn=CurrentConn.getInstance().getConn();
		try {
			String sql="select * form can_signal";
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				csb.setSignalName(rs.getString(3));
				csb.setStartBit(rs.getInt(4));
				csb.setBitLength(rs.getInt(5));
				csb.setBitType(rs.getInt(6));
				csb.setResolution(rs.getDouble(7));
				csb.setOffset(rs.getDouble(8));
				csb.setMinValue(rs.getDouble(9));
				csb.setMaxValue(rs.getDouble(10));
				csb.setUnit(rs.getString(11));
				csb.setNodeNames(rs.getString(12));
				canSignalList.add(csb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		/*
		csb=new CanSignalBean();
		csb.setSignalName("CDU_HVACAirCirCfg");
		csb.setStartBit(16);
		csb.setBitLength(12);
		csb.setBitType(0);
		csb.setResolution(1);
		csb.setOffset(0);
		csb.setMinValue(0);
		csb.setMaxValue(100);
		csb.setUnit("℃");
		csb.setNodeNames("HVAC4,HAVC5,HAVC6");
		canSignalList.add(csb);
		*/
		tempCanSignalMap.clear();
		tempCanSignalMap.put(318767095,canSignalList);
		tempCanSignalMap.put(65,null);
		
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
	 * 
	 * @return
	 */
	public static Map<Integer,ArrayList<CanSignalBean>> getCanSignalMap(){
		return canSignalMap;
	}
	

}
