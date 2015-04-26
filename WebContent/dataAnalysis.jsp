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
					<!-- *****************************************************导航说明  ***************************************************** -->
					<p class="title"><b>《统计分析模块使用说明》</b></p>
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
						
						<li class="navi_info">
							<button>
								<i class="i i3"></i>
							</button>
							转移率分析:对各工序转移率进行计算并通过选取工序，使用柱状图显示出来。
						</li>
						
						<li  class="navi_info">
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
						
						<li class="navi_info">
							<button>
								<i class="i i6"></i>
							</button>
							趋势分析:双纵坐标图示显示。
						</li>
						
						<li id="curvefitAnalysis" class="navi_info">
							<button>
								<i class="i i7"></i>
							</button>
							一次、二次方程拟合工具:可x、y两组数据，对两组数据进行一次方程、二次方程拟合。
						</li>
						
						<li class="navi_info">
							<button>
								<i class="i i8"></i>
							</button>
							相关性分析工具（单工段）:以各工段产出中间体某个项目为目标值，分析其与本工序内各工艺参数之间的项目性，并对各个参数进行排序。
						</li>
						
						<li class="navi_info">
							<button>
								<i class="i i9"></i>
							</button>
							相关性分析工具（多工段）:以各工段产出中间体某个项目为目标值，分析其与选取工段内各工艺参数
						</li>
						
						<li class="navi_info">
							<button>
								<i class="i i10"></i>
							</button>
							<p>预测分析:以工段内生产参数值为输入数据，以中间体各项目（重量、含量、体积、密度等）为目标值进行数据拟合，</p>
							<p>得出一可接受误差范围内模型。以此模型，将生产参数输入，则可预测出目标值（中间体各项目）。方法不限于BP</p>
							<p>神经网络模型等方法。</p>	
						</li>
					
					</ul>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="<%=basePath%>" id=basePath>
<script language="JavaScript" type="text/javascript">
//获取image src路径
$(".navi_info").click(function(){
	var id = $(this).attr("id");
	location.href = id + ".jsp";
});		
</script>



</body>
</html>