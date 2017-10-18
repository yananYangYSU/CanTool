package com.ictwsn.action.historyData;

import java.util.ArrayList;
import java.util.List;
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
import com.ictwsn.service.exportData.ExportDataService;
import com.ictwsn.service.historyData.HistoryDataService;
import com.ictwsn.service.systemSet.SystemSetService;
import com.ictwsn.util.GetHttpType;
import com.ictwsn.util.format.DateFormats;

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
    
	@RequestMapping("/goToHistoryData.do")
	public String goToHistoryData(HttpServletRequest request,HttpServletResponse response,Model model){
		try{
			
            /**
             * 获取tree的字符串
             */
			model.addAttribute("dataSeries",null);
			
			return "historyData";
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping("/searchHistoryData.do")
	public String searchHistoryData(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="ecuName",required=true) String ecuName,
			@RequestParam(value="page",required=true) int page,
			@RequestParam(value="startTime",required=true) String startTime,
			@RequestParam(value="endTime",required=true) String endTime){
		try{
			int totalCount=hService.getHistoryDataCount(ecuName, page, startTime, endTime);  //查询该用户拥有的设备总数
			int size=10;						  			   				   //每页显示大小
			int maxPage=(totalCount%size==0)?totalCount/size:totalCount/size+1;//最大页数
			page=(page==0)?1:page;			   					               //当前第几页
			int number=(page-1)*size;	

			List<CanPhyDataBean> oblist=hService.searchHistoryData(ecuName, maxPage, startTime, endTime); //查询该用户对应数量的设备信息
			model.addAttribute("oblist",oblist); 
			model.addAttribute("maxPage",maxPage);
			page=maxPage==0?0:page;
			model.addAttribute("page",page);
			model.addAttribute("totalCount",totalCount);
			if(page>1){
				model.addAttribute("prePageHref","searchOperator.do?userId="+"&page="+(page-1)+"&roleName=");
			}
			if(page<maxPage){
				model.addAttribute("nextPageHref","searchOperator.do?userId="+"&page="+(page+1)+"&roleName=");
			}
			
			return "historyData";
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
		}
		return null;
	}
	@RequestMapping("/getHistoryData.do")
	public String getHistoryData(HttpServletRequest request,HttpServletResponse response,Model model) {
		try{
			
            /**
             * 获取实时数据表格信息
             */
			model.addAttribute("historyData",hService.getHistoryData());
			
			return "showCan";
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
		}
		return null;
	}
}
}