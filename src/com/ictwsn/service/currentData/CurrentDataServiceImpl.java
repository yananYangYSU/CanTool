package com.ictwsn.service.currentData;

import java.util.ArrayList;

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
	public CanPhyDataBean getRealPhyData(int id,String signalName) {
		// TODO Auto-generated method stub
		return dao.getRealPhyData(id,signalName);
	}



	@Override
	public CanSignalBean getCanSignal(int id, String signalName) {
		// TODO Auto-generated method stub
		return dao.getCanSignal(id,signalName);
	}



	@Override
	public ArrayList<CanPhyDataBean> getRealDataList(int id, String signalName) {
		// TODO Auto-generated method stub
		ArrayList<CanPhyDataBean> resultList=new ArrayList<CanPhyDataBean>();
		ArrayList<CanMsgDataBean> cmdbList=dao.getMessageList(signalName);
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
	public ArrayList<CanPhyDataBean> getRealDataList(int id, String signalName,String startTime) {
		ArrayList<CanPhyDataBean> resultList=new ArrayList<CanPhyDataBean>();
		ArrayList<CanMsgDataBean> cmdbList=dao.getMessageList(signalName,startTime);
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
