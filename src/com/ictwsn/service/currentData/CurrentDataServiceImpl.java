package com.ictwsn.service.currentData;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.ictwsn.dao.currentData.CurrentDataDao;



@Service
public class CurrentDataServiceImpl implements CurrentDataService {

	@Resource CurrentDataDao dao;



	@Override
	public String getRealDataInitStr(String id,String ecuName) {
		// TODO Auto-generated method stub
		return dao.getRealDataInitStr(id,ecuName);
	}

	


}
