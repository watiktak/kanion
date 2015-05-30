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
					<!-- *****************************************************导航说明  ***************************************************** -->
					<p class="title"><b>欢迎使用数据挖掘模块，以下是《数据挖掘模块使用说明》，请在第一次使用时详细阅读，谢谢！</b></p>
					<ul>
						<li id="trendAnalysis" class="navi_info">
							<button>  
								<i class="i i1"></i>
							</button>
							趋势显示:温度、压力、真空度、密度、流速、体积、质量（这两个都是数值，如何表示趋势）等进行趋势显示。
							
						</li>
						
						<li id="yieldAnalysis" class="navi_info">
							<button>
								<i class="i i22"></i>
							</button>
							收率分析图表:各中间体重量/体积，进行初步平均值分析对比工作。							
						</li>
						
						<li id="transferRateAnalysis" class="navi_info">
							<button>
								<i class="i i3"></i>
							</button>
							转移率分析:对各工序转移率进行计算并通过选取工序，使用柱状图显示出来。
						</li>
						
						<li  id="normalDistribution" class="navi_info">
							<button>
								<i class="i i4"></i>
							</button>
							正态分布工具:通过对各中间体一段时间内（或一段批号）出率、转移率等进行正态分析，为工艺对比和内控修订提供数据支持。
						</li>
						
						<li id="rsdAnalysis" class="navi_info">
							<button>
								<i class="i i5"></i>
							</button>
							RSD计算工具:对各中间体生产稳定性进行考察。
						</li>
						<!--  
						<li class="navi_info">
							<button>
								<i class="i i6"></i>
							</button>
							趋势分析:双纵坐标图示显示。
						</li>
						-->
						<li id="curvefitAnalysis" class="navi_info">
							<button>
								<i class="i i7"></i>
							</button>
							一次、二次方程拟合工具:可x、y两组数据，对两组数据进行一次方程、二次方程拟合。
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="<%=basePath%>" id=basePath>
<script language="JavaScript" type="text/javascript">
$(function(){
	var pageName=$("#pageName").val();
	loadHead(pageName);
});


//获取image src路径
$(".navi_info").click(function(){
	var basePath=$("#basePath2").val();
	var id = $(this).attr("id");
	if(id=="trendAnalysis" || id=="yieldAnalysis"){
		location.href = basePath + id + "/init.htm";
	}else{
		location.href = basePath + id + ".jsp";
	}
});		
</script>



</body>
</html>