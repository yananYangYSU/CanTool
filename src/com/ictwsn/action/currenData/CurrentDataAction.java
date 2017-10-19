package com.ictwsn.action.currenData;

import java.util.ArrayList;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.ictwsn.bean.CanPhyDataBean;
import com.ictwsn.bean.CanSignalBean;
import com.ictwsn.service.currentData.CurrentDataService;
import com.ictwsn.util.format.DateFormats;
/**
 * 运营商控制类
 * @author YangYanan
 * @desc 包含运营商对终端用户的增删改查请求处理
 * @date 2017-8-18
 */
@Controller
public class CurrentDataAction {
	static Logger logger=Logger.getLogger(CurrentDataAction.class.getName());
	Random rand =new Random();

	@Resource CurrentDataService cService;	

	/**
	 * 初始化进入实时数据页面
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("/currentDataIndex.do")
	public String currentDataIndex(HttpServletRequest request,HttpServletResponse response,Model model,
			@RequestParam(value="id",required=true) Integer id,
			@RequestParam(value="signalName",required=true) String signalName){
		try{
			StringBuffer strName=new StringBuffer();
			StringBuffer strData=new StringBuffer();
			StringBuffer HSeries=new StringBuffer();
			strName.append("{name:'dataSeries',");//type: 'area',
			strData.append("data:[");
			//CanPhyDataBean cpdb=cService.getRealPhyData(id,signalName);
			ArrayList<CanPhyDataBean> cpdbList=cService.getRealDataList(id,signalName);
			CanSignalBean csb=cService.getCanSignal(id,signalName);
			long time;
			int size=cpdbList.size()-1;
			for(int i=0;i<size;i++){
				time=DateFormats.getInstance().dateStringToTime(cpdbList.get(i).getTime());
				strData.append("[").append(time).append(",").append(cpdbList.get(i).getPhyValue()).append("],");
			}
			if(size==-1){
				model.addAttribute("lastTime",DateFormats.getInstance().getNowDate());
			}else{
				time=DateFormats.getInstance().dateStringToTime(cpdbList.get(size).getTime());
				strData.append("[").append(time).append(",").append(cpdbList.get(size).getPhyValue()).append("]]");
				model.addAttribute("lastTime",cpdbList.get(size).getTime());
			}
			
			HSeries.append(strName).append(strData).append(",marker: {enabled: true}}");
			
			model.addAttribute("id",id);
			
			model.addAttribute("signalName",csb.getSignalName());
			model.addAttribute("dataSeries",HSeries.toString());
			model.addAttribute("maxPhyValue",csb.getMaxPhyValue());
			model.addAttribute("minPhyValue",csb.getMinPhyValue());
			model.addAttribute("unit",csb.getUnit());
			
			return "currentData";
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 实时数据单次请求
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping("/currentDataRequest.do")
	public void currentDataRequest(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="id",required=true) Integer id,
			@RequestParam(value="signalName",required=true) String signalName,
			@RequestParam(value="startTime",required=true) String startTime){
		try{
			ArrayList<CanPhyDataBean> cpdbList=cService.getRealDataList(id,signalName,startTime);
			response.getWriter().print(JSONArray.fromObject(cpdbList));
			
		}catch(Exception e){
			logger.error("login error"+e);
			e.printStackTrace();
		}
	}

}