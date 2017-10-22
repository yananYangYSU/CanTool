<%@ page language="java" contentType="text/html"
	import="java.util.*,com.ictwsn.bean.*" pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	/* 获取当前角色的权限信息
	RoleBean rb = null;
	if ((RoleBean) session.getAttribute("RoleBean") != null) {
		rb = (RoleBean) session.getAttribute("RoleBean");
	} */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/showBo.css"/>
<link rel="stylesheet" type="text/css" href="css/jh/main/pintuer.css">
<link rel="stylesheet" type="text/css" href="css/jh/main/admin.css">

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<style type="text/css">
.head-r {
	width: 70px;
	height: 32px;
	float:left;
}
.aa {
	width: 35px;
	height: 32px;
	padding-top:3px;
	font-size: 14px;
	float:right;
	/* border: teal solid 1px; */
	
}

#div1 {
	width: 65px;
	height: 100%;
	border-radius: 50px;
	position: relative;
}

#div2 {
	width: 40px;
	height: 30px;
	border-radius: 48px;
	position: absolute;
	background: white;
	box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.4);
}

.open1 {
	background: rgba(0, 184, 0, 0.8);
}

.open2 {
	top: 2px;
	right: 1px;
}

.close1 {
	background: rgba(255, 255, 255, 0.4);
	border: 3px solid rgba(0, 0, 0, 0.15);
	border-left: transparent;
}

.close2 {
	left: 0px;
	top: 0px;
	border: 2px solid rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
<div class="page-container" >
	<form action="" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>当前串口：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" readonly value="<%=session.getAttribute("portName")%>" name="portName">
				<span id="name_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>波特率：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" readonly value="<%=session.getAttribute("baudRate")%>" name="baudRate">
				<span id="password_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>起始位数：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" readonly value="<%=session.getAttribute("startBit")%>" name="startBit">
				<span id="password_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>停止位数：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" readonly value="<%=session.getAttribute("stopBit")%>" name="stopBit">
				<span id="password_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>总线周期：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" readonly value="${canSpeed}ms" name="canCycle">
				<span id="password_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>Can状态：</label>
		<div class="formControls col-xs-8 col-sm-9" style="width: 150px;">
		 <div class="head-r">
  		<div id="div1" class="open1">
        <div id="div2" class="open2">
        </div>
    </div>
  </div>
  <div class="aa">
  <span id="password_notice" class="c-red">${canState}</span>
  </div>
  </div>
  </div>
  
	</form>
</div>
</div>

<script type="text/javascript">
window.onload=function(){
        var div2=document.getElementById("div2");
        var div1=document.getElementById("div1");
        var canState="${canState}";
        if(canState=="关闭"){
	         div1.className=(div1.className=="close1")?"open1":"close1";
	   		 div2.className=(div2.className=="close2")?"open2":"close2";
        }
    }
  </script>  
</body>
</html>
