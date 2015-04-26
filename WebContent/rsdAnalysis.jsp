<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<script src="js/global.js" type="text/javascript"></script>
		<script src="js/rsd.js" type="text/javascript"></script>		
</head>
<body>


		<%@ include file="head.html" %>			
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
										<legend>请选择</legend>
										<table>
											<tr>
												<td class="zs_name"><span>表:</span></td>
												<td><select name="tables" id="tables">
													<option value="" selected>萃取率表</option>
												</select></td>
												<td class="zs_name"><span>中间体:</span></td>
												<td><select name="midSub" id="midSub" ></select></td>
												<td class="zs_name"><span>批次:</span></td>
												<td><select  id="minBatchNo" name="minBatchNo" class="zs_ser">
													<option value="20">20</option>
													<option value="19">19</option>
													<option value="18">18</option>
													<option value="17">17</option>
													<option value="16">16</option>
													<option value="15">15</option>
													<option value="14">14</option>
													<option value="13">13</option>
													<option value="12">12</option>
													<option value="11">11</option>
													<option value="10">10</option>
													<option value="9">9</option>
													<option value="8">8</option>
													<option value="7">7</option>
													<option value="6">6</option>
													<option value="5">5</option>
													<option value="4">4</option>
													<option value="3">3</option>
													<option value="2">2</option>
													<option value="1" selected>1</option>
												</select>
												<select name="maxBatchNo" id="maxBatchNo" class="zs_ser">
													<option value="20">20</option>
													<option value="19">19</option>
													<option value="18">18</option>
													<option value="17">17</option>
													<option value="16">16</option>
													<option value="15">15</option>
													<option value="14">14</option>
													<option value="13">13</option>
													<option value="12">12</option>
													<option value="11">11</option>
													<option value="10">10</option>
													<option value="9">9</option>
													<option value="8">8</option>
													<option value="7">7</option>
													<option value="6">6</option>
													<option value="5">5</option>
													<option value="4" selected>4</option>
													<option value="3">3</option>
													<option value="2">2</option>
													<option value="1">1</option>
												</select></td>
												
											</tr>
											<tr>
												<td class="zs_name"><span>时间段:</span></td>
												<td><select name="start" id="start" class="zs_ser">
													<option value="">0</option>
													<option value="">1</option>
													<option value="">2</option>
													<option value="">3</option>
													<option value="">4</option>
													<option value="">5</option>
													<option value="">6</option>
													<option value="">7</option>
													<option value="">8</option>
													<option value="" selected>9</option>
													<option value="">10</option>
													<option value="">11</option>
													<option value="">12</option>
													<option value="">13</option>
													<option value="">14</option>
													<option value="">15</option>
													<option value="">16</option>
													<option value="">17</option>
													<option value="">18</option>
													<option value="">19</option>
													<option value="">20</option>
													<option value="">21</option>
													<option value="">22</option>
													<option value="">23</option>
													<option value="">24</option>
												</select>
												<select name="end" id="end" class="zs_ser">
													<option value="">0</option>
													<option value="">1</option>
													<option value="">2</option>
													<option value="">3</option>
													<option value="">4</option>
													<option value="">5</option>
													<option value="">6</option>
													<option value="">7</option>
													<option value="">8</option>
													<option value="">9</option>
													<option value="">10</option>
													<option value="">11</option>
													<option value="">12</option>
													<option value="">13</option>
													<option value="">14</option>
													<option value="">15</option>
													<option value="">16</option>
													<option value="" selected>17</option>
													<option value="">18</option>
													<option value="">19</option>
													<option value="">20</option>
													<option value="">21</option>
													<option value="">22</option>
													<option value="">23</option>
													<option value="">24</option>
												</select >
												</td>
								
												<td class="zs_name"><span>项目:</span></td>
												<td><select name="proj" id="zs_proj">
													<option value="" selected>项目1</option>
												</select></td>
											</tr>
										</table>
									</fieldset>
									<div class="zs_cal">
										<div class="zs_sr">
											<span>中间体:</span>
											<span class="zs_svalue"></span>
										</div>
										<div class="zs_sr">
											<span>RSD值:</span>
											<span class="zs_svalue"></span>
										</div>
										<button type="button" class="zs_orange-btn zs_w200 mt-50 floatRight">RSD计算</button>
									</div>
									
								</dd>
							</dl>
						</div>
						
					</div>
				</div>
				<div class=" charts tablesRsd" id="tablesRsd"></div>
			</div>
		</div>
		
		
</body>

</html>