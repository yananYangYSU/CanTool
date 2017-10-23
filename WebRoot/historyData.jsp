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
            <input type="text" class="input" style="width:200px; line-height:17px;" placeholder="起始时间" name="fromdate" id="fromdate" value="起始时间" 
          onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'todate\')}',maxDate:'%y-%M-%d %H:%m:%s'}) "/>
        
          </li>
      
        <li>
          <input type="text" class="input" style="width:200px; line-height:17px;display:inline-block" placeholder="截止时间" name="todate" id="todate" value="截止时间" 
          onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d %H:%m:%s'})"/>
     <a href="javascript:void(0)" class="button border-main icon-search" onclick="       " > 搜索</a>
		</li>
		  <li style="padding-right:10px;"><span class="r">共有数据：<strong>${totleCount }</strong> 条</span></li>
     <li style="margin-left: 275px;">
     <button class="btn btn-primary radius" style="height: 40px;background-color: rgb(90,152,222); color: white;"
						type="button">
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

//搜索
function changesearch(){	
		
}

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		
	}
}

//全选
$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;		
		$("#listform").submit();		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

//批量排序
function sorts(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		return false;
	}
}


//批量首页显示
function changeishome(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}

//批量推荐
function changeisvouch(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");	
		
		return false;
	}
}

//批量置顶
function changeistop(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();	
	}
	else{
		alert("请选择要操作的内容!");		
	
		return false;
	}
}


//批量移动
function changecate(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){		
		
		$("#listform").submit();		
	}
	else{
		alert("请选择要操作的内容!");
		
		return false;
	}
}

//批量复制
function changecopy(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){	
		var i = 0;
	    $("input[name='id[]']").each(function(){
	  		if (this.checked==true) {
				i++;
			}		
	    });
		if(i>1){ 
	    	alert("只能选择一条信息!");
			$(o).find("option:first").prop("selected","selected");
		}else{
		
			$("#listform").submit();		
		}	
	}
	else{
		alert("请选择要复制的内容!");
		$(o).find("option:first").prop("selected","selected");
		return false;
	}
}

</script>
  </body>
</html>
