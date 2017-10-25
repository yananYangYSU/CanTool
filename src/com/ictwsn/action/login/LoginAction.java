package com.ictwsn.action.login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ictwsn.service.login.LoginService;
import com.ictwsn.util.cantool.CanMessageStore;

/**
 * 系统用户登录控制类
 * @author YangYanan
 * @desc 包含系统用户登录注销的请求处理
 * @date 2017-8-18
 */
@Controller
public class LoginAction{

	static Logger logger = Logger.getLogger(LoginAction.class.getName());

	@Resource LoginService lService;	

	/**
	 * 跳转到端口接入页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/listPort.do")
	public String listPort(HttpServletRequest request,HttpServletResponse response,Model model){
		
		model.addAttribute("baudRate",CanMessageStore.getInstance().getBaudRate());
		model.addAttribute("dataBit",CanMessageStore.getInstance().getDataBit());
		model.addAttribute("stopBit",CanMessageStore.getInstance().getStopBit());
		return "listPort";
	}
	/**
	 * 跳转到管理主页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/index.do")
	public String index(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		return "index";
	}
	/**
	 * 接入cantool装置请求
	 * @param request
	 * @param response
	 * @param model
	 * @param portName 端口名称
	 * @param baudRate 波特率
	 * @param startBit 开始位
	 * @param stopBit 停止位
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request,HttpServletResponse response,HttpSession session,Model model,
			@RequestParam(value="portName",required=true) String portName,
			@RequestParam(value="baudRate",required=true) Integer baudRate,
			@RequestParam(value="dataBit",required=true) Integer startBit,
			@RequestParam(value="stopBit",required=true) Integer stopBit) throws UnsupportedEncodingException{
		try{
			int result=lService.login(portName,baudRate,startBit,stopBit);			
			if(result==1){
				session.setAttribute("portName",portName);
				session.setAttribute("baudRate",baudRate);
				session.setAttribute("startBit",startBit);
				session.setAttribute("stopBit",stopBit);
				return "redirect:/index.do";
			}else{
				model.addAttribute("message","0");
				return "redirect:/listPort.do";
			}

		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
			return "pages/error/404";
		}
	}
	/**
	 * 断开连接
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/logoff.do")
	public String logoff(HttpServletRequest request,HttpSession session){
		try{
			System.out.println("log off");
			lService.logoff();
			session.removeAttribute("portName");
			session.removeAttribute("baudRate");
			session.removeAttribute("startBit");
			session.removeAttribute("stopBit");

			return "redirect:/listPort.do";
		}catch(Exception e){
			logger.error("logoff error"+e);
			e.printStackTrace();
			return "pages/error/404";
		}

	}
}
