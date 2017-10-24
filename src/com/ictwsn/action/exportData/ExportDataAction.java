package com.ictwsn.action.exportData;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

 

import com.ictwsn.service.currentData.CurrentDataService;
import com.ictwsn.service.exportData.ExportDataService;
import com.ictwsn.service.historyData.HistoryDataService;
import com.ictwsn.service.systemSet.SystemSetService;

import com.ictwsn.util.GetHttpType;
import com.ictwsn.util.format.DateFormats;
/**
 * 终端用户控制类
 * @author YangYanan
 * @desc 包含终端用户对设备的增删改查请求处理
 * @date 2017-8-18
 */
@Controller
public class ExportDataAction {
	static Logger logger = Logger.getLogger(ExportDataAction.class.getName());
	
	@Resource ExportDataService eService;
	@Resource HistoryDataService hService;

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
			
				model.addAttribute("clientList",null);
			
				return "redirect:/login.jsp";
			

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
	@RequestMapping("/exportCSVData.do")
	private String exportCSV(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="startTime",required=true)String startTime,
			@RequestParam(value="endTime",required=true)String endTime){
		try {   
			if(startTime==""&&endTime=="") {
				startTime=null;
				endTime=null;
			}
			int totalCount=hService.totleCount(startTime, endTime);
			eService.exportCSVData(startTime, endTime,totalCount);
			return "exportCSV";
		} catch (Exception e) {
			logger.error("add device error"+e);
			e.printStackTrace();
			return "pages/error";
		}
	}
	/**
	 * 导出can数据到XML格式
	 * @return
	 */
	private int exportXML(){
		return 0;
		
	}
}
