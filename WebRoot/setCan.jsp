<%@ page language="java" contentType="text/html"
	import="java.util.*,com.ictwsn.bean.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
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

#div1 {
	width: 65px;
	height: 100%;
	border-radius: 50px;
	position: relative;
}


#text-div {
	width: 65px;
	height: 100%;
    left:600px;
    top:0px;
	position: absolute;
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
		<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>Can状态：</label>
		<div class="formControls col-xs-8 col-sm-9">
		 <div class="head-r">
  			<div id="div1" class="open1">
        	<div id="div2" class="open2"></div>
    		</div>
  		</div>
  		</div>
  </div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>发送速率：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${canSpeed}" maxlength='5' placeholder="请输入发送速率(必填)" id="canSpeed" name="canSpeed">单位:ms
				<span id="speed_notice" class="c-red"></span>
			</div>
		</div>
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onclick="updateCanSpeed();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>确认修改</button>
				<button class="btn btn-default radius" type="reset">&nbsp;&nbsp;重置&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
	<div id="text-div">
	 <div class="form-group">
       
        <div class="field">
          <textarea class="input" name="sdescription" style="width:280px;height:130px"></textarea>
          
          <div class="tips"></div>
          	<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onclick="updateCanSpeed();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>确认修改</button>
				<button class="btn btn-default radius" type="reset">&nbsp;&nbsp;重置&nbsp;&nbsp;</button>
			</div>
		</div>
        </div>
      </div>
	</div>
</div>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script> 
<script type="text/javascript" src="js/showBo.js"></script> 
<script type="text/javascript">
window.onload=function(){
        var div2=document.getElementById("div2");
        var div1=document.getElementById("div1");
        var canState="${canState}";
        if(canState=="关闭"){
	         div1.className=(div1.className=="close1")?"open1":"close1";
	   		 div2.className=(div2.className=="close2")?"open2":"close2";
        }
        div2.onclick=function(){
        	if(canState=="关闭"){
	        	$.post("openCantool.do",{},
				function(data){
						if(data==1){
							canState="开启";
							div1.className=(div1.className=="close1")?"open1":"close1";
   		 					div2.className=(div2.className=="close2")?"open2":"close2";
						}else{
							Showbo.Msg.alert("端口连接异常!");
						}
				});
        	}else{
        		$.post("closeCantool.do",{},
				function(data){
						if(data==1){
							canState="关闭";
							div1.className=(div1.className=="close1")?"open1":"close1";
   		 					div2.className=(div2.className=="close2")?"open2":"close2";
						}else{
							Showbo.Msg.alert("端口连接异常!");
						}
				});
        	}
         
        }
}

function updateCanSpeed(){
var canSpeed=document.getElementById("canSpeed").value;
		
	var isNum=/^[0-9]{0,}$/;
			if(canSpeed==''){
				document.getElementById("speed_notice").innerHTML="*请填写内容!";
				document.getElementById("canSpeed").focus();
				return 0;
			}else if(!isNum.test(canSpeed)){
				document.getElementById("speed_notice").innerHTML="*请填写数字!";
				document.getElementById("canSpeed").focus();
				return 0;
			}else if(canSpeed<0||canSpeed>65535){
				document.getElementById("speed_notice").innerHTML="*请填写0-65535的数字!";
				document.getElementById("canSpeed").focus();
				return 0;
			}	
		document.getElementById("speed_notice").innerHTML="";
    	$.post("updateCanSpeed.do",{canSpeed:canSpeed},
			function(data){
					if(data==1){
						Showbo.Msg.alert("修改canTool速率成功!");
					}else{
						Showbo.Msg.alert("修改canTool速率失败!");
					}
			});
}
 </script>  
</body>
</html>
