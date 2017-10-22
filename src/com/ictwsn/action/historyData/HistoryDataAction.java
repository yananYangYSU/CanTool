package com.ictwsn.action.historyData;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.ictwsn.service.historyData.HistoryDataService;


/**
 * 运营商控制类
 * 
 * @author YangYanan
 * @desc 包含运营商对终端用户的增删改查请求处理
 * @date 2017-8-18
 */
@Controller
public class HistoryDataAction {
	private static Logger logger = Logger.getLogger(HistoryDataAction.class.getName());
	@Resource HistoryDataService hService;

	/**
	 * 显示信息字符串的物理数据组成
	 * @param request
	 * @param response
	 * @param model
	 * @param page
	 * @return
	 */
	@RequestMapping("/showDataFabric.do")
	public String showDataFabric(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="page",required=true) int page) {
		try{
			int totalCount=hService.getHistoryDataCount();  //查询数据总条数
			int size=10;						  			   				   //每页显示大小
			int maxPage=(totalCount%size==0)?totalCount/size:totalCount/size+1;//最大页数
			page=(page==0)?1:page;			   					               //当前第几页
			int number=(page-1)*size;
            /**
             * 获取实时数据表格信息
             */
			String historyData=hService.showDataFabric(number,size);
			model.addAttribute("maxPage",maxPage);
			page=maxPage==0?0:page;
			model.addAttribute("page",page);
			model.addAttribute("totalCount",totalCount);
			if(page>1){
				model.addAttribute("prePageHref","showDataFabric.do?page="+(page-1));
			}
			if(page<maxPage){
				model.addAttribute("nextPageHref","showDataFabric.do?page="+(page+1));
			}
			model.addAttribute("historyData",historyData);
			return "showCan";
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
			return "404";
		}
		
	}
	@RequestMapping("/showMatrixTable.do")
	public String showMatrixTable(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="messageStr",required=true) String messageStr) {
		try{
			model.addAttribute("cfmbean",hService.showMatrixTable(messageStr));
		
			return "distribution";
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
			return "error";
		}
		
	}
	@RequestMapping("/QueryByTime.do")
	public String QueryByTime(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="startTime",required=true) String startTime,
			@RequestParam(value="endTime",required=true) String endTime) {
		try{
			model.addAttribute("Str",hService.QueryByTime(startTime, endTime));
			return "historyData";
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
			return "error";
		}
	}
	
	@RequestMapping("/SearchHistoryData.do")
	public String SearchHistoryData(HttpServletRequest request,HttpServletResponse response,Model model) {
		try{
			
			model.addAttribute("Str",hService.SearchHistoryData());
			return "historyData";
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
			return "error";
		}
	}
	
	
}