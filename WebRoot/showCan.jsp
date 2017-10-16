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
<ul id="treeview" class="filetree" >
    <li style="font-family:"Microsoft YaHei","simsun","Helvetica Neue", Arial, Helvetica, sans-serif;"><span class="folder">BO_ 856 CDU_1: 8 CDU</span>
        <ul>
        <li><a href="currentData.jsp"><span class="file">SG_ CDU_HVACOffButtonSt</span></a></li>
        <li><span class="file">SG_ CDU_HVACOffButtonStVD</span></li>
        <li><span class="file">SG_ CDU_HVACAutoModeButtonSt</span></li>
        <li><span class="file">SG_ CDU_HVACAutoModeButtonStVD</span></li>
        <li><span class="file">SG_ CDU_HVACFDefrostButtonSt</span></li>
        </ul>
    </li>
    <li><span class="folder">BO_ 61 CDU_4: 8 CDU</span>
        <ul>
        <li><span class="file">SG_ CDU_HVACACCfg</span></li>
        <li><span class="file">SG_ CDU_HVACAirCirCfg</span></li>
        <li><span class="file">SG_ CDU_HVACComfortCfg </span></li>
        <li><span class="file">SG_ CDU_HVACACCfg</span></li>
        <li><span class="file">SG_ CDU_HVACAirCirCfg</span></li>
        <li><span class="file">SG_ CDU_HVACComfortCfg </span></li>
        <li><span class="file">SG_ CDU_HVACACCfg</span></li>
        <li><span class="file">SG_ CDU_HVACAirCirCfg</span></li>
        <li><span class="file">SG_ CDU_HVACComfortCfg </span></li>
        </ul>
    </li>
    <li><span class="folder">BO_ 1067 CDU_NM: 8 CDU</span>
        <ul>
        <li><span class="file">SG_ CDU_NMDestAddress</span></li>
        <li><span class="file">SG_ CDU_NMAlive</span></li>
        <li><span class="file">SG_ CDU_NMRing</span></li>
        <li><span class="file">SG_ CDU_NMLimpHome</span></li>
        <li><span class="file">SG_ CDU_NMDestAddress</span></li>
        <li><span class="file">SG_ CDU_NMAlive</span></li>
        <li><span class="file">SG_ CDU_NMRing</span></li>
        <li><span class="file">SG_ CDU_NMLimpHome</span></li>
        <li><span class="file">SG_ CDU_NMDestAddress</span></li>
        <li><span class="file">SG_ CDU_NMAlive</span></li>
        <li><span class="file">SG_ CDU_NMRing</span></li>
        <li><span class="file">SG_ CDU_NMLimpHome</span></li>
        </ul>
    </li>
      <li><span class="folder">BO_ 1067 CDU_NM: 8 CDU</span>
        <ul>
        <li><span class="file">SG_ CDU_NMDestAddress</span></li>
        <li><span class="file">SG_ CDU_NMAlive</span></li>
        <li><span class="file">SG_ CDU_NMRing</span></li>
        <li><span class="file">SG_ CDU_NMLimpHome</span></li>
        <li><span class="file">SG_ CDU_NMDestAddress</span></li>
        <li><span class="file">SG_ CDU_NMAlive</span></li>
        <li><span class="file">SG_ CDU_NMRing</span></li>
        <li><span class="file">SG_ CDU_NMLimpHome</span></li>
        <li><span class="file">SG_ CDU_NMDestAddress</span></li>
        <li><span class="file">SG_ CDU_NMAlive</span></li>
        <li><span class="file">SG_ CDU_NMRing</span></li>
        <li><span class="file">SG_ CDU_NMLimpHome</span></li>
        </ul>
    </li>
      <li><span class="folder">BO_ 1067 CDU_NM: 8 CDU</span>
        <ul>
        <li><span class="file">SG_ CDU_NMDestAddress</span></li>
        <li><span class="file">SG_ CDU_NMAlive</span></li>
        <li><span class="file">SG_ CDU_NMRing</span></li>
        <li><span class="file">SG_ CDU_NMLimpHome</span></li>
        <li><span class="file">SG_ CDU_NMDestAddress</span></li>
        <li><span class="file">SG_ CDU_NMAlive</span></li>
        <li><span class="file">SG_ CDU_NMRing</span></li>
        <li><span class="file">SG_ CDU_NMLimpHome</span></li>
        <li><span class="file">SG_ CDU_NMDestAddress</span></li>
        <li><span class="file">SG_ CDU_NMAlive</span></li>
        <li><span class="file">SG_ CDU_NMRing</span></li>
        <li><span class="file">SG_ CDU_NMLimpHome</span></li>
        </ul>
    </li>
</ul>
</div>
  </body>
</html>
