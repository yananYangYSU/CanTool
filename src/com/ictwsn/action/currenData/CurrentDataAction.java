package com.ictwsn.action.currenData;

import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ictwsn.service.currentData.CurrentDataService;

/**
 * 运营商控制类
 * 
 * @author YangYanan
 * @desc 包含运营商对终端用户的增删改查请求处理
 * @date 2017-8-18
 */
@Controller
public class CurrentDataAction {
	static Logger logger = Logger.getLogger(CurrentDataAction.class.getName());
	Random rand = new Random();

	@Resource
	CurrentDataService cService;

	/**
	 * 初始化进入实时数据页面
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/index.do")
	public String currentDataIndex(HttpServletRequest request,
			HttpServletResponse response, Model model,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "ecuName", required = false) String ecuName) {
		try {

			return "index";
		} catch (Exception e) {
			logger.error("login error" + e);
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 实时数据单次请求
	 * 
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping("/currentDataRequest.do")
	public void currentDataRequest(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "id", required = true) String id,
			@RequestParam(value = "ecuName", required = true) String ecuName) {
		try {
			response.getWriter()
					.print(cService.getRealDataInitStr(id, ecuName));
		} catch (Exception e) {
			logger.error("login error" + e);
			e.printStackTrace();
		}
	}

}