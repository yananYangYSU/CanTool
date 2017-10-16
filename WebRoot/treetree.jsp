<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>TreeView</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
   
    <link rel="stylesheet" href="css/jh/pintuer.css">
    <link rel="stylesheet" href="css/jh/admin.css">
    <script src="css/jh/jquery.js"></script> 
  <style type="text/css">
  body{
	margin:0px;
	padding:0px;
	}

  </style>
</head>
<body style="background-color:#f2f9fd;">
<div class="leftnav">
  <h2><span class="icon-pencil-square-o"><b>></b></span>BO_ 856 CDU_1: 8 CDU</h2>
  <ul>
  <li><a href="currentData.jsp" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACOffButtonSt</a></li>
   <li><a href="dashboard.jsp" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACOffButtonStVD</a></li>
   <li><a href="distribution.jsp" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACOffButtonSt</a></li>
   <li><a href="clientList.html" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACOffButtonStVD</a></li>
   <li><a href="operatorList.html" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACAutoModeButtonSt</a></li>
      
  </ul>  
  <h2><span class="icon-database"><b>></b></span>BO_ 61 CDU_4: 8 CDU</h2>
  <ul>
    <li><a href="deviceList.html" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACACCfg</a></li>
    <li><a href="clientList.html" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACAirCirCfg</a></li> 
 <li><a href="deviceList.html" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACACCfg</a></li>
    <li><a href="clientList.html" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACAirCirCfg</a></li> 
  
  </ul>
  <h2><span class="icon-database"><b>></b></span>BO_ 61 CDU_4: 8 CDU</h2>
  <ul>
    <li><a href="deviceList.html" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACACCfg</a></li>
    <li><a href="clientList.html" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACAirCirCfg</a></li> 
 <li><a href="deviceList.html" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACACCfg</a></li>
    <li><a href="clientList.html" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACAirCirCfg</a></li> 
  </ul>
  <h2><span class="icon-pencil-square-o"><b>></b></span>BO_ 856 CDU_1: 8 CDU</h2>
  <ul>
  <li><a href="operatorList.html" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACOffButtonSt</a></li>
   <li><a href="clientList.html" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACOffButtonStVD</a></li>
   <li><a href="operatorList.html" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACOffButtonSt</a></li>
   <li><a href="clientList.html" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACOffButtonStVD</a></li>
   <li><a href="operatorList.html" target="right"><span class="icon-caret-right"><b>></b></span>SG_ CDU_HVACAutoModeButtonSt</a></li>
      
  </ul>  
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
  </body>
</html>
