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
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/exporting.js"></script>
	<script type="text/javascript" src="js/util.js"></script>
  </head>
  <body>
 	<%@ include file="head.html" %>
	<div id="Bdy">
		<div class="bdy">
			<div class="main">				
				<!-- ***************************************************** 质量均值分析模块  ***************************************************** -->
				<!-- 质量均值分析模块 ：分析某一时间段的（干膏/含量/浸膏量）均值，表示离异点，以及形成这些离异点的原因-->
				<div id="qualityAverageAnalysisDiv" class="dis">
					<!-- 分析目标表列表 -->
					<div class="intro">
						<dl>
							<dt csstxt="转移率正态分析" class="file-gnm">
								<i class="i iB i2"></i>
							</dt>
							<dd>
								<dd><i class="w125 dis-ib">请选择品名：  </i>
									<select id="tables">
									    <option value="volvo">金青提取</option>
										<option value="saab">热毒宁栀子提取</option>
										<option value="fiat">金银花提取</option>
										<option value="audi">热毒宁提取</option>
									</select>
								</dd>
							</dd>
							<dd><i class="w125 dis-ib">请选择批次：  </i>
									<select id="minBatchNo" name="minBatchNo">
									    <option value="volvo">1</option>
										<option value="saab">2</option>
										<option value="fiat">3</option>
										<option value="audi">4</option>
									    <option value="volvo">5</option>
										<option value="saab">6</option>
										<option value="fiat">7</option>
										<option value="audi">8</option>
									    <option value="volvo">9</option>
										<option value="saab">10</option>
										<option value="fiat">11</option>
										<option value="audi">12</option>
										<option value="volvo">13</option>
										<option value="saab">14</option>
										<option value="fiat">15</option>
										<option value="audi">16</option>
									    <option value="volvo">17</option>
										<option value="saab">18</option>
										<option value="fiat">19</option>
										<option value="audi">20</option>
									</select>
									-
									<select id="maxBatchNo"name="maxBatchNo">
									    <option value="volvo">20</option>
										<option value="saab">19</option>
										<option value="fiat">18</option>
										<option value="audi">17</option>
									    <option value="volvo">16</option>
										<option value="saab">15</option>
										<option value="fiat">14</option>
										<option value="audi">13</option>
									    <option value="volvo">12</option>
										<option value="saab">11</option>
										<option value="fiat">10</option>
										<option value="audi">9</option>
										<option value="volvo">8</option>
										<option value="saab">7</option>
										<option value="fiat">6</option>
										<option value="audi">5</option>
									    <option value="volvo">4</option>
										<option value="saab">3</option>
										<option value="fiat">2</option>
										<option value="audi">1</option>
									</select>
								</dd>
								<dd><i class="w125 dis-ib">请选择中间体：</i>
									<select id="minProcessName" name="minProcessName">
									    <option value="volvo">第一次回流提取</option>
										<option value="saab">第二次回流提取</option>
										<option value="fiat">单效浓缩</option>
										<option value="audi">刮板浓缩</option>
										<option value="fiat">热处理</option>
										<option value="audi">冷藏过滤</option>
										<option value="audi">栀子过滤浸膏萃取</option>
										<option value="fiat">栀子浸膏的真空干燥</option>
										<option value="audi">栀子提取物的粉碎分装</option>
									</select>		
								</dd>
								<dd><i class="w125 dis-ib">请选择项目：  </i>
									<select id="minProcessName" name="minProcessName">
									    <option value="volvo">收率</option>
										<option value="saab">转移率</option>
									</select>
									<button type="button" onclick="qualityAverageAnalysis()" class="orange-btn w200 mt15 floatRight" >正态分析</button>
								</dd>							
						</dl>						
					</div>	
	
					<!-- 表格展示模块 -->
					<div class="tables">
						<div id="containerQuality" class="container"></div>	
						<!-- 图表说明 -->	
						<div id="chartInfo" class="chartInfo"></div>								
					</div>
					<div >
						<table class="altrowstable" id="alternatecolor" style="display:none"> 
						<tr> 
						    <td>评估项目(Item)</td><td>青金转移率分析</td>
						    <td>单位(Unit)</td><td>%</td>
						    <td>规格下限(LSL)</td><td>55</td>  
						</tr> 
						<tr> 
						    <td>目标值(Target)</td><td>60</td>
						    <td>规格上限(USL)</td><td>65</td>
						    <td>最大值(MAX)</td><td>70</td> 
						</tr> 
						<tr> 
						    <td>最小值(MIN)</td><td>51</td>
						    <td>平均值(AVE)</td><td>62</td>
						    <td>标准差(STD)</td><td>15.2</td> 
						</tr> 
						</tr> 
						<tr> 
						    <td>上管制线(+3δ)</td><td>68</td>
						    <td>下管制线(-3δ)</td><td>52</td>
						    <td>样本量(Sample Size)</td><td>35</td> 
						</tr> 
						<tr> 
						    <td>预估不良率(Defect)</td><td>5.00%</td>
						    <td>平均值偏离度(Ca)</td><td>0.04%</td>
						    <td>上限过程能力(CpU)</td><td>0.65</td> 
						</tr> 
						<tr> 
						    <td>下限过程能力(CpL)</td><td>0.65</td>
						    <td>潜在能力指数(Cp)</td><td>0.65</td>
						    <td>实际能力指数(Cpk)</td><td>0.65</td> 
						</tr> 
						<tr> 
						    <td>偏度(Skewness)</td><td>0.151</td>
						    <td>峰度(Kurtosis)</td><td>0.314</td>
						    <td></td><td></td> 
						</tr> 
						</table> 
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="<%=basePath%>" id=basePath>
	
	</body>	
	  	
	  	<!-- CSS goes in the document HEAD or added to your external stylesheet --> 
	<style type="text/css"> 
	table.altrowstable { 
	    font-family: verdana,arial,sans-serif; 
	    font-size:11px; 
	    color:#333333; 
	    text-align: center;
	    border-width: 1px; 
	    border-color: #a9c6c9; 
	    border-collapse: collapse; 
        align:left;
        margin-left:120px;
        margin-bottom:100px;
	} 
	table.altrowstable th { 
	    border-width: 1px; 
	    padding: 8px; 
	    border-style: solid; 
	    border-color: #a9c6c9; 
	} 
	table.altrowstable td { 
	    border-width: 1px; 
	    padding: 8px; 
	    border-style: solid; 
	    border-color: #a9c6c9; 
	} 
	.oddrowcolor{ 
	    background-color:#d4e3e5; 
	} 
	.evenrowcolor{ 
	    background-color:#c3dde0; 
	} 
	</style> 
	<!-- Javascript goes in the document HEAD --> 
	<script type="text/javascript"> 
		function altRows(id){ 
		    if(document.getElementsByTagName){   
		         
		        var table = document.getElementById(id);   
		        var rows = table.getElementsByTagName("th"); 
		        var rows1 = table.getElementsByTagName("td"); 
		        for(i = 0; i < rows.length; i++){           
		            if(i % 2 == 0){ 
		                rows[i].className = "evenrowcolor"; 
		            }else{ 
		                rows[i].className = "oddrowcolor"; 
		            }       
		        } 
		        for(j = 0; j < rows1.length; j++){           
		            if(j % 2 == 0){ 
		                rows1[j].className = "evenrowcolor"; 
		            }else{ 
		                rows1[j].className = "oddrowcolor"; 
		            }       
		        } 
		    } 
		} 
		window.onload=function(){ 
		    altRows('alternatecolor'); 
		} 
	</script> 
	<!-- 质量均值分析初始化 -->
	<script language="JavaScript" type="text/javascript">
		var basePath=$("#basePath").val();
		//质量均值分析按钮点击后的初始化：显示数据库中的生产表名。
		$("#qualityAverageBtn").click(function(){
			
			$("#qualityAverageAnalysisDiv").attr("class","dis");
		});	
		
	</script>
	<!-- 质量均值分析(按钮点击事件) -->
	<script type="text/javascript">
		function qualityAverageAnalysis(){
			
	  		var returnData=0;
	  		drawHighchart(returnData);
		};
	</script>
	<script>
		//呈现图表
		function drawHighchart(returnData){
			var tbl=document.getElementById("alternatecolor");
			tbl.setAttribute("style","display:block");
			    $('#containerQuality').highcharts({
			        chart: {
			        },
			        title: {
			        	style:{
			        		color:'#64B9C9',
			        		fontSize:'18px',
						    fontFamily:'微软雅黑'
			        	},
			            text: '青金提取转移率正态分布'
			        },
			        subtitle: {
			            text: 'Source:www.kanion.com'
			        },
			        xAxis: {
			            categories: [
			                '51',
			                '52',
			                '53',
			                '54',
			                '55',
			                '56',
			                '57',
			                '58',
			                '59',
			                '60',
			                '61',
			                '62',
			                '63',
			                '64',
			                '65',
			                '66',
			                '67',
			                '68',
			                '69',
			                '70'
			                
			            ],
			            title: {
			                text: '青金转移率（%）',
			                style: {
			                    color: '#89A54E'
			                }
			            },
			            plotLines:[{
			                color:'#210AF4',           //线的颜色，定义为红色
			                dashStyle:'solid',     //默认值，这里定义为实线
			                value:9,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
			                width:0.5,                //标示线的宽度，1px
			                zIndex:100,
			                label:{
			                    text:'60',     //标签的内容
			                    verticalAlign:'top',                //标签的水平位置，水平居左,默认是水平居中center
			                    x:10                         //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
			                }},
			                {
			                	color:'red',           //线的颜色，定义为红色
				                dashStyle:'solid',     //默认值，这里定义为实线
				                value:5,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
				                width:0.5,                //标示线的宽度，1px
				                zIndex:100,
				                label:{
				                    text:'56',     //标签的内容
				                    verticalAlign:'top',                //标签的水平位置，水平居左,默认是水平居中center
				                    x:10                         //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
				                }
			                },{
			                	color:'red',           //线的颜色，定义为红色
				                dashStyle:'solid',     //默认值，这里定义为实线
				                value:13,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
				                width:0.5,                //标示线的宽度，1px
				                zIndex:100,
				                label:{
				                    text:'64',     //标签的内容
				                    verticalAlign:'top',                //标签的水平位置，水平居左,默认是水平居中center
				                    x:10                         //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
				                }
			                
			            },
			            {
		                	color:'#27EB19',           //线的颜色，定义为红色
			                dashStyle:'solid',     //默认值，这里定义为实线
			                value:2,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
			                width:0.5,                //标示线的宽度，1px
			                zIndex:100,
			                label:{
			                    text:'53',     //标签的内容
			                    verticalAlign:'top',                //标签的水平位置，水平居左,默认是水平居中center
			                    x:10                         //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
			                }
		                },{
		                	color:'#27EB19',           //线的颜色，定义为红色
			                dashStyle:'solid',     //默认值，这里定义为实线
			                value:16,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
			                width:0.5,                //标示线的宽度，1px
			                zIndex:100,
			                label:{
			                    text:'67',     //标签的内容
			                    verticalAlign:'top',                //标签的水平位置，水平居左,默认是水平居中center
			                    x:10                         //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
			                }
		                }]
			        },
			        yAxis:[{ // Primary yAxis
			            labels: {
			                style: {
			                    color: '#89A54E'
			                }
			            },
			            title: {
			                text: '转移率频数',
			                style: {
			                    color: '#89A54E'
			                }
			            }
			        }, { // Secondary yAxis
			            min:0,
			        	title: {
			                text: '转移率概率分布',
			                style: {
			                    color: '#4572A7'
			                }
			            },
			            labels: {
			                style: {
			                    color: '#4572A7'
			                }
			            },
			            opposite: true
			        }],
			        
			        plotOptions: {
			        	column: {
			                pointPadding: 0.1,
			                borderWidth: 0,
			                groupPadding: 0, //分组之间的距离值
			            },
			            
			        },
			        legend:{
			        	layout:'vertical',
			    		align:'right',
			    		verticalAlign:'middle'
			        },
			        credits:{
			            enabled:false // 禁用版权信息
			        },
			        series: [{
			        	type: 'column',
			            name: '转移率概率分布',
			            data: [0,1,0,1,6,8,23,38,59,65,52,35,22,12,10,3,6,0,2,1]

			        },
			        {
			        	type: 'spline',
			            name: '转移率正态分布曲线',
			            yAxis: 1,
			            data: [0.002654,0.007485,0.018645,0.041036,0.079793,0.137074,0.20839,0.278954,0.330458,0.345858,0.319799,0.261248,0.18855,0.120226,0.067728,0.033708,0.014822,0.005753,0.001976,0.00599],
				        marker: {                                                     
			            	lineWidth: 1,                                               
			            	lineColor: Highcharts.getOptions().colors[3],               
			            	 enabled: false                                         
			            },
			            states: {
			                hover: {
			                    lineWidth: 0
			                }
			            },
			            enableMouseTracking: false
			        }]
			    });
		};
	</script>
</html>
