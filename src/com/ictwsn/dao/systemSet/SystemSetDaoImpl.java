package com.ictwsn.dao.systemSet;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;
import com.ictwsn.bean.CanMessageBean;
import com.ictwsn.bean.CanSignalBean;
import com.ictwsn.dao.MySQLBaseDao;

@Repository
public class SystemSetDaoImpl extends MySQLBaseDao implements SystemSetDao {

	@Override
	public List<CanMessageBean> getCanMessageList(){
		String sql="SELECT id,messageName from can_message";
		List<CanMessageBean> cmbList=jt.query(sql,new ResultSetExtractor<List<CanMessageBean>>() {
			public List<CanMessageBean> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<CanMessageBean> list = new ArrayList<CanMessageBean>();
				while(rs.next()){
					CanMessageBean bean=new CanMessageBean();
					bean.setId(rs.getInt(1));
					bean.setMessageName(rs.getString(2));
					list.add(bean);
				}
				return list;
			}
		});
		return cmbList;
	}

	@Override
	public List<CanSignalBean> getCanSignalListStr(int id){
		String sql="select signalName from can_signal where messageId=?";
		List<CanSignalBean> csbList=jt.query(sql,new Object[]{id},new ResultSetExtractor<List<CanSignalBean>>(){
			public List<CanSignalBean> extractData(ResultSet rs) throws SQLException, DataAccessException {
				List<CanSignalBean> list=new ArrayList<CanSignalBean>();
				while(rs.next()){
					CanSignalBean bean=new CanSignalBean();
					bean.setSignalName(rs.getString(1));
					list.add(bean);
				}
				return list;
			}
		});
		return csbList;
	}

	@Override
	public int getDclById(int id) {
		return this.jt.queryForInt("select dcl from can_message where id=?",new Object[]{id});
		
	}
}