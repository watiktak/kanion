<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>康源PKS统计挖掘系统</title>
<link rel="stylesheet" type="text/css" href="../CSS/global.css">
	<script type="text/javascript" src="../js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="../js/jquery-extend.js"></script>
	<script type="text/javascript" src="../js/highcharts.js"></script>
	<script type="text/javascript" src="../js/exporting.js"></script>
	<script type="text/javascript" src="../js/util.js"></script>
</head>
<body>

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
							<dt csstxt="趋势显示" class="file-gnm">
								<i class="i iB i2"></i>
							</dt>
							<dd><i class="w100 dis-ib">品名</i>
								<select class="defaultOption" id="typeNames">
									<c:forEach items="${typeNames}" var="typeName">
										<option>${typeName}</option>
									</c:forEach>
								</select>
							</dd>
							<dd>							
								<i class="w100 dis-ib">批号</i>
								<select class="defaultOption" id="batchNos">
								</select>
							</dd>
							<dd>								
								<i class="w100 dis-ib">工段</i>
								<select class="defaultOption" id="processes">
								</select>
							</dd>
							<dd>	
								<i class="w100 dis-ib">阶段</i>
								<select class="defaultOption" id="phases" multiple="multiple" SIZE="2" style="height:40px;">
								</select>
								<button type="button" id="phaseSelectBtn" class="orange-btn w200 mt15 floatRight" >选择阶段</button>
							</dd>
							<dd>	
								<i class="w100 dis-ib">生产参数选取</i>
								<select class="defaultOption" id="arguments">
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
	var url=basePath+"trendAnalysis/getChart.json";
	var typeName=$("#typeNames").val();
	var process=$("#processes").val();
	var phase="";
	$("#phases option:selected").each(function(){
        phase=phase+$(this).text()+",";
    });
	phase=phase.substring(0, phase.length-1);
	var argument=$("arguments").val();
	var data={};
	data["typeName"]=typeName;
	data["process"]=process;
	data["phase"]=phase;
	data["argument"]=argument;
	var returnData=getJSON(url,data);
	//showHighcharts($('#container'));
});	


//显示品名和工段
$("#typeNames").click(function(){
	var url=basePath+"trendAnalysis/getBatchNoAndProcess.json";
	var typeName=$("#typeNames").val();
	var data={};
	data["typeName"]=typeName;
	var returnData=getJSON(url,data);
	var batchNos=returnData.batchNos;
	var processes=returnData.processes;
	$("#batchNos").empty();
	$.each(batchNos,function(){
		$("#batchNos").append("<option>"+this+"</option>");
	});
	
	$("#processes").empty();
	$.each(processes,function(){
		$("#processes").append("<option>"+this+"</option>");
	});
	
});


//显示阶段
$("#processes").click(function(){
	var url=basePath+"trendAnalysis/getPhasesByTypeNameAndProcess.json";
	var typeName=$("#typeNames").val();
	var process=$("#processes").val();
	var data={};
	data["typeName"]=typeName;
	data["process"]=process;
	var returnData=getJSON(url,data);
	
	var phases=returnData.phases;
		
	$("#phases").empty();
	$.each(phases,function(){
		$("#phases").append("<option>"+this+"</option>");
	});
	
});

//显示参数,阶段可多选
$("#phaseSelectBtn").click(function(){
	var url=basePath+"trendAnalysis/getArgumentsByTypeNameProcessPhases.json";
	var typeName=$("#typeNames").val();
	var process=$("#processes").val();
	var phase="";
	$("#phases option:selected").each(function(){
        phase=phase+$(this).text()+",";
    });
	phase=phase.substring(0, phase.length-1);
	var data={};
	data["typeName"]=typeName;
	data["process"]=process;
	data["phase"]=phase;
	var returnData=getJSON(url,data);
	
	var arguments=returnData.arguments;
		
	$("#arguments").empty();
	$.each(arguments,function(){
		$("#arguments").append("<option>"+this+"</option>");
	});
	
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