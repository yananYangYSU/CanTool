<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>树状显示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/jh/treeview.css" type="text/css"/><!-- css/jh/treeview.css -->
    <script src="js/jquery-1.4.3.min.js"></script>
    <script src="css/jh/treeview.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/jh/admin.css">
    <link rel="stylesheet" type="text/css" href="css/jh/pintuer.css">
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
    <div class="panel-head"><strong class="icon-reorder"> 数据库树状列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
  
    <div id="main" style="margin-left: 50px;margin-top: 10px;">

<ul id="treeview" class="filetree">${treeStr }
</ul>
</div>
</div>
</form>
  </body>
</html>
