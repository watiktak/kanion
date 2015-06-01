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
		<link rel="stylesheet" href="CSS/global_zs.css" type="text/css">
		<link rel="stylesheet" href="CSS/rsd.css" type="text/css" >
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script src="js/highcharts.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/exporting.js"></script>
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
												<td class="zs_name"><span>品名:</span></td>
												<td><select name="tables" id="tables" class="tablesA">
													<option value="" >热毒宁注射液金青提取物</option>
													<option value="" selected>热毒宁注射液栀子提取物</option>
												</select></td>
												<!-- <td class="zs_name"><span>中间体:</span></td>-->
												<!--<td><select name="midSub" id="midSub" ></select></td>-->
												</tr>
												
											<tr>
											
											<tr>
												<td class="zs_name"><span>中间体:</span></td>
												<td><select name="proj" id="zs_proj" class="zs_projA">
													<option value="" selected>金青回收浸膏重量</option>
													<option value="">干膏</option>
												</select></td>
											</tr>
											
												<td class="zs_name"><span>项目:</span></td>
												<td><select name="proj" id="zs_proj">
													<option value="" selected>重量</option>
													<option value="" selected>体积</option>
												</select></td>
											</tr>
											
											<tr><td class="zs_name"><span>批次:</span></td>
												<td><select  id="minBatchNo" name="minBatchNo" class="zs_ser">
												<option value="1">Z150401</option>
													<option value="2">Z150402</option>
													<option value="3">Z150403</option>
													<option value="4">Z150404</option>
													<option value="5">Z150405</option>
													<option value="6">Z150406</option>
													<option value="7">Z150407</option>
													<option value="8">Z150408</option>
													<option value="9">Z150409</option>
													<option value="10">Z150410</option>
													<option value="11">Z150411</option>
													<option value="12">Z150412</option>
													<option value="13">Z150413</option>
													<option value="14">Z150414</option>
													<option value="15">Z150415</option>
													<option value="16">Z150416</option>
													<option value="17">Z150417</option>
													<option value="18">Z150418</option>
													<option value="19">Z150419</option>
													<option value="20">Z150420</option>
													<option value="21">Z150421</option>
													<option value="22">Z150422</option>

													<option value="23">Z150501</option>
													<option value="24">Z150502</option>
													<option value="25">Z150503</option>
													<option value="26">Z150504</option>
													<option value="27">Z150505</option>
													<option value="28">Z150506</option>
													<option value="29">Z150507</option>
													<option value="30">Z150508</option>
												</select>
												<select name="maxBatchNo" id="maxBatchNo" class="zs_ser">
								
													<option value="1">Z150401</option>
													<option value="2">Z150402</option>
													<option value="3">Z150403</option>
													<option value="4">Z150404</option>
													<option value="5">Z150405</option>
													<option value="6">Z150406</option>
													<option value="7">Z150407</option>
													<option value="8">Z150408</option>
													<option value="9">Z150409</option>
													<option value="10">Z150410</option>
													<option value="11">Z150411</option>
													<option value="12">Z150412</option>
													<option value="13">Z150413</option>
													<option value="14">Z150414</option>
													<option value="15">Z150415</option>
													<option value="16">Z150416</option>
													<option value="17">Z150417</option>
													<option value="18">Z150418</option>
													<option value="19">Z150419</option>
													<option value="20">Z150420</option>
													<option value="21">Z150421</option>
													<option value="22">Z150422</option>

													<option value="23">Z150501</option>
													<option value="24">Z150502</option>
													<option value="25">Z150503</option>
													<option value="26">Z150504</option>
													<option value="27">Z150505</option>
													<option value="28">Z150506</option>
													<option value="29">Z150507</option>
													<option value="30">Z150508</option>
													
												</select>
									</td>
												
											</tr>
										</table>
									</fieldset>
									<fieldset class="zs zs_rsd_fieldset">
										<legend>请选择 B：</legend>
										<table>
											
											<tr>
												<td class="zs_name"><span>品名:</span></td>
												<td><select name="tables" id="tables">
													<option value="">热毒宁注射液栀子提取物</option>
													<option value="">热毒宁注射液金青提取物</option>
												</select></td>
											</tr>
											<tr>
												<td class="zs_name"><span>中间体:</span></td>
												<td><select name="proj" id="zs_proj">
													<option value="" selected>金青回收浸膏重量</option>
													<option value="">干膏</option>
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
		
		<input type="hidden" value="<%=basePath%>" id=basePath>
</body>
<script language="JavaScript" type="text/javascript">
$(function(){
	var pageName=$("#pageName").val();
	loadHead(pageName);
});
</script>
</html>