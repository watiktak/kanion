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
											<label for=""><span>一次拟合:</span></label>
											<label for="" class="zs_method"><input type="checkbox" ><span>线性拟合</span></label>
											<label for="" class="zs_method"><input type="checkbox"><span>非线性拟合</span></label>
										</div>
										<div>
											<label for=""><span>二次拟合:</span></label>
											<label for="" class="zs_method"><input type="checkbox"><span>差值法</span></label>
											<label for="" class="zs_method"><input type="checkbox"><span>最小二乘法</span></label>
											<label for="" class="zs_method"><input type="checkbox"><span>非线性回归</span></label>
										</div>
										<div>
											<span>x-data-range:</span>
											<select name="" id=""></select>
											<select name="" id=""></select>
										</div>
										<div>
											<span>y-data-range:</span>
											<select name="" id=""></select>
											<select name="" id=""></select>
										</div>
										</div>
									</fieldset>
									<div class="zs_cal zs_curvecal">
									<div class="zs_cs">
										<div class="zs_sr zs_curvesr">
											<span>R值:</span>
											<span class="zs_svalue zs_curvesvalue">value</span>
										</div>
										<div class="zs_sr zs_curvesr">
											<span>拟合方程:</span>
											<span class="zs_svalue zs_curvesvalue">value</span>
										</div>
										<button type="button" class="zs_orange-btn zs_w200 mt-50 floatRight">曲线拟合</button>
										</div>
									</div>
								</dd>
							</dl>
						</div>
						<div class="charts tablesCur" id="tablesCur"></div>
					</div>
				</div>
			</div>
		</div>


</body>

</html>