<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>康源PKS统计挖掘系统</title>
<link rel="stylesheet" type="text/css" href="CSS/global.css">
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="js/jquery-extend.js"></script>
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/exporting.js"></script>
	<script type="text/javascript" src="js/util.js"></script>
</head>
<body>

	<%@ include file="head.html" %>
	<div id="Bdy">
		<div class="bdy">
			<div class="main">	
				<div class="main_content">			
					<!-- *****************************************************趋势分析 ***************************************************** -->
					<div id="trendAnalysisDiv" >
					<!-- 分析目标表列表 -->
					<div class="intro">
						<dl>
							<dt csstxt="趋势显示" class="file-gnm">
								<i class="i iB i2"></i>
							</dt>
							<dd><i class="w100 dis-ib">品名</i>
								<select class="defaultOption">
									<option>热毒宁注射液</option>								
								</select>
							</dd>
							<dd>							
								<i class="w100 dis-ib">批号</i>
								<select class="defaultOption">
									<option>z150301</option>
									<option>z150302</option>
									<option>z150303</option>
									<option>z150304</option>
									<option>z150305</option>
								</select>
							</dd>
							<dd>								
								<i class="w100 dis-ib">工段</i>
								<select class="defaultOption">
									<option>金银花一次提取</option>
									<option>金银花二次提取</option>									
								</select>
							</dd>
							<dd>	
								<i class="w100 dis-ib">阶段</i>
								<select class="defaultOption">
									<option>提取过程纯化水预热记录（板式换热器）</option>
									<option>提取过程升温过程记录（提取罐）</option>
									<option>提取操作过程记录</option>
									<option>提取过程升温过程记录（提取罐）</option>
								</select>
							</dd>
							<dd>	
								<i class="w100 dis-ib">生产参数选取</i>
								<select class="defaultOption">
									<option>蒸汽压力</option>
									<option>温度</option>
								</select>							
								<button type="button" id="trendAnalysisBtn" class="orange-btn w200 mt15 floatRight" >趋势显示</button>
							</dd>							
						</dl>						
					</div>	
	
					<!-- 表格展示模块 -->
					<div class="tables">
						<div id="container" class="noDis container"></div>							
						<!-- 图表说明 -->	
						<div id="chartInfo" class="chartInfo"></div>								
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="<%=basePath%>" id=basePath>
 	



</body>
<script language="JavaScript" type="text/javascript">
var basePath=$("#basePath").val();
//点击趋势显示按钮
$("#trendAnalysisBtn").click(function(){				
	showHighcharts($('#container'));
});	


$(function () {
    $('#container').highcharts({
        title: {
            text: 'Trend of Temperature',
            x: -20 //center
        },
        subtitle: {
            text: 'Source: www.kanion.com',
            x: -20
        },
        xAxis: {
            categories: ['1:30', '1:50', '2:10', '2:30']
        },
        yAxis: {
            title: {
                text: 'Temperature (°C)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '°C'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'A13',
            data: [99, 99, 100, 101]
        }, {
            name: 'A14',
            data: [100, 100,101,101]
        }, {
            name: 'A15',
            data: [100, 100,100,100]
        }, {
            name: 'A16',
            data: [100, 100,101,101]
        }]
    });
});
				

</script>  	

</html>