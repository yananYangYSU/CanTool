package com.ictwsn.service.exportData;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

/**
 * 运营商service层接口类
 * @author YangYanan
 * @desc
 * @date 2017-8-18
 */
public interface ExportDataService {
	public boolean exportCSVData(String startTime,String endTime,int count);
	
}
