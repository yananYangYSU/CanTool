<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>故宫博物院 | 古建筑温湿度监测系统</title>
<link rel="stylesheet" type="text/css" href="css/global.css"/>
<link rel="stylesheet" type="text/css" href="css/layout.css"/>
<link rel="stylesheet" type="text/css" href="css/historicalData.css"/>
<link rel="stylesheet" type="text/css" href="css/jquery-ui.min.css"/>

  <style>
	  .ui-progressbar {
	    position: relative;
	  }
	  .progress-label {
	    position: absolute;
	    left: 50%;
	    top: 4px;
	    font-weight: bold;
	    text-shadow: 1px 1px 0 #fff;
	  }
	  #fromdate,#todate{
	  	margin:0px;
	  	width:180px;
	  }
	  #dataMenuMiddle{
	  padding-top:10px;
	    margin-left:20px
	  	padding-top:10px;
	  	width:25px;
	  }
	    #cover{ 
			display:none; 
			position:fixed; 
			z-index:200; 
			top:0; 
			left:0; 
			width:100%; 
			height:100%; 
			background:#F2F2F2;
			opacity:0.6;
			filter: progid:DXImageTransform.Microsoft.Alpha(opacity=70);
		} 
		#coverShow{ 
			display:none; 
			position:fixed; 
			z-index:300; 
			top:50%; 
			left:30%; 
			width:700px; 
			height:100px; 
			margin-left:-150px; 
			margin-top:-150px;
		}
		#close{
			width: 32px;
			height: 32px;
			float: right;
			cursor: pointer;
		}
		#text{
			position: absolute;
		    margin-top: 80px;
		}
  </style>
<script src="js/jquery-1.9.1.js"></script> 
<script src="js/My97DatePicker/WdatePicker.js"></script>
</head>

<body>
	 
<div id="dataMenu" >
    <div id="dataMenuMiddle" >
    	<input type="text" style="margin-top: 12px;" class="dataInput" placeholder="起始时间" name="fromdate" id="fromdate" value="起始时间" 
          onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'todate\')}',maxDate:'%y-%M-%d %H:%m:%s'}) "/>
        
    	<input type="text" style="margin-top: 15px;" class="dataInput" placeholder="截止时间" name="todate" id="todate" value="截止时间" 
          onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'})"/>
    </div>
</div>


<form name="searchForm" id="searchForm" action="search.do" method="post">
<input type="hidden" name="startTime" id="startTime" />
<input type="hidden" name="endTime" id="endTime" />
</form>

</body>
</html>
