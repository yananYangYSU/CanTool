<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

    <head>

        <meta charset="utf-8"><link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <style>

            /* css 代码  */

        </style>

        <script src="https://img.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>

        <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>

        <script src="https://img.hcharts.cn/highcharts/highcharts-more.js"></script>

        <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>

        <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>

        <script src="https://img.hcharts.cn/highcharts/themes/grid-light.js"></script>

    </head>

    <body>

        <div id="container" style="min-width: 310px; max-width: 400px; height: 300px; margin: 0 auto"></div>
	<div id="qie" style="margin-top: 50px;margin-left: 500px;">
		<a href="currentData.jsp"><input type="button" value="曲线图"  style="width:50px;height:30px;background-color:rgb(21,124,176);color: white;" /></a>
        <a href="dashboard.jsp"><input type="button" value="仪表盘"  style="width:50px;height:30px;background-color:rgb(21,124,176);color: white;" /></a>
        <a href="distribution.jsp"><input type="button" value="分布图"  style="width:50px;height:30px;background-color:rgb(21,124,176);color: white;" /></a>
	</div>
        <script>

           $(function () {
    $('#container').highcharts({
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
                valueSuffix: ' km/h'
            }
        }]
    },
                               // Add some life
                               function (chart) {
        if (!chart.renderer.forExport) {
            setInterval(function () {
                var point = chart.series[0].points[0],
                    newVal,
                    inc = Math.round((Math.random() - 0.5) * 20);
                newVal = point.y + inc;
                if (newVal < 0 || newVal > 200) {
                    newVal = point.y - inc;
                }
                point.update(newVal);
            }, 3000);
        }
    });
});

        </script>

    </body>

</html>

​

