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
<link href="lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.head-r {
	width: 70px;
	height: 32px;
	float:left;
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
 <div id='allmap' style='width: 50%; height: 70%; left:450px; top:60px;z-index:5; position: absolute; display: none'></div>
	<div class="row cl" style="margin-top: -20px;margin-left: -220px;">
			<%-- <label class="bread"><a href="searchOperator.do?userId=<%=rb.getUserId()%>&page=1&roleName=<%=rb.getRoleName()%>" style="text-decoration: none;"><<返回</a></label> --%>
			<a>返回</a>
	  </div>
	<form action="" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发送周期：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="" maxlength='20' placeholder="请输入发送周期(必填)" id="zq" name="operatorName">
				<span id="name_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发送频率：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="" maxlength='20' placeholder="请输入发送频率(必填)" id="pl" name="operatorPassword">
				<span id="password_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
		<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>Can状态：</label>
		<div class="formControls col-xs-8 col-sm-9">
		 <div class="head-r">
  <div id="div1" class="open1">
        <div id="div2" class="open2">
        </div>
    </div>
  </div>
  </div>
  </div>
 
		<input type="hidden" value="2" id="roleId" name="roleId">
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onclick="addOperator();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>确认提交</button>
				<button class="btn btn-default radius" type="reset">&nbsp;&nbsp;重置&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>



<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=nSTdG2Ql53oHYhwNLXYNwqxesbDK9ol3"></script>
<script type="text/javascript">
window.onload=function(){
        var div2=document.getElementById("div2");
        var div1=document.getElementById("div1");
        div2.onclick=function(){
         div1.className=(div1.className=="close1")?"open1":"close1";
   		 div2.className=(div2.className=="close2")?"open2":"close2";
        }
    }
  </script>  
</body>
</html>
