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

<<<<<<< HEAD
        <script src="js/jquery-1.4.3.min.js"></script>

        <script src="js/shighcharts.js"></script>

        <script src="js/exporting.js"></script>

        <script src="js/heatmap.js"></script>

        <script src="js/highcharts-zh_CN.js"></script>
=======
        <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="js/highcharts.js"></script>
        <script type="text/javascript" src="js/exporting.js"></script>
        <script type="text/javascript" src="js/heatmap.js"></script>
>>>>>>> 869b65ed551a9acee4c68c297de99cf969afcc57

    </head>

    <body>

        <div id="container" style="height: 400px; min-width: 310px; max-width: 800px; margin: 0 auto"></div>
	<div id="qie" style="margin-top: 0px;margin-left: 500px;">
		<a href="currentData.jsp"><input type="button" value="曲线图"  style="width:50px;height:30px;background-color:rgb(21,124,176);color: white;" /></a>
        <a href="dashboard.jsp"><input type="button" value="仪表盘"  style="width:50px;height:30px;background-color:rgb(21,124,176);color: white;" /></a>
        <a href="distribution.jsp"><input type="button" value="分布图"  style="width:50px;height:30px;background-color:rgb(21,124,176);color: white;" /></a>
	</div>
        <script>

          $(function () {
    $('#container').highcharts({
	    credits: {
	       	    enabled: false
	    },
        chart: {
            type: 'heatmap',
            marginTop: 40,
            marginBottom: 80
        },
        title: {
            text: 'CAN信号分布图'
        },
        xAxis: {
            categories: ['Bit 7', 'Bit 6','Bit 5', 'Bit 4', 'Bit 3', 'Bit 2','Bit 1', 'Bit 0']
        },
        yAxis: {
            categories: ['Byte 7', 'Byte 6','Byte 5', 'Byte 4', 'Byte 3', 'Byte 2','Byte 1', 'Byte 0'],
            title: null
        },
        colors: ['#058DC7', '#50B432', '#ED561B', '#DDDF00', '#24CBE5', '#64E572','#FF9655', '#FFF263', '#6AF9C4'],
        colorAxis: {
            min: 0,
            minColor: '#FFFFFF',
            maxColor: Highcharts.getOptions().colors[0]
        },
        legend: {
            align: 'right',
            layout: 'vertical',
            margin: 0,
            verticalAlign: 'top',
            y: 25,
            symbolHeight: 280
        },
        tooltip: {
            formatter: function () {
             y=this.series.yAxis.categories[this.point.y].charAt(5);
             x=this.series.xAxis.categories[this.point.x].charAt(4);
             c=y*8+x;
                return  y*8 + x*1;
            }
        },
        series: [{
            name: 'can信号分布',
            borderWidth: 1,
            data: ${dataSeries},
            dataLabels: {
                enabled: true,
                color: '#000000'
            }
        }]
    });
});
          

        </script>

    </body>

</html>

​

