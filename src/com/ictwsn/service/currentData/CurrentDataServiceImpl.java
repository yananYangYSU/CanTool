package com.ictwsn.service.currentData;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.bean.CanSignalBean;
import com.ictwsn.dao.currentData.CurrentDataDao;



@Service
public class CurrentDataServiceImpl implements CurrentDataService {

	@Resource CurrentDataDao dao;



	@Override
	public CanPhyDataBean getRealPhyData(String id,String signalName) {
		// TODO Auto-generated method stub
		return dao.getRealPhyData(id,signalName);
	}



	@Override
	public CanSignalBean getCanSignal(String id, String signalName) {
		// TODO Auto-generated method stub
		return dao.getCanSignal(id,signalName);
	}

	


}
