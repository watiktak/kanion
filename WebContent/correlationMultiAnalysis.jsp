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
<link rel="stylesheet" type="text/css" href="CSS/correlation.css">	
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="js/jquery-extend.js"></script>
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/exporting.js"></script>
	<script type="text/javascript" src="js/util.js"></script>
	<script type="text/javascript" src="js/correlationMuti.js"></script>
</head>
<body>

	<input id="pageName" value="dataMining" type="hidden"/>
	<c:import url="head.jsp"  charEncoding="UTF-8" />
	<div id="Bdy">
		<div class="bdy ">
			<div class="main">
				<div id="rsddiv" class="zs_rsddiv">
						<div class="zs_selectData">
							<dl>
								<dt csstxt="多工段相关性分析" class="zs_file-gnm">
								<i class="i iB i2"></i>
								</dt>
								<dd>
									<fieldset class="zs zs_correla_fieldset">
										<legend>请选择 :</legend>
										<table>
											<!-- <tr>
												<td class="zs_name"><span>工段:</span></td>
												<td><select name="proj" id="zs_proj">
													<option value="" selected>单工段</option>
													<option value="">多工段</option>
												</select></td>
											</tr> -->
											<tr>
												<td class="zs_name"><span>品名:</span></td>
												<td><select name="tables" id="tables">
													<option value="" >热毒宁注射液金青提取物</option>
													<option value="" >热毒宁注射液栀子提取物</option>
												</select></td>
												<!-- <td class="zs_name"><span>中间体:</span></td>-->
												<!--<td><select name="midSub" id="midSub" ></select></td>-->
												</tr>
												
											<!-- <tr>
												<td class="zs_name"><span>项目:</span></td>
												<td><select name="proj" id="zs_proj">
													<option value="" selected>重量</option>
													<option value="" selected>体积</option>
												</select></td>
											</tr> -->
											
											<tr><td class="zs_name"><span>批次:</span></td>
												<td><select  id="minBatchNo" name="minBatchNo" class="zs_ser">
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
									
									<div class="zs_cal">
										<button type="button" class="zs_midButton" id="zs_midButton">相关性分析</button>
									</div>
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
			<div class="tables" >
				<div class="multi">
					<div class=" charts tablesRsd container" id="tableCM1"></div>
					<div class="chartInfo" id="explation2"></div> 
			    </div>
			    <div class="multi">
					<div class=" charts tablesRsd container" id="tableCM2"></div>
					<div class="chartInfo" id="explation3"></div> 
			    </div>
			    
			</div> 
			<input type="hidden" value="<%=basePath%>" id=basePath>
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