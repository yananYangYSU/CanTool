package com.ictwsn.dao.exportData;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;
import com.ictwsn.dao.MySQLBaseDao;
import com.ictwsn.util.CurrentConn;


@Repository
public class ExportDataDaoImpl extends MySQLBaseDao implements ExportDataDao {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs=null;
	
	@Override
	public Map<Integer, ArrayList<String>> getData() {
		Map<Integer,ArrayList<String>> map=new HashMap<Integer,ArrayList<String>>();
		try {
			conn=CurrentConn.getInstance().getConn();
			String sql="select * from can_msg_data";
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			int row=rs.getFetchSize();
			while(rs.next()) {
				ArrayList<String> List=new ArrayList<String>();
				List.add(rs.getString(1));
				List.add(rs.getString(2));
				List.add(rs.getString(3));
				List.add(rs.getString(4));
				List.add(rs.getString(5));
				System.out.println(rs.getString(1)+rs.getString(2)+rs.getString(3)+rs.getString(4)+rs.getString(5));
				for(int i=0;i<row;i++) {
					map.put(i,List);
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			CurrentConn.getInstance().closeConnection(conn);
			CurrentConn.getInstance().closePreparedStatement(pst);
			CurrentConn.getInstance().closeResultSet(rs);
		}
		return map;
	}
	
	
	
	



}
