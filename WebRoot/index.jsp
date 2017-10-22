<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>CanTool</title> 
    <link rel="stylesheet" href="css/jh/main/pintuer.css">
    <link rel="stylesheet" href="css/jh/main/admin.css">
    <script src="css/jh/main/jquery.js"></script>  
  <style type="text/css">
  .header{
  background-image:url(css/jh/bg.jpg);
  }
  .leftnav-title{
  background-color:rgb(21,124,176);
  }
  #switch{
  width: 100px;
  height: 100%;
  border: teal solid 1px;
  margin-left: 500px;
  }
  #div1{
        width: 65px;
        height: 100%;
        border-radius: 50px;
        position: relative;
    }
    #div2{
        width: 40px;
        height: 30px;
        border-radius: 48px;
        position: absolute;
        background: white;
        box-shadow: 0px 2px 4px rgba(0,0,0,0.4);
    }
    .open1{
        background: rgba(0,184,0,0.8);
    }
    .open2{
        top: 2px;
        right: 1px;
    }
    .close1{
        background: rgba(255,255,255,0.4);
        border:3px solid rgba(0,0,0,0.15);
        border-left: transparent;
    }
    .close2{
        left: 0px;
        top: 0px;
        border:2px solid rgba(0,0,0,0.1);
    }
  </style>   
</head>
<body style="background-color:#f2f9fd;"><!--  -->
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="images/y1.jpg" class="radius-circle rotate-hover" height="50" alt="" />CANTool后台管理中心</h1>
  
  </div>
  <div class="head-l"><a class="button button-little bg-green" href="index.do" target="_blank"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp; &nbsp;&nbsp;
  					  <a class="button button-little bg-red" href="logoff.do"><span class="icon-power-off"></span>断开连接</a>
 
  </div>
  
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <!--<h2><span class="icon-adjust"></span>参数设置</h2>
  <ul style="display:block">
     
  </ul>  -->
  <h2><span class="icon-pencil-square-o"></span>CAN信息管理</h2>
  <ul>
  <li><a href="canStatus.do" target="right"><span class="icon-caret-right"></span>显示CAN信息</a></li>
   <li><a href="setCan.do" target="right"><span class="icon-caret-right"></span>设置CAN参数</a></li>    
  </ul>  
  <h2><span class="icon-database"></span>数据库管理</h2>
  <ul>
    <li><a href="dataBaseTree.do" target="right"><span class="icon-caret-right"></span>树状显示数据库</a></li> 
     <li><a href="importExportBefore.do" target="right"><span class="icon-caret-right"></span>数据库导入/导出</a></li>
  </ul>
    <h2><span class="icon-database"></span>实时数据管理</h2>
  <ul>
    <li><a href="showDataFabric.do?page=1" target="right"><span class="icon-caret-right"></span>显示信息组成</a></li>
    <li><a href="searchHistoryData.do" target="right"><span class="icon-caret-right"></span>历史数据查询</a></li> 
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
<script type="text/javascript">
window.onload=function(){
        var div2=document.getElementById("div2");
        var div1=document.getElementById("div1");
        div2.onclick=function(){
         div1.className=(div1.className=="close1")?"open1":"close1";
   		 div2.className=(div2.className=="close2")?"open2":"close2";
        }
    }
    /*
    */
    </script>
<ul class="bread">
  <li><a href="" class="icon-home"> 首页</a></li>
  <li><a href="" id="a_leader_txt">管理中心</a></li>
  <li><b>当前用户：</b><span style="color:red;">19组</span>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="canStatus.do" name="right" width="100%" height="100%"></iframe>
</div>
  </body>
</html>
