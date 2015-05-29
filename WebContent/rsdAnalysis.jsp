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
		<link rel="stylesheet" href="CSS/global_zs.css" type="text/css">
		<link rel="stylesheet" href="CSS/rsd.css" type="text/css" >
		<link rel="stylesheet" href="CSS/curvefit.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="CSS/global.css">
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script src="js/highcharts.js" type="text/javascript"></script>
		<script src="js/global.js" type="text/javascript"></script>
		<script src="js/rsd.js" type="text/javascript"></script>		
</head>
<body>
	<input id="pageName" value="dataAnalysis" type="hidden"/>
	<c:import url="head.jsp"  charEncoding="UTF-8" />	
		<div id="zs_mainbody">
			<div class="zs_bdy">
				<div class="zs_main">
					<div id="rsddiv" class="zs_rsddiv">
						<div class="zs_selectData">
							<dl>
								<dt csstxt="RSD值计算" class="zs_file-gnm">
								<i class="i iB i2"></i>
								</dt>
								<dd>
									<fieldset class="zs zs_rsd_fieldset">
										<legend>请选择 A:</legend>
										<table>
											<tr>
												<td class="zs_name"><span>中间体:</span></td>
												<td><select name="proj" id="zs_proj">
													<option value="" selected>浓缩浸膏重量</option>
													<option value="">干膏</option>
												</select></td>
											</tr>
											<tr>
												<td class="zs_name"><span>品名:</span></td>
												<td><select name="tables" id="tables">
													<option value="" >金青</option>
													<option value="" selected>栀子</option>
												</select></td>
												<!-- <td class="zs_name"><span>中间体:</span></td>-->
												<!--<td><select name="midSub" id="midSub" ></select></td>-->
												</tr>
												
											<tr>
												<td class="zs_name"><span>项目:</span></td>
												<td><select name="proj" id="zs_proj">
													<option value="" selected>重量</option>
													<option value="" selected>体积</option>
												</select></td>
											</tr>
											
											<tr><td class="zs_name"><span>批次:</span></td>
												<td><select  id="minBatchNo" name="minBatchNo" class="zs_ser">
													<option value="20">Z131124</option>
													<option value="20">Z131123</option>
													<option value="20">Z131122</option>
													<option value="20">Z131121</option>
													<option value="20">Z131120</option>
													<option value="19">Z131119</option>
													<option value="18">Z131118</option>
													<option value="17">Z131117</option>
													<option value="16">Z131116</option>
													<option value="15">Z131115</option>
													<option value="14">Z131114</option>
													<option value="13">Z131113</option>
													<option value="12">Z131112</option>
													<option value="11">Z131111</option>
													<option value="10">Z131110</option>
													<option value="9">Z131109</option>
													<option value="8">Z131108</option>
													<option value="7">Z131107</option>
													<option value="6">Z131106</option>
													<option value="5">Z131105</option>
													<option value="4">Z131104</option>
													<option value="3">Z131103</option>
													<option value="2">Z131102</option>
													<option value="1" selected>Z131101</option>
												</select>
												<select name="maxBatchNo" id="maxBatchNo" class="zs_ser">
													<option value="20">Z131124</option>
													<option value="20">Z131123</option>
													<option value="20">Z131122</option>
													<option value="20">Z131121</option>
													<option value="20">Z131120</option>
													<option value="19">Z131119</option>
													<option value="18">Z131118</option>
													<option value="17">Z131117</option>
													<option value="16">Z131116</option>
													<option value="15">Z131115</option>
													<option value="14">Z131114</option>
													<option value="13">Z131113</option>
													<option value="12">Z131112</option>
													<option value="11">Z131111</option>
													<option value="10">Z131110</option>
													<option value="9">Z131109</option>
													<option value="8">Z131108</option>
													<option value="7">Z131107</option>
													<option value="6">Z131106</option>
													<option value="5">Z131105</option>
													<option value="4">Z131104</option>
													<option value="3">Z131103</option>
													<option value="2">Z131102</option>
													<option value="1">Z131101</option>
												</select></td>
												
											</tr>
										</table>
									</fieldset>
									<fieldset class="zs zs_rsd_fieldset">
										<legend>请选择 B：</legend>
										<table>
											<tr>
												<td class="zs_name"><span>中间体:</span></td>
												<td><select name="proj" id="zs_proj">
													<option value="" selected>浓缩浸膏重量</option>
													<option value="">干膏</option>
												</select></td>
											</tr>
											<tr>
												<td class="zs_name"><span>品名:</span></td>
												<td><select name="tables" id="tables">
													<option value="">栀子</option>
													<option value="">金青</option>
												</select></td>
											</tr>
											<tr>
												<td class="zs_name"><span>项目:</span></td>
												<td><select name="proj" id="zs_proj">
													<option value="">重量</option>
													<option value="">体积</option>
												</select></td>
											</tr>
											<tr>
												 <td class="zs_name"><span>时间段:</span></td>
												<td><select name="start" id="start" class="zs_ser">
													<option value="">1月</option>
													<option value="">2月</option>
													<option value="">3月</option>
													<option value="">4月</option>
													<option value="">5月</option>
													<option value="">6月</option>
													<option value="">7月</option>
													<option value="">8月</option>
													<option value="">9月</option>
													<option value="" >10月</option>
													<option value="">11月</option>
													<option value="">12月</option>
			
												</select>
												<select name="end" id="end" class="zs_ser">
													<option value="">1月</option>
													<option value="">2月</option>
													<option value="">3月</option>
													<option value="">4月</option>
													<option value="">5月</option>
													<option value="">6月</option>
													<option value="">7月</option>
													<option value="">8月</option>
													<option value="">9月</option>
													<option value="">10月</option>
													<option value="">11月</option>
													<option value="">12月</option>
					
												</select >
												</td>
											</tr>
										</table>
									</fieldset>
									<div class="zs_cal">
										<!--  <div class="zs_sr">
											<span>中间体:</span>
											<span class="zs_svalue"></span>
										</div>-->
										<div class="zs_sr">
											<span>RSD值:</span>
											<span class="zs_svalue" id="zs_value"></span>
										</div>
										<button type="button" class="zs_midButton" id="zs_midButton">RSD计算</button>
									</div>
									
								</dd>
							</dl>
						</div>
					</div>
				</div>
				
				
				<div class=" charts tablesRsd" id="tablesRsd"></div> 
				<div class="zs_midValue">
					 <table class="zs_mid"></table>
				</div>
			</div>
		</div>
		
		
</body>
<script language="JavaScript" type="text/javascript">
$(function(){
	var pageName=$("#pageName").val();
	loadHead(pageName);
});
</script>
</html>