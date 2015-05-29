<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>康缘PKS统计挖掘系统</title>
<link rel="stylesheet" type="text/css" href="CSS/global.css">
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="js/jquery-extend.js"></script>
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/exporting.js"></script>
	<script type="text/javascript" src="js/util.js"></script>
</head>
<body>
	<input id="pageName" value="dataAnalysis" type="hidden"/>
	<c:import url="head.jsp"  charEncoding="UTF-8" />
	<div id="Bdy">
		<div class="bdy">
			<div class="main">	
				<div class="main_content">			
					<!-- *****************************************************趋势分析 ***************************************************** -->
					<div id="trendAnalysisDiv" >
					<!-- 分析目标表列表 -->
					<div class="intro">
						<dl>
							<dt csstxt="收率分析" class="file-gnm">
								<i class="i iB i2"></i>
							</dt>
							<dd><i class="w100 dis-ib">品名</i>
								<select class="defaultOption">
									<option>金青</option>
									<option>栀子</option>
									<option></option>								
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
									<option>z150306</option>
									<option>z150307</option>
									<option>z150308</option>
									<option>z150309</option>
									<option>z150310</option>
									<option>z150311</option>
									<option>z150312</option>
									<option>z150313</option>
									<option>z150314</option>
									<option>z150315</option>
									<option>z150316</option>
									<option>z150317</option>
									<option>z150318</option>
									<option>z150319</option>
									<option>z150320</option>
								</select>
								-
								<select class="defaultOption">
									<option>z150301</option>
									<option>z150302</option>
									<option>z150303</option>
									<option>z150304</option>
									<option>z150305</option>
									<option>z150306</option>
									<option>z150307</option>
									<option>z150308</option>
									<option>z150309</option>
									<option>z150310</option>
									<option>z150311</option>
									<option>z150312</option>
									<option>z150313</option>
									<option>z150314</option>
									<option>z150315</option>
									<option>z150316</option>
									<option>z150317</option>
									<option>z150318</option>
									<option>z150319</option>
									<option>z150320</option>
								</select>
							</dd>
							
							<dd>								
								<i class="w100 dis-ib">中间体</i>
								<select class="defaultOption">
									<option>金银花提取液</option>																	
								</select>
							</dd>
							
							<dd>	
								<i class="w100 dis-ib">项目</i>
								<select class="defaultOption">
									<option>体积</option>
									<option>温度</option>
									<option>重量</option>
								</select>							
								<button type="button" id="yieldAnalysisBtn" class="orange-btn w200 mt15 floatRight" >收率分析</button>
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
$(function(){
	var pageName=$("#pageName").val();
	loadHead(pageName);
});


var basePath=$("#basePath").val();
//点击趋势显示按钮
var chart;
$("#yieldAnalysisBtn").click(function(){
	$.each(option.series,function(i,item) {
		item.data = [];
	});

	
	for(var i = 0;i < 20;i++) {
		var random = 590 + Math.random() * 30;
		option.series[0].data.push(random);
	}
	avgYield();
	chart = new Highcharts.Chart(option);
	showHighcharts($('#container'));
});

var option = {
		 chart: {
			 renderTo:'container', 
	        type: 'column'
	        },
	        title: {
	            text: '收率分析'
	        },
	        subtitle: {
	            text: ''
	        },
	        credits:{
	        	text:''
	        },
	        xAxis: {
	            categories: ['z150301', 'z150302', 'z150303', 'z150304','z150305','z150306','z150307','z150308','z150309','z150310',
	                         'z150311','z150312','z150313','z150314','z150315','z150316',
	                         'z150317','z150318','z150319','z150320']
	        },
	        yAxis: {
	            min: 0,
	            title: {
	                text: '体积 (L)'
	            }
	        },
	        tooltip: {
	        	valueSuffix: 'L'
	        },
	        plotOptions: {
	            column: {
	                pointPadding: 0.2,
	                borderWidth: 0
	            }
	        },
	        series: [{
	            name: '金银花提取液体积',
	           // data: [581,720,557,604,575,632,578,609,581,658,639,575,629,621,
	             //      611,623,634,634,568,637] 
	        data:[]
	        },{
	        	name:'金银花提取液体积均值',
	        	type:'spline',
	        	data:[]
	        }]
}

//均值函数
function avgYield() {
	
	var avgData = option.series[0].data;
	var total = 0.0;
	var average;
	for(var i = 0;i < avgData.length ;i++) {
		total += avgData[i];
	}
	average = (total/avgData.length).toFixed(2);
	average = parseFloat(average);
	for(var i =0;i < avgData.length ;i++){
		option.series[1].data.push(average);
	}
}

</script>  	
</html>