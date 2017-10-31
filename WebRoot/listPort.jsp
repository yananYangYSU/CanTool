<%@ page language="java" contentType="text/html"
	import="java.util.*,com.ictwsn.bean.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//获取当前角色的权限信息
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico">
<link rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/showBo.css" />
<link rel="stylesheet" type="text/css" href="css/jh/main/pintuer.css">
<link rel="stylesheet" type="text/css" href="css/jh/main/admin.css">

<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<style type="text/css">
  .header{
  background-image:url(css/jh/bg.jpg);
  }
  .leftnav-title{
  background-color:rgb(21,124,176);
  }
</style>

</head>
<body>
<div class="header bg-main" style="height: 120px;">
  <div class="logo margin-big-left fadein-top" style="height: 120px;">
    <h1><img src="images/y1.jpg" class="radius-circle rotate-hover" height="50" alt="" />CANTool后台管理中心</h1>
  
  </div>
  <!-- <div class="head-l"><a class="button button-little bg-green" href="index.do"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp; &nbsp;&nbsp;
  					  <a class="button button-little bg-red" href="logoff.do"><span class="icon-power-off"></span>断开连接</a>
 
  </div> -->
  
</div>
	<div class="page-container" style="margin-top: 0px;">

		<form action="login.do" method="post" class="form form-horizontal"
			id="loginDeviceForm" name="loginDeviceForm" style="border: #CCC solid 1px; width: 550px;margin: 0 auto;">

			<div class="row cl" style="width: 540px;">
				<label class="form-label col-xs-4 col-sm-2" style="width: 110px;left:20px;"><span
					class="c-red">*</span>端口名称：</label>
				<div class="formControls col-xs-8 col-sm-9" style=" width: 420px;">
					<select name="selectPort" class="input w50" id="selectPort" style="width: 150px; "
						onChange="setType();">
						<option value="">请选择端口</option>
					</select> <input type='hidden' id="portName" name="portName" value="" >
					<span id="name_notice" class="c-red" style="width:250px;"></span>
				</div>
			</div>
			<div class="row cl" style="width: 235px;">
				<label class="form-label col-xs-4 col-sm-2"style="width:110px;left:20px"><span
					class="c-red">*</span>波特率：</label>
				<div class="formControls col-xs-8 col-sm-9"style="width: 105px;">
					<input type="text" class="input w50" value="${baudRate}"
						placeholder="请输入波特率" maxlength='10' id="baudRate"
						name="baudRate"style="width:100px"> 
						<span id="rate_notice" class="c-red"></span>
				</div>
			</div>
			<div class="row cl" style="width: 235px;">
				<label class="form-label col-xs-4 col-sm-2"style="width:110px;left:20px"><span
					class="c-red">*</span>数据位：</label>
				<div class="formControls col-xs-8 col-sm-9"style="width: 105px;">
					<input type="text" class="input w50" value="${dataBit}"
						placeholder="请输入数据位" maxlength='2' id="dataBit" 
						name="dataBit"style="width:100px">
					<span id="databit_notice" class="c-red"></span>
				</div>
			</div>
			<div class="row cl" style="width: 235px;"">
				<label class="form-label col-xs-4 col-sm-2"style="width:110px;left:20px"><span
					class="c-red">*</span>停止位：</label>
				<div class="formControls col-xs-8 col-sm-9"style="width: 105px;">
					<input type="text" class="input w50" value="${stopBit}"
						placeholder="请输入停止位" maxlength='2' id="stopBit" name="stopBit"style="width: 100px;">
					<span id="stopbit_notice" class="c-red"></span>
				</div>
			</div>
			<div class="row cl" style="width: 250px;margin: 0 auto;margin-top: 10px;left:-100px;">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2"style="width: 215px;">
					<button onClick="loginDevice();" class="btn btn-primary radius"
						type="button">
						<i class="Hui-iconfont">&#xe632;</i>确认接入
					</button>
					<button class="btn btn-default radius" onClick="saveUserSet();" type="button">&nbsp;&nbsp;保存&nbsp;&nbsp;</button>
				</div>
			</div>
		</form>
	</div>
	<script type='text/javascript' src='js/jquery-1.9.1.js'></script>
	<script type='text/javascript' src='<%=basePath%>dwr/util.js'></script>
	<script type='text/javascript' src='<%=basePath%>dwr/interface/lService.js'></script>
	<script type='text/javascript' src='<%=basePath%>dwr/engine.js'></script>
	<script type="text/javascript" src="js/showBo.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			document.getElementById("name_notice").innerHTML = "正在搜索可用端口...";
			searchPort();
		});
		function setType() {
			var ports = document.getElementById("selectPort");
			for ( var i = 0; i < ports.length; i++) {
				if (ports[i].selected == true) {
					document.getElementById("portName").value = ports[i].value;
					break;
				}
			}
		}
		function saveUserSet() {
			var baudRate = document.getElementById("baudRate").value;
			var dataBit = document.getElementById("dataBit").value;
			var stopBit = document.getElementById("stopBit").value;
			lService.saveCanSet(baudRate,dataBit,stopBit,callback);
				function callback(data) {
					if(data>0){
							Showbo.Msg.alert("用户参数保存成功!");
						}else{
							Showbo.Msg.alert("用户参数保存失败!");
						}
				}
		}
		function loginDevice() {
			var portName = document.getElementById("portName").value;
			var baudRate = document.getElementById("baudRate").value;
			var dataBit = document.getElementById("dataBit").value;
			var stopBit = document.getElementById("stopBit").value;
			if (portName == "") {
				document.getElementById("name_notice").innerHTML = "*请选择端口号!";
				document.getElementById("portName").focus();
				return 0;
			}
			document.getElementById("name_notice").innerHTML = "";
			if (baudRate == "") {
				document.getElementById("rate_notice").innerHTML = "*请填写波特率!";
				document.getElementById("baudRate").focus();
				return 0;
			}
			document.getElementById("rate_notice").innerHTML = "";
			if (dataBit == "") {
				document.getElementById("databit_notice").innerHTML = "*请填写数据位长度!";
				document.getElementById("dataBit").focus();
				return 0;
			}
			document.getElementById("databit_notice").innerHTML = "";
			if (stopBit == "") {
				document.getElementById("stopbit_notice").innerHTML = "*请填写停止位长度!";
				document.getElementById("stopBit").focus();
				return 0;
			}
			document.getElementById("stopbit_notice").innerHTML = "";
			document.loginDeviceForm.submit();

		}

		function searchPort() {
			lService.getAvaPort(callback);
			function callback(data) {
				document.loginDeviceForm.selectPort.length = 0;
				document.getElementById("selectPort").options.add(new Option("请选择端口", ""));
				var j=0;
				for (var i in data) {
					j++;
					document.getElementById("selectPort").options.add(new Option(data[i], i));
				}
				if(j>0)
					document.getElementById("name_notice").innerHTML = "搜索完毕,发现"+j+"个端口";
				else
					document.getElementById("name_notice").innerHTML = "搜索完毕,未找到端口";
			}
		}
	
	</script>
	
</body>
</html>
