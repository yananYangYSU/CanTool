package com.ictwsn.service.exportData;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
 
import com.ictwsn.dao.exportData.ExportDataDao;

@Service(value="oService")
@Scope("prototype")
public class ExportDataServiceImpl implements ExportDataService {
	
	@Resource ExportDataDao dao;
	 

	
	


}
