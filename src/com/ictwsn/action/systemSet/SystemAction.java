package com.ictwsn.action.systemSet;

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

import com.ictwsn.bean.OperatorBean;
import com.ictwsn.bean.RoleBean;
import com.ictwsn.service.systemSet.SystemSetService;
import com.ictwsn.util.GetHttpType;
/**
 * 超级管理员控制类
 * @author YangYanan
 * @desc 包含超级管理员对运营商的增删改查请求处理
 * @date 2017-8-18
 */
@Controller
public class SystemAction {
	static Logger logger = Logger.getLogger(SystemAction.class.getName());

	@Resource SystemSetService aService;
	/**
	 * 进入运营商添加页面之前,获取一些参数
	 * @param request
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/updateParameterBefore.do")
	public String updateParameterBefore(HttpServletRequest request,HttpSession session,Model model){
		try{
			RoleBean rb=(RoleBean)session.getAttribute("RoleBean");
			if(rb!=null){
				return GetHttpType.isMobileDevice(request)?"pages/adminer/addOperator":"MobilePages/adminer/addOperator";
			}else{
				return "redirect:/login.jsp";
			}

		}catch(Exception e){
			logger.error("add Operator error"+e);
			e.printStackTrace();
			return GetHttpType.isMobileDevice(request)?"pages/error":"MobilePages/error";
		}
	}
	/**
	 * 进入运营商信息修改页面之前,获取一些参数
	 * @param request
	 * @param session
	 * @param model
	 * @param operatorId 运营商ID
	 * @return
	 */
	@RequestMapping("/updateCanSpeed.do")
	public String updateCanSpeed(HttpServletRequest request,HttpSession session,Model model,
			@RequestParam(value="operatorId",required=true) int operatorId){
		try{
			OperatorBean ob=aService.getOperatorById(operatorId); 
			
			model.addAttribute("ob",ob); 
			return GetHttpType.isMobileDevice(request)?"pages/adminer/updateOperator":"MobilePages/adminer/updateOperator";
		}catch(Exception e){
			logger.error("searchOperatorById error"+e);
			e.printStackTrace();
			return "pages/error";
		}

	}
	/**
	 * 修改运营商信息
	 * 请求类型:ajax
	 * @param request
	 * @param response
	 * @param operatorName 运营商名称(唯一)
	 * @param operatorPassword 运营商名称
	 * @param uuid 运营商uuid
	 * @param major 运营商major
	 * @param operatorPhone 运营商电话
	 * @param operatorAddress 运营商地址
	 * @param roleId 运营商角色ID(默认为2)
	 * @param operatorId 运营商ID
	 */
	@RequestMapping("/updateCanState.do")
	public void updateCanState(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="operatorName",required=true) String operatorName,
			@RequestParam(value="operatorPassword",required=true) String operatorPassword,
			@RequestParam(value="operatorUuid",required=true) String operatorUuid,
			@RequestParam(value="operatorMajor",required=true) int operatorMajor,
			@RequestParam(value="operatorPhone",required=false) String operatorPhone,
			@RequestParam(value="operatorAddress",required=false) String operatorAddress,
			@RequestParam(value="roleId",required=true) int roleId,
			@RequestParam(value="operatorId",required=true) int operatorId){
		try{
			OperatorBean ob=new OperatorBean();
			ob.setName(operatorName);
			ob.setPassword(operatorPassword);
			ob.setUuid(operatorUuid);
			ob.setMajor(operatorMajor);
			ob.setPhone(operatorPhone);
			ob.setAddress(operatorAddress);
			ob.setRoleId(roleId);
			ob.setId(operatorId);

			int result=aService.updateOperator(ob); 
			
			if(result>0){
				response.getWriter().print(1);
			}else{
				response.getWriter().print(0);
			}
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
		}

	}
}