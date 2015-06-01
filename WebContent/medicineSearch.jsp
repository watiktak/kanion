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
	<link rel="stylesheet" type="text/css" href="CSS/search.css">
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
			<ul class="tools2">
				<li class="tool toolB">
					<form>
							<button type="submit" title="搜索" class="searchBtn"></button>  
							<input type="text" class="txt" placeholder="输入搜索内容" id="name" >
					</form>
				</li>
				<li><button type="button" onclick="searchByName()" class="orange-btn w200 " >搜索药品</button></li>
			</ul>					
		</div>
	</div> 
	<div id="Bdy">
		<div class="bdy">
			<div class="main">		
				<div class="medicineList"	>
					<ul id="medicineList" >
						
					</ul>
					<ul id="searchList"></ul>
				</div>
			</div>
		</div>
	</div>
		<input type="hidden" value="<%=basePath%>" id="basePath">
	</body>
	
<script>
	function searchByName(){ //传入 event 
			var name=$("#name").val();
			var basePath=$("#basePath").val();
			var url=basePath+"KymMedicine/selectByName.json";
			var data={};
			data["name"]=name;
			var returnData=getJSON(url,data);
			data=returnData.kymMedicines;
			console.log(data);
			var html="";
			if(null!=data && 0!=data.length){			
				$.each(data,function(n,value){
						console.log(value.name);
			 			html+="<li><b>名称：</b>" + (value.name=="null"?" ":value.name) + "</li>";
						html+="<li>功效：" + (value.functions=="null"?"无":value.functions) + "</li>";
			 			html+="<li><b>规格：</b>" + (value.standard=="null"?"无":value.standard) + "</li>";
			 			html += "<li><b>成分：</b>";
			 			console.log(value.element);
			 			var medicines=value.element;
			 			var element=medicines.split("、");
			 			for(var i=0; i<element.length; i++) {
			 				html+="<a href=http://baike.baidu.com/search/word?word="+element[i]+">"+element[i]+"</a>"+" ";
			 			}
			 			html+="</li>";
			 			html+="<li><b>用法：</b>" + value.directions + "</li>";
			 			html+="<li><b>保质期：</b>" + value.expirydate + "</li>";
			 			html+="<li>"+value.manufacturingenterprises + "</li>";
		 				html+="<br/>";
				});
			}
			$("#medicineList").attr("class","noDis ");		
			$("#searchList").html(html);
	} ;
</script>
<script>
$(document).ready(function() {
			var basePath=$("#basePath").val();
			var url=basePath+"KymMedicine/selectAll.json";
			var returnData=getJSON(url);
			var data=returnData.kymMedicines;
			console.log(data);
			var html="";
			if(null!=data && 0!=data.length){			
				$.each(data,function(n,value){
						console.log(value.name);
			 			html+="<li><b>名称：</b>" + (value.name=="null"?" ":value.name) + "</li>";
						html+="<li>功效：" + (value.functions=="null"?"无":value.functions) + "</li>";
			 			html+="<li><b>规格：</b>" + (value.standard=="null"?"无":value.standard) + "</li>";
			 			html += "<li><b>成分：</b>";
			 			console.log(value.element);
			 			var medicines=value.element;
			 			var element=medicines.split("、");
			 			for(var i=0; i<element.length; i++) {
			 				html+="<a href=http://baike.baidu.com/search/word?word="+element[i]+">"+element[i]+"</a>"+" ";
			 			}
			 			html+="</li>";
			 			html+="<li><b>用法：</b>" + value.directions + "</li>";
			 			html+="<li><b>保质期：</b>" + value.expirydate + "</li>";
			 			html+="<li>"+value.manufacturingenterprises + "</li>";
		 				html+="<br/>";
				});
			};
			$("#medicineList").html(html);
});
</script>
</html>