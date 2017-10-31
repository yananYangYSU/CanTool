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
    
    <title>ShowCan</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/jh/treeview.css" type="text/css"/><!-- css/jh/treeview.css -->
    <link rel="stylesheet" type="text/css" href="css/jh/admin.css">
    <link rel="stylesheet" type="text/css" href="css/jh/pintuer.css">
    <script src="js/jquery-1.4.3.min.js"></script>
    <script src="css/jh/treeview.js" type="text/javascript"></script>
<script src="css/jh/pintuer.js"></script>
<style type="text/css">
.folder{
font-weight: bold;
}
</style>
<script type="text/javascript">
    $(document).ready(function(){
        $("#treeview").treeview({
            toggle: function() {
                console.log("%s was toggled.", $(this).find(">span").text());
            }
        });
    });
</script>
  </head>
  
  <body>
  <form method="post" action="" id="listform">
  <div class="panel admin-panel"> 
    <div class="panel-head"><strong class="icon-reorder"> Can信息组成列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
  
   <div id="main" style="margin-left: 50px; "> <!--   font-family:"Microsoft YaHei","simsun","Helvetica Neue", Arial, Helvetica, sans-serif; -->
<table class="table table-hover" style="width: 800px;"><!-- text-center  style="width: 800px; border-top: #CCC solid 1px; border-bottom: #CCC solid 1px;" -->
<tr style="text-align: center;">
<th style="width:160px;text-align: center;">Time</th>
<th style=" width:70px ;text-align: center;">ID</th>
<th style=" width:70px;text-align: center;">Name</th>
<th style=" width: 70px;text-align: center;">DLC</th>
<th style=" width: 220px;text-align:center;">Data</th>
</tr>
<tr>
<td colspan="5">
 <ul id="treeview" class="filetree" >${historyData }
    
</ul>
</td> 
</tr>
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
				</td>
      </tr>
</table>
</div>
</div>
</form>
</body>
</html>
