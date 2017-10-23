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
<link rel="stylesheet" type="text/css" href="css/showBo.css"/>
<link rel="stylesheet" type="text/css" href="css/jh/main/pintuer.css">
<link rel="stylesheet" type="text/css" href="css/jh/main/admin.css">

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

<style>
#mainDiv {
	/*position:absolute;
	left:0px;
	top:0px;*/
	position: relative;
	margin: 0 auto;
	margin-left: 0 auto;
	height: 600px;
	z-index: 6;
	top: 0px;
	width: 800px;
}

#container1 {
	position: absolute;
	width: 600px;
	height: 280px;
	left: -190px;
	top: 0px;
}

#container2 {
	position: absolute;
	width: 280px;
	height: 280px;
	left: 530px;
	top: 0px;
}
#container3 {
	position: absolute;
	width: 600px;
	height: 280px;
	left: 50px;
	top: 280px;
}
#containerControl {
	position: absolute;
	width: 100px;
	left: 800px;
	top: 5px;
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
			<span style="font-family: 微软雅黑;font-size: 14px;">显示控制: </span><input
				type="button" id="startButton" value="暂停" onclick="start();"
				style="cursor:pointer">
		</div>
		<div id="container3">
		 <div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onclick="currentData.jsp;" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>曲线图</button>
				<button onclick="dashboard.jsp;" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>仪表盘</button>
			</div>
		</div>
		 </div>
		<div id="container4"></div>
		<div id="container5"></div>
		<div id="container6"></div>
		<div id="container7"></div>
	
		
		<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="js/highcharts.js"></script>
		<script type="text/javascript" src="js/highcharts-more.js"></script>
		<script type="text/javascript" src="js/exporting.js"></script>
		<script type="text/javascript">
			var flag = true;

			function start() {
				if (flag == true) {
					flag = false;
					document.getElementById('startButton').value = "继续";
				} else {
					flag = true;
					document.getElementById('startButton').value = "暂停";
				}
			}

//页面初始化之后每隔180秒请求一次数据
var returnedData="";
var curTime='${lastTime}';
var lastTime="";
setInterval(function() {
	if(curTime!=lastTime){
		$.ajax({
			async:true,
			type:"post",
			url:"currentDataRequest.do",
			data : {
			id:'${id}',signalName:'${signalName}',startTime:curTime
			},
			dataType:"json",
			success:function(returned){
				if(returned!=""&&returned!="null"&&returned!=null){
					returnedData = returned;
					lastTime=curTime;
				}
			}	
		});
	}
},5000);
			$(document).ready(function() {
								Highcharts.setOptions({
									global : {
										useUTC : false
									}
								});
								/**
								 * solrCloud
								 */
								Highcharts.chart('container1',{
													chart : {
														type : 'spline',
														animation : Highcharts.svg, // don't animate in old IE
														marginRight : 10,
														events : {
															load : function() {
																// set up the updating of the chart each second
																var series = this.series[0];
																var tempData="";
																setInterval(function() {
																			if (flag == true) {
																				if(returnedData!=""&&returnedData!=tempData){
																						for(var i=0;i<returnedData.length;i++){
																							    var x = (new Date(returnedData[i].time)).getTime();
																						        var y = returnedData[i].phyValue;
																						        series.addPoint([x,y],true,true);
																						}
																						if(returnedData.length!=0){
																							curTime=returnedData[returnedData.length-1].time;
																						}
																						tempData=returnedData;
																				}
																		     }
																		}, 1000);
															},
														},
													},
													title : {
														text : '${signalName}'
													},
													xAxis : {
														type : 'datetime',
														tickPixelInterval : 150,
														title : {
															text : '时间'
														}
													},
													credits:{enabled:false},
													yAxis : {
														title : {
															text : '物理值'
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
																	+ 'data'
																	+ '</b><br/>'
																	+ Highcharts.dateFormat(
																					'%Y-%m-%d %H:%M:%S',
																					this.x)
																	+ '<br/>'
																	+ Highcharts.numberFormat(
																					this.y,
																					0)
																	+ '${unit}';
														}
													},
													legend : {
														enabled : false
													},
													series:[${dataSeries}]
												});
												
		$('#container2').highcharts({
        chart: {
            type: 'gauge',
            plotBackgroundColor: null,
            plotBackgroundImage: null,
            plotBorderWidth: 0,
            plotShadow: false
        },
        title: {
            text: '速度仪'
        },
        credits:{enabled:false},
        pane: {
            startAngle: -150,
            endAngle: 150,
            background: [{
                backgroundColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                    stops: [
                        [0, '#FFF'],
                        [1, '#333']
                    ]
                },
                borderWidth: 0,
                outerRadius: '109%'
            }, {
                backgroundColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                    stops: [
                        [0, '#333'],
                        [1, '#FFF']
                    ]
                },
                borderWidth: 1,
                outerRadius: '107%'
            }, {
                // default background
            }, {
                backgroundColor: '#DDD',
                borderWidth: 0,
                outerRadius: '105%',
                innerRadius: '103%'
            }]
        },
        // the value axis
        yAxis: {
            min: 0,
            max: 200,
            minorTickInterval: 'auto',
            minorTickWidth: 1,
            minorTickLength: 10,
            minorTickPosition: 'inside',
            minorTickColor: '#666',
            tickPixelInterval: 30,
            tickWidth: 2,
            tickPosition: 'inside',
            tickLength: 10,
            tickColor: '#666',
            labels: {
                step: 2,
                rotation: 'auto'
            },
            title: {
                text: 'km/h'
            },
            plotBands: [{
                from: 0,
                to: 120,
                color: '#55BF3B' // green
            }, {
                from: 120,
                to: 160,
                color: '#DDDF0D' // yellow
            }, {
                from: 160,
                to: 200,
                color: '#DF5353' // red
            }]
        },
        series: [{
            name: 'Speed',
            data: [80],
            tooltip: {
                valueSuffix: 'km/h'
            }
        }]
    },
                               // Add some life
   function (chart) {
        if (!chart.renderer.forExport) {
        var tempData="";
            setInterval(function () {
            if (flag == true) {
            	var point = chart.series[0].points[0];
					if(returnedData!=""&&returnedData!=tempData){
						for(var i=0;i<returnedData.length;i++){
							// var x = (new Date(returnedData[i].time)).getTime();
							 var y = returnedData[i].phyValue;
							 if (y < 0 || y > 200) {
                     
                			 }else{
                			 	point.update(y);
                			 }
						}
						if(returnedData.length!=0){
							curTime=returnedData[returnedData.length-1].time;
						}
					    tempData=returnedData;
						}
			}
            }, 1000);
        }
    });
});
</script>
	</div>
</body>
</html>
