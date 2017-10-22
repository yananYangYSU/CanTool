

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
#container {
	position: absolute;
	width: 700px;
	height: 400px;
	left: -80px;
	top: 0px;
}
#container2 {
    position: absolute;
    width: 254px;
    height: 280px;
    left: 624px;
    top: 37px;
    background-color: #84cf0b;
	 
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
        <div id="container"></div>
        <div id="container2" ></div>
	
	    <script src="js/jquery-1.4.3.min.js"></script>
        <script src="js/shighcharts.js"></script>
        <script src="js/sexporting.js"></script>
        <script src="js/heatmap.js"></script>
        <script src="js/highcharts-zh_CN.js"></script>
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
            data: ${cfmbean.dataSeries},
            dataLabels: {
                enabled: false,
                color: '#000000'
            }
        }]
    });
});
</script>
</div>
</body>

</html>

​

