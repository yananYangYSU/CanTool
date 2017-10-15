<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>setCan</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
#box3{
	width:1000px;
	height:700px;
	margin:0 auto;
	border:#CCC solid 1px; }
#jobs{
	width: 400px;
	height: 400px;
	margin: 10px auto;
	color: teal;
	border: teal solid 1px;
	font-size: 20px;}
	
</style>
  </head>
  
  <body>
     <!-- <div id="box3"> -->
    <div id="jobs">
    <form action="news_doAddNews.action" style="width: 450px; height: 350px; font-size: 16px; text-align: center;">
    		<table style="width: 450px; height: 350px;  font-size: 16px;">
    			<tr>
    				<td style="text-align: center;">发送周期：</td>
    				<td><input type="text" name="nneirong" placeholder="请输入要设置的发送周期" style="width: 200px;height: 30px;"/></td>
    			</tr>
    			<tr>
    				<td style="text-align: center;">发送频率：</td>
 
    				<td><input type="text" name="nneirong" placeholder="请输入要设置的发送频率" style="width: 200px;height: 30px;"/></td>
    			</tr>
    			<tr>
    				<td style="text-align: center;">状态：</td>
    				<td><input type="radio" name="status" value="open" checked="checked" id="status-1"/><label for="status-1">开</label>
  						<input type="radio" name="status" value="close" id="status-2"/><label for="status-2">关</label></td> 
    			</tr>
    			<tr>
    			 <td style="text-align: center;"><input type="reset" value="重置" style="background-color: rgb(21,124,176); color: white; width: 100px;height: 30px;"/></td>
    				<td><input type="submit" value="提交" style="background-color: rgb(21,124,176); color: white; width: 100px;height: 30px;"/></td>
    			</tr>
    		</table>
    	</form>
    	</div>
   <!--  </div> -->
  </body>
</html>
