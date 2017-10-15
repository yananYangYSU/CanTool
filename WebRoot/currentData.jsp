<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<style>
#mainDiv {
	/*position:absolute;
	left:0px;
	top:0px;*/
	position: relative;
	margin: 0 auto;
	margin-left: 50% auto width:1100px;
	height: 600px;
	z-index: 6;
	top: 0px;
	width: 1100px;
}

#container1 {
	position: absolute;
	width: 500px;
	height: 200px;
	left: -50px;
	top: 0px;
}

#container2 {
	position: absolute;
	width: 500px;
	height: 200px;
	left: 470px;
	top: 0px;
}

#container3 {
	position: absolute;
	width: 500px;
	height: 200px;
	left: -50px;
	top: 200px;
}

#container4 {
	position: absolute;
	width: 500px;
	height: 200px;
	left: 470px;
	top: 200px;
}

#container5 {
	position: absolute;
	width: 500px;
	height: 200px;
	left: -50px;
	top: 400px;
}

#container6 {
	position: absolute;
	width: 500px;
	height: 200px;
	left: 470px;
	top: 400px;
}

#container7 {
	position: absolute;
	width: 1100px;
	height: 400px;
	left: -50px;
	top: 600px;
}
#container8 {
	position: absolute;
	width: 1100px;
	height: 400px;
	left: 100px;
	margin-top: 50px;
}

#containerControl {
	position: absolute;
	width: 100px;
	left: 980px;
	top: 80px;
	height: 20px;
	z-index: 55;
}

#hadoopControl {
	position: absolute;
	width: 200px;
	left: 980px;
	top: 300px;
	height: 20px;
	z-index: 55;
}

#startButton {
	color: rgb(255, 255, 255);
	font-size: 12px;
	padding-top: 2px;
	padding-bottom: 2px;
	padding-left: 6px;
	padding-right: 6px;
	border-width: 0px;
	border-color: rgb(197, 229, 145);
	border-style: solid;
	border-radius: 3px;
	background-color: rgb(120, 195, 0);
}

#startButton:hover {
	color: #ffffff;
	background-color: #84cf0b;
	border-color: #c5e591;
}

#startHadoopButton1 {
	color: rgb(255, 255, 255);
	font-size: 12px;
	padding-top: 2px;
	padding-bottom: 2px;
	padding-left: 6px;
	padding-right: 6px;
	border-width: 0px;
	border-color: rgb(197, 229, 145);
	border-style: solid;
	border-radius: 3px;
	background-color: rgb(120, 195, 0);
}

#startHadoopButton1:hover {
	color: #ffffff;
	background-color: #84cf0b;
	border-color: #c5e591;
}

#deleteButton {
	color: rgb(255, 255, 255);
	font-size: 12px;
	padding-top: 2px;
	padding-bottom: 2px;
	padding-left: 6px;
	padding-right: 6px;
	border-width: 0px;
	border-color: rgb(197, 229, 145);
	border-style: solid;
	border-radius: 3px;
	background-color: rgb(255, 81, 0);
}

#deleteButton:hover {
	color: #ffffff;
	background-color: #ff6f00;
	border-color: #84cf0b;
}

#viewButton {
	color: rgb(255, 255, 255);
	font-size: 12px;
	padding-top: 2px;
	padding-bottom: 2px;
	padding-left: 6px;
	padding-right: 6px;
	border-width: 0px;
	border-color: rgb(197, 229, 145);
	border-style: solid;
	border-radius: 3px;
	background-color: rgb(11, 82, 224);
}

#viewButton:hover {
	color: #ffffff;
	background-color: #2256f2;
	border-color: #c5e591;
}
</style>
</head>

<body>
	<div id="mainDiv">
		<div id="container1"></div>
		<div id="container2"></div>
		<div id="containerControl">
			<span style="font-family: 微软雅黑;font-size: 14px;">线程控制:</span><input
				type="button" id="startButton" value="开始" onclick="start();"
				style="cursor:pointer">
		</div>
		<div id="hadoopControl">
			<div>
				<span style="font-family: 微软雅黑;font-size: 14px;">启动hadoop任务</span>
			</div>
			<div id="hadoopControl_title">
				<input type="button" id="viewButton" value="运行"
					onclick="startHadoop();" style="cursor:pointer"><input
					type="text" id="maps" style="width:56px; height:20px;"
					placeholder="map数量"><input type="text" id="reduces"
					style="width:66px; height:20px;" placeholder="reduce数量">
			</div>
			<div>
				<span style="font-family: 微软雅黑;font-size: 14px;" id="res"></span>
			</div>
		</div>
		<div id="container3">
		</div>
		<div id="container4"></div>
		<div id="container5"></div>
		<div id="container6"></div>
		<div id="container7"></div>
		<div id="container8">
		<a href="currentData.jsp"><input type="button" value="曲线图" style="width:50px;height:30px;background-color:rgb(21,124,176);color: white;" /></a>
       <a href="dashboard.jsp"> <input type="button" value="仪表盘"  style="width:50px;height:30px;background-color:rgb(21,124,176);color: white;" /></a>
       <a href="distribution.jsp"> <input type="button" value="分布图"  style="width:50px;height:30px;background-color:rgb(21,124,176);color: white;" /></a>
		</div>
		<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="js/highcharts.js"></script>
		<script type="text/javascript" src="js/highcharts-more.js"></script>
		<script type="text/javascript">
			var flag = false;

			function start() {
				if (flag == true) {
					flag = false;
					document.getElementById('startButton').value = "继续";
				} else {
					flag = true;
					document.getElementById('startButton').value = "暂停";
				}
			}

			$(document)
					.ready(
							function() {
								Highcharts.setOptions({
									global : {
										useUTC : false
									}
								});
								/**
								 * solrCloud
								 */
								Highcharts
										.chart(
												'container1',
												{
													chart : {
														type : 'spline',
														animation : Highcharts.svg, // don't animate in old IE
														marginRight : 10,
														events : {
															load : function() {
																// set up the updating of the chart each second
																var series = this.series[0];
																var a = null;
																setInterval(
																		function() {
																			if (flag == true) {
																				$
																						.ajax({
																							async : true,
																							type : "post",
																							url : "currentDataRequest.do",
																							data : {},
																							dataType : "text",
																							success : function(
																									returned) {
																								a = returned;
																							}
																						});

																				if (a != null) {
																					x = (new Date())
																							.getTime(); // current time
																					y = parseFloat(a);
																					series
																							.addPoint(
																									[
																											x,
																											y ],
																									true,
																									true);
																				}
																			}
																		}, 1000);
															}
														}
													},
													title : {
														text : 'solrCloud query benchmark'
													},
													xAxis : {
														type : 'datetime',
														tickPixelInterval : 150
													},
													yAxis : {
														title : {
															text : 'queryTime'
														},
														plotLines : [ {
															value : 0,
															width : 1,
															color : '#808080'
														} ]

													},
													tooltip : {
														formatter : function() {
															return '<b>'
																	+ this.series.name
																	+ '</b><br/>'
																	+ Highcharts
																			.dateFormat(
																					'%Y-%m-%d %H:%M:%S',
																					this.x)
																	+ '<br/>'
																	+ Highcharts
																			.numberFormat(
																					this.y,
																					0)
																	+ 'ms';
														}
													},
													legend : {
														enabled : false
													},
													exporting : {
														enabled : false
													},
													series : [ ${dataSeries} ]
												});

							});
		</script>
	</div>
</body>
</html>
