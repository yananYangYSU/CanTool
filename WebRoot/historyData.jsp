<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>HistoryData</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">


<!-- <link rel="stylesheet" type="text/css"
	href="css/jh/H-ui.min.css" /> -->
	
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" /> 
	<link rel="stylesheet" href="css/jh/pintuer.css">
<link rel="stylesheet" href="css/jh/admin.css">

<script src="css/jh/jquery.js"></script>
<script src="css/jh/pintuer.js"></script>

<style type="text/css">
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
</style>

  </head>
  
  <body>
    <form method="post" action="" id="listform">
  <div class="panel admin-panel"> 
    <div class="panel-head"><strong class="icon-reorder"> 历史信号列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <!-- <a class="button border-main icon-plus-square-o" href="deviceAdd.html"> 添加设备</a>  --></li>
       
        
          <li>
            <input type="text" class="input" style="width:200px; line-height:17px;" placeholder="起始时间" name="startTime" id="startTime" value="${startTime}" 
          onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'todate\')}',maxDate:'%y-%M-%d %H:%m:%s'}) "/>
        
          </li>
      
        <li>
          <input type="text" class="input" style="width:200px; line-height:17px;display:inline-block" placeholder="截止时间" name="endTime" id="endTime" value="${endTime}" 
          onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'})"/>
          <button onclick="queryByTime();" class="button border-main icon-search" type="button">搜索</button>
         
 	</li>
		  <li style="padding-right:10px;"><span class="r">共有数据：<strong>${totleCount }</strong> 条</span></li>
     <li style="margin-left: 275px;">
     <button class="btn btn-primary radius" style="height: 40px;background-color: rgb(90,152,222); color: white;"
						type="button" onclick="exportCSV();">
						<i class="Hui-iconfont">&#xe632;</i>导出
					</button>
     </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th width="15%">ID</th>
		<th width="15%">Name</th>
		<th width="10%">DLC</th>
		<th width="30%">Data</th>
		<th width="30%">Time</th>
      </tr>
     ${Str }
      <tr>
        <td colspan="5">
					<div class="pagelist">
						<c:choose>
							<c:when test="${page==1}">
								<a>上一页</a>
							</c:when>
							<c:otherwise>
								<a href="${prePageHref}">上一页</a>
							</c:otherwise>
						</c:choose>
						&nbsp;&nbsp;${page}/${maxPage}&nbsp;&nbsp;
						<c:choose>
							<c:when test="${page==maxPage}">
								<a>下一页</a>
							</c:when>
							<c:otherwise>
								<a href="${nextPageHref}">下一页</a>
							</c:otherwise>
						</c:choose>
					</div>
				</td>  </tr>
    </table>
  </div>
</form>
<script type="text/javascript">
function queryByTime(){	
	var startTime=document.getElementById("startTime").value;
	var endTime=document.getElementById("endTime").value;
	if(startTime==""){
		alert("请输入起始日期");
	}else if(endTime==""){
		alert("请输入截止日期");
	}else if(startTime<endTime){
	
		window.location="QueryByTime.do?startTime="+startTime+"&endTime="+endTime+"&page=1";
		
	}else{
		alert("日期顺序输入错误，请重新输入日期");
	}
	
}
function exportCSV(){	
	var startTime=document.getElementById("startTime").value;
	var endTime=document.getElementById("endTime").value;
		window.location="exportCSVData.do?startTime="+startTime+"&endTime="+endTime;
}

</script>
  </body>
</html>
