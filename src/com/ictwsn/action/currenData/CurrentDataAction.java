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


import com.ictwsn.service.currentData.CurrentDataService;
import com.ictwsn.service.exportData.ExportDataService;
import com.ictwsn.service.systemSet.SystemSetService;
import com.ictwsn.util.GetHttpType;
import com.ictwsn.util.format.DateFormat;
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

	@Resource CurrentDataService lService;	

	/**
	 * 初始化进入页面
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/currentDataIndex.do")
	public String index(HttpServletRequest request,HttpServletResponse response,Model model){
		try{
			/**
			 * 图1 solrCloud
			 */
			StringBuffer strName=new StringBuffer();
			StringBuffer strData=new StringBuffer();
			StringBuffer HSeries=new StringBuffer();
			strName.append("{name:'dataSeries',");//type: 'area',
			strData.append("data:[");
			int time=rand.nextInt();
			for(int i=0;i<59;i++){
				strData.append("[").append(System.currentTimeMillis()).append(",").append(time).append("],");
			}
			strData.append("[").append(System.currentTimeMillis()).append(",").append(time).append("]]");
			HSeries.append(strName).append(strData).append(",marker: {enabled: true}}");

			model.addAttribute("dataSeries",HSeries.toString());
			
			return "currentData";
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * solr单线程请求
	 * @param request
	 * @param response
	 * @param model
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/currentData.do")
	public void solrRequest(HttpServletRequest request,HttpServletResponse response){
		try{
			response.getWriter().print(rand.nextInt());
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
		}
	}

}