package com.ictwsn.action.exportData;

import java.io.File;
import java.io.FileOutputStream;
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
import org.springframework.web.multipart.MultipartFile;

import com.ictwsn.bean.ClientBean;
import com.ictwsn.bean.DeviceBean;
import com.ictwsn.bean.RoleBean;

import com.ictwsn.service.currentData.CurrentDataService;
import com.ictwsn.service.exportData.ExportDataService;
import com.ictwsn.service.systemSet.SystemSetService;

import com.ictwsn.util.GetHttpType;
import com.ictwsn.util.format.DateFormat;
/**
 * 终端用户控制类
 * @author YangYanan
 * @desc 包含终端用户对设备的增删改查请求处理
 * @date 2017-8-18
 */
@Controller
public class ExportDataAction {
	static Logger logger = Logger.getLogger(ExportDataAction.class.getName());
	DateFormat pd=new DateFormat();

	@Resource CurrentDataService cService;	
	@Resource ExportDataService oService;
	@Resource SystemSetService aService;
	/**
	 * 添加设备之前,获取一些参数
	 * @param request
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("/exportData.do")
	public String exportData(HttpServletRequest request,HttpSession session,Model model){
		try{
			RoleBean rb=(RoleBean)session.getAttribute("RoleBean");
			if(rb!=null){
				List<ClientBean> clientList=new ArrayList<ClientBean>();
				if(rb.getRoleName()!=null&&rb.getRoleName().equals("client")){
					ClientBean cb=new ClientBean();
					cb.setName(rb.getUserName());
					cb.setId(rb.getUserId());
					clientList.add(cb);
				}else{ 
					if(rb.getRoleName()!=null&&rb.getRoleName().equals("adminer")){
						model.addAttribute("operatorList",aService.searchOperator(rb.getUserId(),0,99999,rb.getRoleName()));
					}
					clientList=oService.searchClient(rb.getUserId(),0,99999,rb.getRoleName());//查询出该用户下属的所有终端用户姓名及id
				}
				
				model.addAttribute("clientList",clientList);
			
				return GetHttpType.isMobileDevice(request)?"pages/client/addDevice":"MobilePages/client/addDevice";
			}else{
				return "redirect:/login.jsp";
			}

		}catch(Exception e){
			logger.error("add device error"+e);
			e.printStackTrace();
			return "pages/error";
		}
	}
	/**
	 * 导出can数据到CSV格式
	 * @return
	 */
	
	private int exportCSV(){
		return 0;
		
	}
	/**
	 * 导出can数据到XML格式
	 * @return
	 */
	private int exportXML(){
		return 0;
		
	}
}
