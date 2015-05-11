<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
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
				<!-- ***************************************************** 质量均值分析模块  ***************************************************** -->
				<!-- 质量均值分析模块 ：分析某一时间段的（干膏/含量/浸膏量）均值，表示离异点，以及形成这些离异点的原因-->
				<div id="qualityAverageAnalysisDiv" class="dis">
					<!-- 分析目标表列表 -->
					<div class="intro">
						<dl>
							<dt csstxt="转移率分析" class="file-gnm">
								<i class="i iB i2"></i>
							</dt>
							<dd>
								<dd><i class="w100 dis-ib">请选择品名：</i>
									<select id="tables">
									    <option value="volvo">金青提取</option>
										<option value="saab">热毒宁栀子提取</option>
										<option value="fiat">金银花提取</option>
										<option value="audi">热毒宁提取</option>
									</select>
								</dd>
							</dd>
							<dd><i class="w100 dis-ib">请选择批次：</i>
									<select id="minBatchNo" name="minBatchNo">
									    <option value="volvo">1</option>
										<option value="saab">2</option>
										<option value="fiat">3</option>
										<option value="audi">4</option>
									    <option value="volvo">5</option>
										<option value="saab">6</option>
										<option value="fiat">7</option>
										<option value="audi">8</option>
									    <option value="volvo">9</option>
										<option value="saab">10</option>
										<option value="fiat">11</option>
										<option value="audi">12</option>
										<option value="volvo">13</option>
										<option value="saab">14</option>
										<option value="fiat">15</option>
										<option value="audi">16</option>
									    <option value="volvo">17</option>
										<option value="saab">18</option>
										<option value="fiat">19</option>
										<option value="audi">20</option>
									</select>
									-
									<select id="maxBatchNo"name="maxBatchNo">
									    <option value="volvo">20</option>
										<option value="saab">19</option>
										<option value="fiat">18</option>
										<option value="audi">17</option>
									    <option value="volvo">16</option>
										<option value="saab">15</option>
										<option value="fiat">14</option>
										<option value="audi">13</option>
									    <option value="volvo">12</option>
										<option value="saab">11</option>
										<option value="fiat">10</option>
										<option value="audi">9</option>
										<option value="volvo">8</option>
										<option value="saab">7</option>
										<option value="fiat">6</option>
										<option value="audi">5</option>
									    <option value="volvo">4</option>
										<option value="saab">3</option>
										<option value="fiat">2</option>
										<option value="audi">1</option>
									</select>
								</dd>
								<dd><i class="w100 dis-ib">请选择工序：</i>
									<select id="minProcessName" name="minProcessName">
									    <option value="volvo">第一次回流提取</option>
										<option value="saab">第二次回流提取</option>
										<option value="fiat">单效浓缩</option>
										<option value="audi">刮板浓缩</option>
										<option value="fiat">热处理</option>
										<option value="audi">冷藏过滤</option>
										<option value="audi">栀子过滤浸膏萃取</option>
										<option value="fiat">栀子浸膏的真空干燥</option>
										<option value="audi">栀子提取物的粉碎分装</option>
									</select>
									-
									<select id="maxProcessName"name="maxProcessName">
									    <option value="volvo">第一次回流提取</option>
										<option value="saab">第二次回流提取</option>
										<option value="fiat">单效浓缩</option>
										<option value="audi">刮板浓缩</option>
										<option value="fiat">热处理</option>
										<option value="audi">冷藏过滤</option>
										<option value="audi">栀子过滤浸膏萃取</option>
										<option value="fiat">栀子浸膏的真空干燥</option>
										<option value="audi">栀子提取物的粉碎分装</option>
									</select>
									<button type="button" onclick="qualityAverageAnalysis()" class="orange-btn w200 mt15 floatRight" >转移率分析</button>
								</dd>						
						</dl>						
					</div>	
	
					<!-- 表格展示模块 -->
					<div class="tables">
						<div id="containerQuality" class="container"></div>	
						<!-- 图表说明 -->	
						<div id="chartInfo" class="chartInfo"></div>								
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="<%=basePath%>" id=basePath>
	</body>	  	

	<!-- 质量均值分析初始化 -->
	<script language="JavaScript" type="text/javascript">
		var basePath=$("#basePath").val();
		//质量均值分析按钮点击后的初始化：显示数据库中的生产表名。
		$("#qualityAverageBtn").click(function(){
			
	</script>
	<!-- 质量均值分析(按钮点击事件) -->
	<script type="text/javascript">
		function qualityAverageAnalysis(){
	  		var returnData=0;
	  		drawHighchart(returnData);
		};
	</script>
	<script>
		//呈现图表
		function drawHighchart(returnData){
			    $('#containerQuality').highcharts({
			        chart: {
			            type: 'column'
			        },
			        title: {
			        	style:{
			        		color:'#64B9C9',
			        		fontSize:'18px',
						    fontFamily:'微软雅黑'
			        	},
			            text: '青金提取转移率分析'
			        },
			        subtitle: {
			            text: 'Source:www.kanion.com'
			        },
			        xAxis: {
			            categories: [
			                '1',
			                '2',
			                '3',
			                '4',
			                '5',
			                '6',
			                '7',
			                '8',
			                '9',
			                '10',
			                '11',
			                '12',
			                '13',
			                '14',
			                '15',
			                '16'
			                
			            ]
			        },
			        yAxis: {
			            min: 0,
			            title: {
			                text: '转移率 (%)'
			            }
			        },
			        
			        plotOptions: {
			            column: {
			                pointPadding: 0,
			                borderWidth: 0
			            }
			        },
			        legend:{
			        	layout:'vertical',
			    		align:'right',
			    		verticalAlign:'middle'
			        },
			        credits:{
			            enabled:false // 禁用版权信息
			        },
			        series: [{
			            name: '青金提取转移率(%)',
			            data: [49.9, 71.5, 76.5, 45.3, 75.4, 68.2, 68.2, 66.6, 73.2, 78.5, 76.5, 65.5, 69.5, 78.5, 78.4, 43.5]

			        }]
			    });
		};
	</script>
</html>
