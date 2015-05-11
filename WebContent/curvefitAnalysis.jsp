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
		<link rel="stylesheet" href="CSS/global_zs.css" type="text/css">
		<link rel="stylesheet" href="CSS/rsd.css" type="text/css" >
		<link rel="stylesheet" href="CSS/curvefit.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="CSS/global.css">
		<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
		<script src="js/highcharts.js" type="text/javascript"></script>
		<script src="js/highcharts-regression.js" type="text/javascript" ></script>
		<script src="js/curvefit.js" type="text/javascript"></script>
		<script src="js/global.js" type="text/javascript"></script>
<body>
<%@include file="head.html"%>			
		<div id="zs_mainbody">
			<div class="zs_bdy">
				<div class="zs_main">
					<div id="rsddiv" class="rsddiv">
						<div class="zs_selectData">
							<dl>
								<dt csstxt="一次、二次曲线拟合" class="zs_file-gnm">
								<i class="i iB i2"></i>
								</dt>
								<dd>
									<fieldset class="zs zs_curve_fieldset">
										<legend>请选择</legend>
										<div class="zs_curvechoice">
										<div>
											<label for=""><span>一次方程拟合:</span></label>
											<label for="" class="zs_method"><input type="checkbox" checked><span>线性回归</span></label>
											<!--  <label for="" class="zs_method"><input type="checkbox"><span>非线性拟合</span></label>-->
										</div>
										<div>
											<label for=""><span>二次方程拟合:</span></label>
											<label for="" class="zs_method"><input type="checkbox"><span>非线性回归</span></label>
											<label for="" class="zs_method"><input type="checkbox"><span>最小二乘法</span></label>
											<!--  <label for="" class="zs_method"><input type="checkbox"><span>非线性回归</span></label>-->
										</div>
										
										</div>
									</fieldset>
									<div class="zs_cal zs_curvecal">
									<div class="zs_cs">
										<!--  <div class="zs_sr zs_curvesr">
											<span>R值:</span>
											<span class="zs_svalue zs_curvesvalue"></span>
										</div>-->
										<!-- <div class="zs_sr zs_curvesr">
											<span>拟合方程:</span>
											<span class="zs_svalue zs_curvesvalue"></span>
										</div> -->
										<button type="button" class="zs_cfButton">文件上传</button><br/>
										<button type="button" class="zs_cfButton">曲线拟合</button>
										</div>
									</div>
								</dd>
							</dl>
						</div>
						
						<div class="charts tablesCur zs_curCharts " id="tablesCur"></div>
						<div class="zs_rsval">
						<table class="zs_rstab">
						<caption>R值</caption>
						<tr>
							<td>新绿原酸</td>
							<td>绿原酸</td>
							<td>隐绿原酸</td>
							<td>咖啡酸</td>
						</tr>
						<tr>
							<td>1</td>
							<td>0.999017</td>
							<td>0.998585</td>
							<td>0.994851</td>
						</tr>
						</table>
						<br/>
						<br/>
						</div>
					</div>
				</div>
			</div>
		</div>
		


</body>

</html>