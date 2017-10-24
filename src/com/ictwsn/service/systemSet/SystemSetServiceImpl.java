package com.ictwsn.service.systemSet;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.ictwsn.bean.CanMessageBean;
import com.ictwsn.bean.CanSignalBean;
import com.ictwsn.dao.systemSet.SystemSetDao;

@Service
public class SystemSetServiceImpl implements SystemSetService{
	@Resource SystemSetDao dao;

	@Override
	public List<CanMessageBean> getCanMessageList() {
		// TODO Auto-generated method stub
		return dao.getCanMessageList();
	}

	@Override
	public String getCanSignalListStr(int id) {
		List<CanSignalBean> csbList=dao.getCanSignalListStr(id);
		StringBuffer csbListStr=new StringBuffer();
		for(CanSignalBean csb:csbList){
			csbListStr.append(csb.getSignalName()).append("=0").append("\r\n");
		}
		return csbListStr.toString();
	}

	@Override
	public int getDclById(int id) {
		// TODO Auto-generated method stub
		return dao.getDclById(id);
	}
}

