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
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>康缘PKS统计挖掘系统</title>
<link rel="stylesheet" href="CSS/global_zs.css" type="text/css">
<link rel="stylesheet" href="CSS/rsd.css" type="text/css">
<link rel="stylesheet" href="CSS/curvefit.css" type="text/css">
<link rel="stylesheet" type="text/css" href="CSS/global.css">
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript" src="js/papaparse.min.js"></script>
<script type="text/javascript" src="js/jquery.csv-0.71.min.js"></script><!-- 新增 -->
<script type="text/javascript" src="js/jquery-form.js"></script><!-- 新增 -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script><!-- 新增 -->

 <script type="text/javascript" src="js/highcharts-regression.js"></script> 
<script src="js/curvefit.js" type="text/javascript"></script>
<script src="js/global.js" type="text/javascript"></script> 
<body>
	<input id="pageName" value="dataAnalysis" type="hidden"/>
	<c:import url="head.jsp"  charEncoding="UTF-8" />
	<div id="zs_mainbody">
		<div class="zs_bdy">
			<div class="zs_main">
				<div id="rsddiv" class="rsddiv">
					<div class="zs_selectData">
						<dl>
							<dt csstxt="曲线拟合" class="zs_file-gnm">
								<i class="i iB i2"></i>
							</dt>
							<dd>
								<fieldset class="zs zs_curve_fieldset">
									<legend>请选择</legend>
									<div class="zs_curvechoice">
										<form id="uploadForm" enctype="multipart/form-data">
										<label for="">选择文件：</label>
											<input type="file" name="fileupload" id="inputFile" value=""/>
											<br/>
										<label for="">上传文件：</label>
											<input type="submit" id="pclick" value="上传文件"/>
										</form>
										
										<!--<div>
											<label for="">拟合方式-1:</label>
											<input type = "checkbox" id = "zs_linear" class="zs_fit" />一次方程
											<input type = "checkbox" id = "zs_polynomial" class="zs_fit" />二次方程
											<input type = "checkbox" id = "zs_exponential" class="zs_fit" />指数方程
											<input type = "checkbox" id = "zs_logarithmic" class="zs_fit" />对数方程
										</div>  -->
										<div>
											<label for="">拟合方式:</label>
											<input type="checkbox" id="zs_onefit" class="zs_fit"/>一次方程
											<input type="checkbox" id="zs_twofit" class="zs_fit" />二次方程
											<input type="checkbox" id="zs_threefit" class="zs_fit" />三次方程
											<input type="checkbox" id="zs_exponentialfit" class="zs_fit" />指数方程
										</div>
										<!--  <div><span class="zs_connectInternert">( 注意：选择方式 2 时请先连接网络及VPN )</span></div>-->
										
										
										
										 <!--  <div>
											<label for=""><span>线性拟合:</span></label> <label for=""
												class="zs_method"><input type="button"
												id="zs_onefit" value="一次方程"></label>
										</div>
										<div>
											<label for=""><span>非线性拟合:</span></label> <label for=""
												class="zs_method"><input type="button"
												id="zs_twofit" value="二次方程"></label> 
												<label for="" class="zs_method"><input type="button" id="zs_threefit" value="三次方程"></label>
											<label for="" class="zs_method"><input type="button" id="zs_exponentialfit" value="指数方程"></label>
										</div>-->

									</div>
								</fieldset>
								<div class="zs_cal zs_curvecal">
									<div class="zs_cs">
										<button  class="zs_cfButton" id="start">曲线拟合</button>
										<button  class="zs_cfButton" id="reset">重置</button>
									</div>
								</div>
							</dd>
						</dl>
					</div>
					<div class="charts" id="charts">
					<div class=" zs_curCharts " id="tablesCur-1"></div>
					<div class=" zs_curCharts " id="tablesCur-2"></div>
					<div class=" zs_curCharts " id="tablesCur-3"></div>
					<div class=" zs_curCharts " id="tablesCur-4"></div>
					
					
					<div class=" zs_curCharts " id="tablesCur-5"></div>
					</div>
				</div>
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