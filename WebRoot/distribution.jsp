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

        <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>

        <script src="https://img.hcharts.cn/highcharts/modules/heatmap.js"></script>

        <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>

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
                return '<b>' + 
                
                this.series.xAxis.categories[this.point.x]
                
                 + '</b> sold <br><b>' +
                 
                this.point.value
                
                 + '</b> items on <br><b>' + 
                 
                 this.series.yAxis.categories[this.point.y] 
                  
                    + '</b>';
            }
        },
        series: [{
            name: 'can信号分布',
            borderWidth: 1,
            data: [[0, 0, 7], [0, 1, 19], [0, 2, 8], [0, 3, 24], [0, 4, 67], [0, 5, 67],[0, 6, 67],[0, 7, 67],
            [1, 0, 92], [1, 1, 58], [1, 2, 78], [1, 3, 117], [1, 4, 48], [1, 5, 48],[1, 6, 48],[1, 7, 48],
            [2, 0, 35], [2, 1, 15], [2, 2, 123], [2, 3, 64], [2, 4, 52],[2, 5, 52],[2, 6, 52],[2, 7, 52],
            [3, 0, 72], [3, 1, 132], [3, 2, 114], [3, 3, 19], [3, 4, 16],[3, 5, 16],[3, 6, 16],[3, 7, 16], 
            [4, 0, 38], [4, 1, 5], [4, 2, 8], [4, 3, 117], [4, 4, 115],[4, 5, 16],[4, 6, 16],[4, 7, 16],
            [5, 0, 88], [5, 1, 32], [5, 2, 12], [5, 3, 6], [5, 4, 120],[5, 5, 16],[5, 6, 16],[5, 7, 16], 
            [6, 0, 13], [6, 1, 44], [6, 2, 88], [6, 3, 98], [6, 4, 96],[6, 5, 16],[6, 6, 16],[6, 7, 16],
            [7, 0, 31], [7, 1, 1], [7, 2, 82], [7, 3, 32], [7, 4, 30], [7, 5, 16],[7, 6, 16],[7, 7, 16]],
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

