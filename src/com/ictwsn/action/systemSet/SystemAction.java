package com.ictwsn.action.systemSet;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
 
import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.service.systemSet.SystemSetService;
import com.ictwsn.util.rxtx.SerialPortListener;
/**
 * 超级管理员控制类
 * @author YangYanan
 * @desc 包含超级管理员对运营商的增删改查请求处理
 * @date 2017-8-18
 */
@Controller
public class SystemAction {
	static Logger logger = Logger.getLogger(SystemAction.class.getName());

	@Resource SystemSetService sService;
	
	/**
	 * 开启cantool装置
	 * @param request
	 * @param response
	 */
	@RequestMapping("/openCantool.do")
	public void openCantool(HttpServletRequest request,HttpServletResponse response){
		try{
			SerialPortListener.getInstance().write("C\r");
			response.getWriter().print(1);
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
		}
	}
	/**
	 * 开启cantool装置
	 * @param request
	 * @param response
	 */
	@RequestMapping("/closeCantool.do")
	public void closeCantool(HttpServletRequest request,HttpServletResponse response){
		try{
			SerialPortListener.getInstance().write("O\r");
			response.getWriter().print(1);
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
		}
	}
}