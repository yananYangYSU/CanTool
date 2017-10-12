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

import com.ictwsn.bean.ClientBean;
import com.ictwsn.bean.OperatorBean;
import com.ictwsn.bean.RoleBean;
import com.ictwsn.service.exportData.ExportDataService;
import com.ictwsn.service.historyData.HistoryDataService;
import com.ictwsn.service.systemSet.SystemSetService;
import com.ictwsn.util.GetHttpType;
import com.ictwsn.util.format.DateFormat;

/**
 * 运营商控制类
 * 
 * @author YangYanan
 * @desc 包含运营商对终端用户的增删改查请求处理
 * @date 2017-8-18
 */
@Controller
public class HistoryDataAction {
	static Logger logger = Logger.getLogger(HistoryDataAction.class.getName());


	@Resource HistoryDataService oService;
}