<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.io.InputStreamReader"%>
<%

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	//   设置响应头和下载路径、保存的文件名    
	response.setContentType("APPLICATION/OCTET-STREAM");
	response.sendRedirect(basePath+"userFiles/export/historyData.xls");
	
%>
