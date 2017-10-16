package com.ictwsn.action.dbManage;

import java.io.File;
import java.io.FileOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ictwsn.service.dbManage.DatabaseService;

/**
 * 运营商控制类
 * @author YangYanan
 * @desc 包含运营商对终端用户的增删改查请求处理
 * @date 2017-8-18
 */
@Controller
public class DataBaseAction {
	private static Logger logger=Logger.getLogger(DataBaseAction.class.getName());
	@Resource DatabaseService dService;


	@RequestMapping("/dataBaseTree.do")
	public String dataBaseTree(HttpServletRequest request,HttpServletResponse response,Model model){
		try{

			/**
			 * 获取tree的字符串
			 */
			model.addAttribute("dataSeries",null);

			return "dataBaseTree";
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 进入数据库导入页面的请求
	 * @param request
	 * @param response
	 * @param model
	 * @param fileType xml或者json
	 * @param fileName 文件名称
	 * @return jsp页面
	 */
	@RequestMapping("/importExportBefore.do")
	public String importExportBefore(HttpServletRequest request,HttpServletResponse response,Model model){
		try{

		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
		}
		return "importExportDB";
	}
	@RequestMapping("/importDatabase.do")
	public String importDatabase(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="dbFile",required=false) MultipartFile dbFile){
		
		try{
			//将图片写入到服务器目录下
			@SuppressWarnings("deprecation")
			String webRootPath=request.getRealPath("/"); 
	
			String fileNameSuffix="";
			FileOutputStream out;
			String fileNamePrefix=webRootPath+"/userFiles/import/";
			if(!dbFile.isEmpty()){
				fileNameSuffix=dbFile.getOriginalFilename().substring(dbFile.getOriginalFilename().indexOf("."));
				
				/**
				 * 格式类型判断
				 */
				if(fileNameSuffix!=null&&!fileNameSuffix.equals(".xml")&&!fileNameSuffix.equals(".json")){
					model.addAttribute("message",-1);
					return "redirect:importExportBefore.do";
				}
				/**
				 * 保存文件到/userFiles/import/目录下
				 */
				try{	 
					byte[] bytes = dbFile.getBytes();
					if(bytes.length!=0){	        			        				        					        		
						File myTfileHead=new File(fileNamePrefix+"importDataBase"+fileNameSuffix);
						if(myTfileHead.exists()){
							myTfileHead.delete();	        	
							myTfileHead.createNewFile();	       
						}
						out=new FileOutputStream(fileNamePrefix+"importDataBase"+fileNameSuffix);	  	                              			
						out.write(bytes);
						out.close();	
					}	  
				}catch(Exception e){
					e.printStackTrace();
				}
			}   
			
			boolean result=dService.importDataBase(fileNameSuffix.replace(".",""),"importDataBase"+fileNameSuffix);
			if(result==true){
				model.addAttribute("message",1);
				return "redirect:importExportBefore.do";
			}else{
				model.addAttribute("message",0);
				return "redirect:importExportBefore.do";
			}
		}catch(Exception e){
			logger.error("update database error"+e);
			e.printStackTrace();
		}
		return null;
	
	}
	/**
	 * 导出数据库的message和signal表
	 * @param request
	 * @param response
	 * @param model
	 * @param fileType 导出的数据格式类型 xml或者json
	 * @return
	 */
	@RequestMapping("/exportDatabase.do")
	public String exportDatabase(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="fileType",required=true) String fileType){
		try{
			boolean result=dService.exportDataBase(fileType);
			if(result==true){
				return fileType+"Export";
			}else{
				return "exportFailed";
			}

		}catch(Exception e){
			logger.error("exportFailed");
			e.printStackTrace();
		}
		return null;
	}}