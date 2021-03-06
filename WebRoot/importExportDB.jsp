<%@ page language="java" contentType="text/html" import="java.util.*,com.ictwsn.bean.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//获取当前角色的权限信息
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

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" /> 
</head>
<body>
<div class="page-container">
	
	<form action="importDatabase.do" method="post" class="form form-horizontal" id="importDBForm" name="importDBForm" enctype="multipart/form-data">
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">上传文件：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="uploadfile2" id="uploadfile2" nullmsg="请添加xml或json文件！" style="width:200px">
				<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont"></i> 选择文件</a>
				<input type="file" name="dbFile" id="dbFile" class="input-file">
				</span> </div>
		</div>
	
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="importDB();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>确认替换</button>
				<button class="btn btn-default radius" type="reset">&nbsp;&nbsp;重置&nbsp;&nbsp;</button>
			</div>
		</div>
		<div class="row cl" >
 			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2" style="margin-left: 35px;margin-top: 15px;">
 			<label class="form-label col-xs-4 col-sm-2">数据导出：</label>
 				<button onClick="exportDB('xml');" class="btn btn-primary radius" type="button" style="margin-left: 15px;"><i class="Hui-iconfont">&#xe632;</i>XML格式</button>
 				<button onClick="exportDB('json');" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>JSON格式</button>
 			</div>
 		</div>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<script type="text/javascript" src="js/showBo.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
			var message='<%=request.getParameter("message")%>';
			if(message!='null'){
				if(message==1){
					Showbo.Msg.alert("数据库更新成功!",function(){window.location='importExportBefore.do';});
				}else if(message==0){
					Showbo.Msg.alert("数据库更新失败!");
				}else{
					Showbo.Msg.alert("数据格式文件有误!");
				}
			}
		});
		function exportDB(type){
			if(type=="xml")
				window.location="exportDatabase.do?fileType=xml";
			else 
				window.location="exportDatabase.do?fileType=json";
		}
		function importDB(){
		    var fileName=document.getElementById("dbFile").value;
		    if(fileName==""){
		    	Showbo.Msg.alert("请选择要上传的文件!");
		    	return 0;
		    }
		    var fileSuffixName =/\.[^\.]+/.exec(fileName);
		    if(!fileSuffixName==".xml"||!fileSuffixName==".json"){
		    	Showbo.Msg.alert("文件格式应为xml或json!");
		    	return 0;
		    }
		    document.importDBForm.submit();
			
		}
		
</script>

</body>
</html>
