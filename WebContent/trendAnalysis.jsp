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
<title>康缘PKS统计挖掘系统</title>
<link rel="stylesheet" type="text/css" href="../CSS/global.css">
	<script type="text/javascript" src="../js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="../js/jquery-extend.js"></script>
	<script type="text/javascript" src="../js/highcharts.js"></script>
	<script type="text/javascript" src="../js/exporting.js"></script>
	<script type="text/javascript" src="../js/util.js"></script>
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
$(function(){
	var pageName=$("#pageName").val();
	loadHead(pageName);
});


var basePath=$("#basePath").val();
//点击趋势显示按钮
/*
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
*/


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
var basePath=$("#basePath").val();
//点击趋势显示按钮
var params;
$("#trendAnalysisBtn").click(function(){
    params = $("#arguments option:selected").val();
    drawAction();
	showHighcharts($('#container'));
});	

function drawAction() {
    $('#container').highcharts({
    	chart: {
            type: 'spline',
            events: {
                load: function () {
               	 if(params == "第一次提取过程升温过程蒸汽压力（MPa）"){
               		this.yAxis[0].setTitle({
                        text: '蒸汽压力(MPa)',
                        style:{
                        	color:'#64B9C9',
    		        		fontSize:'14px',
    					    fontFamily:'微软雅黑'
                        }
                    });
               		this.setTitle({text:"第一次提取过程升温过程蒸汽压力（MPa）"});
               		this.series[0].update({
        	            name: 'T3001A',
        	            data: [0.28, 0.27, 0.29, 0.28,0.27,0.28,0.110,0.108,0.105,0.107,0.103,
        	                   0.101,0.099,0.100,0.098,0.096,0.099,0.098,0.100,0.092]
        	        });
               		this.series[1].update({
        	        	name: 'T3001B',
        	            data: [0.29, 0.28, 0.27, 0.28,0.29,0.27,0.100,0.0928,0.0905,0.0907,0.0903,
        	                   0.0905,0.091,0.0880,0.089,0.090,0.091,0.092,0.093,0.091]
        	        });
               		this.series[2].update({
        	        	name: 'T3001C',
        	            data: [0.285, 0.291, 0.285, 0.281,0.279,0.282,0.101,0.098,0.095,0.091,0.090,
        	                   0.091,0.089,0.090,0.088,0.090,0.089,0.088,0.089,0.090]
        	        });
               		this.series[3].update({
        	        	name: 'T3001D',
        	            data: [0.288, 0.281, 0.290, 0.287,0.289,0.285,0.108,0.106,0.104,0.100,0.098,
        	                   0.096,0.097,0.095,0.092,0.090,0.088,0.090,0.089,0.088]
        	        });
               		this.series[4].update({
        	        	name: 'T3001E',
        	            data: [0.293, 0.285, 0.291, 0.286,0.292,0.286,0.105,0.102,0.103,0.097,0.093,
        	                   0.091,0.090,0.088,0.089,0.090,0.091,0.089,0.090,0.089]
        	        });
               		this.series[5].update({
        	        	name: 'T3001F',
        	            data: [0.295, 0.282, 0.292, 0.283,0.290,0.282,0.109,0.106,0.102,0.101,0.094,
        	                   0.090,0.091,0.089,0.088,0.091,0.089,0.088,0.091,0.089]
        	        });
               	 } else {
               		this.yAxis[0].setTitle({
                        text: '温度(°C)',
                        style:{
                        	color:'#64B9C9',
    		        		fontSize:'14px',
    					    fontFamily:'微软雅黑'
                        }
                    });
               		this.setTitle({text:"热毒宁注射液金银花提取第一次提取过程升温过程温度上（℃）"});
               		this.series[0].update({
        	            name: 'T3001A',
        	            data: [19.5, 24.8, 34.7, 50.4,70.5,96.2,100.2,99.8,101.2,100.3,100.4,
        	                   100.5,100.3,101.1,101.7,100.9,101.4,100.8,101.1,100.9]
        	        });
               		this.series[1].update({
        	        	name: 'T3001B',
        	            data: [20.5, 25.8, 35.7, 51.4,71.5,97.2,101.2,100.8,101.8,101.3,100.1,
        	                   101.5,100.0,100.1,101.2,101.2,100.4,101.3,101.5,101.2]
        	        });
               		this.series[2].update({
        	        	name: 'T3001C',
        	            data: [19.9, 25.1, 36.2, 52.1,71.1,94.9,101.0,99.9,101.8,101.3,101.4,
        	                   101.5,101.3,100.8,101.2,101.6,101.4,101.2,101.7,101.2]
        	        });
               		this.series[3].update({
        	        	name: 'T3001D',
        	            data: [19.8, 25.3, 36.2, 51.8,71.1,97.3,101.7,100.8,101.7,100.9,100.7,
        	                   101.0,101.8,101.5,101.0,101.3,101.1,102.0,101.3,101.9]
        	        });
               		this.series[4].update({
        	        	name: 'T3001E',
        	            data: [20.8, 26.8, 35.9, 52.3,72.6,98.0,101.6,101.2,100.9,101.7,101.6,
        	                   101.2,101.1,100.9,101.1,100.8,101.9,101.1,100.7,101.9]
        	        });
               		this.series[5].update({
        	        	name: 'T3001F',
        	            data: [21.5, 26.8, 36.3, 53.4,72.9,98.5,101.8,101.2,101.9,102.0,101.8,
        	                   100.4,100.7,100.9,101.1,101.2,101.9,101.2,101.9,101.5]
        	        });             
               	 }
                }
            }
        },
        title: {
        	margin:40,
            text: '金银花提取-提取罐上部温度',
            style:{
        		color:'#64B9C9',
        		fontSize:'18px',
			    fontFamily:'微软雅黑'
        	}
        },
        xAxis: {
        	title: {
                text: '生产过程时间点(2015-5-1)',
                style:{
	        		color:'#64B9C9',
	        		fontSize:'14px',
				    fontFamily:'微软雅黑'
	        	}
            },
            categories: ['9:03', '9:06', '9:09', '9:12','9:15', '9:18', '9:21', '9:24'
                         ,'9:27', '9:30', '9:33','9:36', '9:39', '9:42', '9:45',
                         , '9:48', '9:51', '9:54','9:57', '10:00']
        },
        yAxis: {
        	min:0,
            title: {
                text: '温度(°C)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#64B9C9'
            }]
        },
        credits:{
            enabled:false // 禁用版权信息
        },
        tooltip: {
            valueSuffix: '°C'
        },
        series:[{},{},{},{},{},{}],
    });
};
			
</script>  	

</html>