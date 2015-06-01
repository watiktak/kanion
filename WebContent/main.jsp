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
    <title>康缘PKS统计挖掘系统</title>
	<link rel="stylesheet" type="text/css" href="CSS/global.css">
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="js/jquery-extend.js"></script>
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/exporting.js"></script>
	<script type="text/javascript" src="js/util.js"></script>
  </head>
  <body>
 	 <!--顶部导航-->
	<div class="Tray">
		<div class="tray">
			<a href="index.jsp" title="康缘PKS统计挖掘系统" class="logo">康缘PKS统计挖掘系统</a>
			<ul class="nav">
				<li>
					<a>统计分析</a>				</li>
				<li>
					<a>数据挖掘</a>				</li>
				<li>
					<a>报表导出</a>				</li>
			</ul>
			<ul class="nav nav2">
				<li>欢迎您！<a>username</a></li>
				<li>username@zju.edu.cn</li>   		
			</ul>			
		</div>		
	</div>
	<!--工具栏-->
	<div class="Toolbar Toolbar2">
		<div class="toolbar">
			<ul class="tools">
				<li class="tool">
					<button  id="qualityAverageBtn" title="质量均值">
						<i class="i i1"></i>
					</button>	
				</li>			
			</ul>
			<ul class="tools2">
				<li class="tool toolB">
					<form>
							<button type="submit" title="搜索" class="searchBtn"></button>  
							<input type="text" class="txt" placeholder="输入搜索内容">
					</form>
				
				</li>
			</ul>					
		</div>
	</div> 
	<div id="Bdy">
		<div class="bdy">
			<div class="main">				
				<!-- ***************************************************** 质量均值分析模块  ***************************************************** -->
				<!-- 质量均值分析模块 ：分析某一时间段的（干膏/含量/浸膏量）均值，表示离异点，以及形成这些离异点的原因-->
				<div id="qualityAverageAnalysisDiv" class="noDis">
					<!-- 分析目标表列表 -->
					<div class="intro">
						<dl>
							<dt csstxt="（干膏/含量/浸膏量）均值分析" class="file-gnm">
								<i class="i iB i2"></i>
							</dt>
							<dd><i class="w100 dis-ib">请选择表：</i>
								<select id="tables"></select>
							
								<i class="w100 dis-ib">请选择批次：</i>
								<select id="minBatchNo" name="minBatchNo"></select>
								-
								<select id="maxBatchNo"name="maxBatchNo"></select>
								<button type="button" onclick="qualityAverageAnalysis()" class="orange-btn w200 mt15 floatRight" >质量均值分析</button>
							</dd>							
						</dl>						
					</div>	
	
					<!-- 表格展示模块 -->
					<div class="tables">
						<div id="containerQuality" class="container"></div>	
						<div id="containerAvgRelatedToDryConcreteWeight" class="container"></div>
						<div id="containerAvgRelatedToContent" class="container"></div>
						<div id="containerAvgRelatedToExtractWeightChart" class="container"></div>
						<div id="containerSections" class="container"></div>
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
			var url=basePath+"qualityAverageAnalysis/initTables.json";
			resultData=getJSON(url);	
			var tables=$("#tables");
			var engName=resultData.engName;
			var chName=resultData.chName;
			tables.empty();
			for(var i=0;i<engName.length;i++){
				tables.append("<option value='"+engName[i]+"'>"+chName[i]+"</option>");
			}
			$("#qualityAverageAnalysisDiv").attr("class","dis");
		});	
		//显示批次范围
		$("#tables").click(function(){
			var url=basePath+"qualityAverageAnalysis/initBatchNos.json";
			var data={};
			data["tableName"]=$("#tables").val();
			resultData=getJSON(url,data);		
			$("#minBatchNo").empty();
			$("#maxBatchNo").empty();
			bindDataToSelector(resultData.batchNos,resultData.batchNos,$("#minBatchNo"));
			bindDataToSelector(resultData.batchNos,resultData.batchNos,$("#maxBatchNo"));
		});
	</script>
	<!-- 质量均值分析(按钮点击事件) -->
	<script type="text/javascript">
		function qualityAverageAnalysis(){
			var minBatchNo=$("#minBatchNo option:selected").val();
			var maxBatchNo=$("#maxBatchNo option:selected").val();
			var tableName=$("#tables").val();
			//校验区间范围是否合格
			if(false==checkSection(minBatchNo,maxBatchNo)){
				alert("请选择合理的区间范围,您当前选择的范围为"+minBatchNo+"-"+maxBatchNo);
				return;
			}
			//提交分析请求
			var url=basePath+"/qualityAverageAnalysis/run.json";
	  		var data={};
	  		data["tableName"]=tableName;
	  		data["minBatchNo"]=minBatchNo;
	  		data["maxBatchNo"]=maxBatchNo;
	  		var returnData=getJSON(url,data);
	  		drawHighchart(returnData);
		};
	</script>
	<script>
		//呈现图表
		function drawHighchart(returnData){
			if(null!=returnData.avgChart){
				showHighcharts($('#containerQuality'));			
				drawHighcharts($('#containerQuality'),returnData.avgChart);
			}else hideHighcharts($('#containerQuality'));
			
			if(null!=returnData.avgRelatedToDryConcreteWeightChart){
				showHighcharts($('#containerAvgRelatedToDryConcreteWeight'));	
				drawHighcharts($('#containerAvgRelatedToDryConcreteWeight'),returnData.avgRelatedToDryConcreteWeightChart);
			}else hideHighcharts($('#containerAvgRelatedToDryConcreteWeight'));
				
			if(null!=returnData.avgRelatedToContentChart){
				showHighcharts($('#containerAvgRelatedToContent'));			
				drawHighcharts($('#containerAvgRelatedToContent'),returnData.avgRelatedToContentChart);
			}else hideHighcharts($('#containerAvgRelatedToContent'));	
	  			
			if(null!=returnData.avgRelatedToExtractWeightChart){
				showHighcharts($('#containerAvgRelatedToExtractWeightChart'));			
				drawHighcharts($('#containerAvgRelatedToExtractWeightChart'),returnData.avgRelatedToExtractWeightChart);
			}else hideHighcharts($('#containerAvgRelatedToExtractWeightChart'));	
			
			if(null!=returnData.normalChart){
				showHighcharts($('#containerSections'));			
				drawHighcharts($('#containerSections'),returnData.normalChart);
			}else hideHighcharts($('#containerSections'));	
		};
	</script>
</html>
