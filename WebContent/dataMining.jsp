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
	<input id="pageName" value="dataMining" type="hidden"/>
	<c:import url="head.jsp"  charEncoding="UTF-8" />
	<div id="Bdy">
		<div class="bdy">
			<div class="main">	
				<div class="main_content">			
					<!-- *****************************************************导航说明  ***************************************************** -->
					<p class="title"><b>欢迎使用数据挖掘模块，以下是《数据挖掘模块使用说明》，请在第一次使用时详细阅读，谢谢！本模块尚处于开发中...</b></p>
					<ul>
						<li class="navi_info" id="correlationSingleAnalysis">
							<button>
								<i class="i i8"></i>
							</button>
							相关性分析工具（单工段）:以各工段产出中间体某个项目为目标值，分析其与本工序内各工艺参数之间的相关性。
						</li>
						
						<li class="navi_info" id="correlationMultiAnalysis">
							<button>
								<i class="i i9"></i>
							</button>
							相关性分析工具（多工段）:分析多个工段中间体项目之间的相关性。
						</li>
						
						<li class="navi_info">
							<button>
								<i class="i i10"></i>
							</button>
							<p>预测分析:使用数据挖掘算法训练可接受误差范围内的模型，以工段内生产参数值为输入数据，预测中间体各项目（重量、含量、体积、密度等）的值。</p>
						</li>
						
						<li class="navi_info">
							<button>
								<i class="i i11"></i>
							</button>	
							<p>质量均一性分析：分析生产工艺参数和各中间体项目，得出质量均一性指标</p>
						</li>
				
						<li class="navi_info">
							<button>
								<i class="i i12"></i>
							</button>	
							<p>Q统计量分析</p>
						</li>
				
						<li class="navi_info">
							<button>
								<i class="i i13"></i>
							</button>	
							<p>T统计量分析</p>
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
	alert("此模块尚在开发中...")
	/*
	var basePath=$("#basePath2").val();
	var id = $(this).attr("id");
	if(id=="trendAnalysis"){
		location.href = basePath + id + "/init.htm";
	}else{
		location.href = basePath + id + ".jsp";
	}
	*/
});		
</script>



</body>
</html>