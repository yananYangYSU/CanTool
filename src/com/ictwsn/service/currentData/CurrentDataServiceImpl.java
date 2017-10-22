package com.ictwsn.service.currentData;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.ictwsn.bean.CanMsgDataBean;
import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.bean.CanSignalBean;
import com.ictwsn.dao.currentData.CurrentDataDao;
import com.ictwsn.util.cantool.UncodeCanMsg;



@Service
public class CurrentDataServiceImpl implements CurrentDataService {

	@Resource CurrentDataDao dao;

	@Override
	public CanSignalBean getCanSignal(int id, String signalName) {
		// TODO Auto-generated method stub
		return dao.getCanSignal(id,signalName);
	}



	@Override
	public List<CanPhyDataBean> getRealDataList(int id, String signalName) {
		// TODO Auto-generated method stub
		List<CanPhyDataBean> resultList=new ArrayList<CanPhyDataBean>();
		List<CanMsgDataBean> cmdbList=dao.getMessageList(signalName);
		for(CanMsgDataBean cmdb:cmdbList){
			ArrayList<CanPhyDataBean> cpdbList=UncodeCanMsg.getInstance().parseCanData(cmdb);
			for(CanPhyDataBean cpdb:cpdbList){
				if(signalName!=null&&signalName.equals(cpdb.getSignalName())){
					resultList.add(cpdb);
				}
			}
		}
		return resultList;
	}



	@Override
	public List<CanPhyDataBean> getRealDataList(int id, String signalName,String startTime) {
		List<CanPhyDataBean> resultList=new ArrayList<CanPhyDataBean>();
		List<CanMsgDataBean> cmdbList=dao.getMessageList(signalName,startTime);
		for(CanMsgDataBean cmdb:cmdbList){
			ArrayList<CanPhyDataBean> cpdbList=UncodeCanMsg.getInstance().parseCanData(cmdb);
			for(CanPhyDataBean cpdb:cpdbList){
				if(signalName!=null&&signalName.equals(cpdb.getSignalName())){
					resultList.add(cpdb);
				}
			}
		}
		return resultList;
	}

	


}
