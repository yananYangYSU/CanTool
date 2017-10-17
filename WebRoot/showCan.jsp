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
    <div id="main" style="margin-left: 50px; font-family:"Microsoft YaHei","simsun","Helvetica Neue", Arial, Helvetica, sans-serif;">
<table style="width: 500px; border:#CCC solid 1px;">
<tr>
<th style="border-right: #CCC solid 1px;">Time</th>
<th style="border-right: #CCC solid 1px;">ID</th>
<th style="border-right: #CCC solid 1px;">Name</th>
<th style="border-right: #CCC solid 1px;">DLC</th>
<th>Data</th>
</tr>
</table>
<ul id="treeview" class="filetree" >${historyData }
    
</ul>
</div>
  </body>
</html>
