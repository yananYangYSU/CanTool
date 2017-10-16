package com.ictwsn.action.currenData;

import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.bean.CanSignalBean;
import com.ictwsn.service.currentData.CurrentDataService;
import com.ictwsn.service.exportData.ExportDataService;
import com.ictwsn.service.systemSet.SystemSetService;
import com.ictwsn.util.GetHttpType;
import com.ictwsn.util.format.DateFormats;
/**
 * 运营商控制类
 * @author YangYanan
 * @desc 包含运营商对终端用户的增删改查请求处理
 * @date 2017-8-18
 */
@Controller
public class CurrentDataAction {
	static Logger logger=Logger.getLogger(CurrentDataAction.class.getName());
	Random rand =new Random();

	@Resource CurrentDataService cService;	

	/**
	 * 初始化进入实时数据页面
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/currentDataIndex.do")
	public String currentDataIndex(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="id",required=true) String id,
			@RequestParam(value="signalName",required=true) String signalName){
		try{
			/**
			 * 图1 solrCloud
			 */
			StringBuffer strName=new StringBuffer();
			StringBuffer strData=new StringBuffer();
			StringBuffer HSeries=new StringBuffer();
			strName.append("{name:'dataSeries',");//type: 'area',
			strData.append("data:[");
			CanPhyDataBean cpdb=cService.getRealPhyData(id,signalName);
			CanSignalBean csb=cService.getCanSignal(id,signalName);
			long time=DateFormats.getInstance().dateStringToTime(cpdb.getTime());
			for(int i=0;i<59;i++){
				strData.append("[").append(time).append(",").append(cpdb.getData()).append("],");
			}
			strData.append("[").append(time).append(",").append(cpdb.getData()).append("]]");
			HSeries.append(strName).append(strData).append(",marker: {enabled: true}}");

			model.addAttribute("dataSeries",HSeries.toString());
			model.addAttribute("maxPhyValue",csb.getMaxPhyValue());
			model.addAttribute("minPhyValue",csb.getMinPhyValue());
			model.addAttribute("unit",csb.getUnit());
			
			return "currentData";
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 实时数据单次请求
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping("/currentDataRequest.do")
	public void currentDataRequest(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="id",required=true) String id,
			@RequestParam(value="ecuName",required=true) String ecuName){
		try{
			response.getWriter().print(cService.getRealPhyData(id, ecuName));
			
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
		}
	}

}