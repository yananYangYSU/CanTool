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
			String historyData=hService.getHistoryData(number,size);
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
			model.addAttribute("historyData",historyData);
			return "showCan";
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
		}
		return null;
	}
}