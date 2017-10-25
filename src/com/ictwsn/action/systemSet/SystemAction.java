package com.ictwsn.action.systemSet;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
 
import com.ictwsn.service.systemSet.SystemSetService;
import com.ictwsn.util.cantool.CanMessageStore;
import com.ictwsn.util.cantool.CodeCanMsg;
import com.ictwsn.util.format.DataFormats;
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
			SerialPortListener.getInstance().write("O1\r");
			CanMessageStore.getInstance().setCanState(1);
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
	 * @throws IOException 
	 */
	@RequestMapping("/closeCantool.do")
	public void closeCantool(HttpServletRequest request,HttpServletResponse response) throws IOException{
		try{
			SerialPortListener.getInstance().write("C\r");
			CanMessageStore.getInstance().setCanState(0);
			response.getWriter().print(1);
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
			response.getWriter().print(0);
		}
	}
	@RequestMapping("/updateCanSpeed.do")
	public void updateCanSpeed(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="canSpeed",required=true) Integer canSpeed) throws IOException{
		try{
			CanMessageStore.getInstance().setCanSpeed(canSpeed);
			response.getWriter().print(1);
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
			response.getWriter().print(0);
		}
	}
	/**
	 * 查看cantool装置的信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/canStatus.do")
	public String canStatus(HttpServletRequest request,HttpServletResponse response,Model model){
		try{
			 String canState=CanMessageStore.getInstance().getCanState()==0?"已关闭":"已开启";
			 model.addAttribute("canState",canState);
			 model.addAttribute("canSpeed",CanMessageStore.getInstance().getCanSpeed());
			 return "canStatus";
		}catch(Exception e){
			logger.error("getStatus error"+e);
			e.printStackTrace();
			return "error"; 
		}
		
	}
	/**
	 * 查看cantool装置的信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/setCan.do")
	public String setCan(HttpServletRequest request,HttpServletResponse response,Model model){
		try{
			 String canState=CanMessageStore.getInstance().getCanState()==0?"已关闭":"已开启";
			 model.addAttribute("canState",canState);
			 model.addAttribute("canSpeed",CanMessageStore.getInstance().getCanSpeed());
			 model.addAttribute("cmbList",sService.getCanMessageList());
			 return "setCan";
		}catch(Exception e){
			logger.error("getStatus error"+e);
			e.printStackTrace();
			return "error"; 
		}
	}
	@RequestMapping("/getCanSignalListStr.do")
	public void getCanSignalListStr(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="id",required=true) Integer id){
		try{
			response.getWriter().print(sService.getCanSignalListStr(id));
		}catch(Exception e){
			logger.error("getStatus error"+e);
			e.printStackTrace();
		}
	}
	@RequestMapping("/produceCanMessage.do")
	public void produceCanMessage(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="id",required=true) Integer id,
			@RequestParam(value="messageListStr",required=true) String messageListStr,
			@RequestParam(value="canTempt",required=false) Integer canTempt) throws IOException{
		try{
			Map<String,Double> sigNamePhyMap =new HashMap<String,Double>();
			String[] msgRows=messageListStr.split("\n");
			for(int i=0;i<msgRows.length;i++){
				if(msgRows[i]!=null&&msgRows[i].contains("=")){
					String[] msg=msgRows[i].split("=");
					sigNamePhyMap.put(msg[0],Double.valueOf(msg[1]));
				}
			}
			String result=CodeCanMsg.getInstance().getMessageStr(id,sService.getDclById(id),sigNamePhyMap);
			if(result.length()>2){
				if(canTempt>0&&canTempt<=65535){
					result=result+DataFormats.getInstance().decimalToHex(canTempt,4);
				}
			}
			response.getWriter().print(result);
		}catch(Exception e){
			logger.error("getStatus error"+e);
			//e.printStackTrace();
			response.getWriter().print("-4");
		}
	}
	/**
	 * 发送一条can字符串
	 * @param request
	 * @param response
	 * @param messageStr 字符串
	 * @throws IOException
	 */
	@RequestMapping("/sendMessage.do")
	public void sendMessage(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="messageStr",required=true) String messageStr) throws IOException{
		try{
			SerialPortListener.getInstance().write(messageStr+"\r");
			response.getWriter().print(1);
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
			response.getWriter().print(0);
		}
	}
}