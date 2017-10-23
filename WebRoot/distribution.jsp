<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	width: 650px;
	height: 400px;
	left: -120px;
	top: 0px;
}
#tableDiv {
    width:250px;
    height:510px; 
    top:0px;
    left:500px; 
    background-color: #FFF;
    position: absolute;
	 
}
#container3 {
    position: absolute;
    width: 300px;
    height: 20px;
    left:-120px;
    top: -10px;
  	font-family:'微软雅黑';
  	font-size:14px;
  

}
#container4{
    position: absolute;
    width: 25px;
    height: 20px;
    left: 624px;
    top: 37px;
  padding-top:100px;
    colour:#000000;
   
}
#container5 {
    position: absolute;
    width: 25px;
    height: 20px;
    left: 624px;
    top: 37px;
     padding-top:150px;
    colour:#000000;
   
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
.tableContent {
	font-size: 14px;
	color: #666;
	width: 100%;
	padding: 14px;
	line-height: 40px;
	margin: 0;
	font-family:'微软雅黑';
	text-align: center;
}

.tableContent th {
	border-bottom: solid 3px #00afd1;
	padding: 10px 10px 10px 10px;
	line-height: 14px;
}

.tableContent tr td,th {
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
		}

.tableContent th.noborder {
	border: none;
	text-align: center;
}

.tableContent td {
	padding-left: 10px;
	padding-right: 10px;
}

.tableContent .tableBg td {
	background-color: #f6f6f9;
	
}

.tableContent .greyFont {
	color: #666;
	font-size: 12px;
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
        <div id="container3"> 当前字符串: ${cfmbean.canMessage}
        </div>
         <div id="tableDiv">
 <table border='0' align='center' cellpadding='0' cellspacing='0' class='tableContent' >
			                    <tr><th>信号名称</th><th>编码格式</th><th>对应id</th>
			                   </tr>
			                    <c:forEach begin="0" varStatus="status" var="list" items="${cfmList}">
			                    <tr align='center' title="高位->低位:${list.indexStr}" onMouseOver="this.style.background='#EAF2FF'"
				onMouseOut="this.style.background='#FFFFFF'">
				                <td>${list.signalName}</td>
				                    <td>${list.bitType}</td>
				                     <td>${status.count}</td>
				                    </tr>
				                    </c:forEach>
				                    </table>
       
       
       
         </div>
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
        	style:{
               fontFamily:'微软雅黑',
                },
            text: 'CAN信号分布图'
        },
         credits:{enabled:false},
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
                return this.series.xAxis.categories[this.point.x]  +' '+
                     this.series.yAxis.categories[this.point.y] + '<br>当前索引是:'+ (y*8 + x*1);

            }
        },
        series: [{
            name: 'can信号分布',
            borderWidth: 1,
            data: ${cfmbean.dataSeries},
            dataLabels: {
                enabled: true,
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

