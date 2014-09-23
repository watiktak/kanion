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
	<script  language="JavaScript" type="text/javascript">
	  	function dataAnalysis() {
	  		window.location="GardeniaExtration/selectAll.htm";   
	  	};
  </script>
  </head>
  <body>
 	 <!--顶部导航-->
	<div class="Tray">
		<div class="tray">
			<a href="index.jsp" title="康源PKS统计挖掘系统" class="logo">康源PKS统计挖掘系统</a>
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
					<button  id="dataAnalysisBtn" title="数据分析" onclick="dataAnalysis()">
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
			<div id="dataAnalysis">
				<!-- 金清压缩提存列表 -->
							<table width="850px" cellpadding="0" cellspacing="0">
						
								<c:forEach items="${gardeniaExtrations}" var="item">
									<tr>
										<td>${item.batchno}</td>
										<td>${item.concentrationextractionweight}</td>
										<td>${item.originalph}</td>
										<td>${item.hclvolume}</td>
									</tr>
								</c:forEach>
								<tr/>
							</table>
			
			</div>
		
		</div>
	</div>
  </body>
  

</html>
