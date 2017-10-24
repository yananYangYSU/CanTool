package com.ictwsn.dao.systemSet;

import java.util.List;
import com.ictwsn.bean.CanMessageBean;
import com.ictwsn.bean.CanSignalBean;
 
public interface SystemSetDao {
	public List<CanMessageBean> getCanMessageList();
	public List<CanSignalBean> getCanSignalListStr(int id);
	public int getDclById(int id);
}
