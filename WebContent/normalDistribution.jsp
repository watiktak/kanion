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
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="js/jquery-extend.js"></script>
	<script type="text/javascript" src="js/highcharts.js"></script>
	<script type="text/javascript" src="js/exporting.js"></script>
	<script type="text/javascript" src="js/util.js"></script>
</head>
<body>
	<input id="pageName" value="dataAnalysis" type="hidden"/>
	<c:import url="head.jsp"  charEncoding="UTF-8" />
	<div id="Bdy">
		<div class="bdy">
			<div class="main">				
				<!-- ***************************************************** 质量均值分析模块  ***************************************************** -->
				<!-- 质量均值分析模块 ：分析某一时间段的（干膏/含量/浸膏量）均值，表示离异点，以及形成这些离异点的原因-->
				<div id="qualityAverageAnalysisDiv" class="dis">
					<!-- 分析目标表列表 -->
					<div class="intro">
						<dl>
							<dt csstxt="正态分析" class="file-gnm">
								<i class="i iB i2"></i>
							</dt>
							<dd>
								<dd><i style=" text-align:center" class="w100 dis-ib">品名</i>
									<select id="tables" class="defaultOption" onchange="NameChange(this.id)">
									    <option value="热毒宁注射液金青提取物">热毒宁注射液青金提取物</option>
										<option value="热毒宁注射液栀子提取物">热毒宁注射液栀子提取物</option>
									</select>
								</dd>
							</dd>
							<dd><i style=" text-align:center" class="w100 dis-ib">批次</i>
									<select id="minBatchNo" name="minBatchNo" class="defaultOption" onchange="BatchNoChange1(this.id)"></select>
									-
									<select id="maxBatchNo"name="maxBatchNo" class="defaultOption">
									   <option value="z150520">z150520</option>
									</select>
								</dd>
								<dd><i style="text-align:center" class="w100 dis-ib">中间体</i>
									<select id="minProcessName" name="minProcessName" class="defaultOption">
									    <option value="volvo">金银花提取</option>
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
								<dd><i style="text-align:center" class="w100 dis-ib">项目  </i>
									<select id="minProcessName" name="minProcessName" class="defaultOption">
									    <option value="volvo">重量</option>
										<option value="saab">体积</option>
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
						    <td>单位(Unit)</td><td>Kg</td>
						    <td>规格下限(LSL)</td><td>575</td>  
						</tr> 
						<tr> 
						    <td>目标值(Target)</td><td>630</td>
						    <td>规格上限(USL)</td><td>685</td>
						    <td>最大值(MAX)</td><td>725</td> 
						</tr> 
						<tr> 
						    <td>最小值(MIN)</td><td>532</td>
						    <td>平均值(AVE)</td><td>625.8</td>
						    <td>标准差(STD)</td><td>25.2</td> 
						</tr> 
						</tr> 
						<tr> 
						    <td>上管制线(+3δ)</td><td>540</td>
						    <td>下管制线(-3δ)</td><td>720</td>
						    <td>样本量(Sample Size)</td><td>480</td> 
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
	//页面初始化
	$(function(){
		var pageName=$("#pageName").val();
		loadHead(pageName);
	});

		function altRows(id){ 
		    if(document.getElementsByTagName){   
		         
		        var table = document.getElementById(id);   
		        var rows = table.getElementsByTagName("th"); 
		        var rows1 = table.getElementsByTagName("td"); 
		        for(var i = 0; i < rows.length; i++){           
		            if(i % 2 == 0){ 
		                rows[i].className = "evenrowcolor"; 
		            }else{ 
		                rows[i].className = "oddrowcolor"; 
		            }       
		        } 
		        for(var j = 0; j < rows1.length; j++){           
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
		//转移率分析按钮点击后的初始化：显示数据。
		//定义批次数组
		var BatchNo = new Array("z150501","z150502","z150503","z150504","z150505","z150506",
				"z150507","z150508","z150509","z150510","z150511","z150512","z150513",
				"z150514","z150515","z150516","z150517","z150518","z150519","z150520");
		
var ProcessChoseId = 0; //标注品名选择种类，0--金青提取， 1--栀子提取
		
		//加载网页时自动填充批次选择的第一部分，即minBatchNo
		function loadData(){
			selectTag = document.getElementById("minBatchNo"); //获取select标记 
			colls = selectTag.options; //获取引用 
			if(colls.length > 0 && isClearOption()){ 
				clearOptions(colls); //清空select
			} 
			for(var i=0;i<BatchNo.length;i++){ 
				//item = new Option(BatchNo[i],BatchNo[i]); //通过Option()构造函数创建option对象 
				//selectTag.options.add(item); 
				 selectTag.options.add(new Option());
				 selectTag.options[i].value = BatchNo[i];
				 selectTag.options[i].text = BatchNo[i];
		    }
		};
		window.onload = loadData();
		/*
		//品名 selcet <tables> 的onchange监听事件
		function NameChange(x){
			selectTag = document.getElementById("minProcessName");   //获取select标记 
			colls = selectTag.options;   //获取引用 
			colls.length = 0; //清空select option item
			
			var name_str=$("#tables option:selected").val();   //获取品名选项
			if(name_str == "热毒宁注射液青金提取物"){    //表示选择金青提取
				ProcessChoseId = 0;
			    
			    //填充工序选项 (minProcessName)
				for(var i=0;i<QingJinArr.length;i++){
					selectTag.options.add(new Option());  //通过Option()构造函数创建option对象 
					selectTag.options[i].value = QingJinArr[i];
					selectTag.options[i].text = QingJinArr[i];
			    }
			} else {      //选择栀子提取
				ProcessChoseId = 1;
				for(var i=0;i<ZhiZiArr.length;i++){
					selectTag.options.add(new Option());
					 selectTag.options[i].value = ZhiZiArr[i];
					 selectTag.options[i].text = ZhiZiArr[i];
					
			    }
			}
		};
        */
		//批次 select <minBatchNo> onchange监听事件 
		function BatchNoChange1(x){
			selectTag = document.getElementById("maxBatchNo"); //获取select标记 
			colls = selectTag.options; //获取引用 
			colls.length = 0;
			
			var minBatchNo_str=$("#minBatchNo option:selected").val();
			var local = 0;
			//var indexNo = BatchNo.indexOf(minBatchNo_str);
			var indexNo = indexOf(BatchNo,minBatchNo_str);
			
			for(var i = BatchNo.length - 1;i >= indexNo;i--){
				selectTag.options.add(new Option());
				selectTag.options[local].value = BatchNo[i];
				selectTag.options[local].text = BatchNo[i];
				local++;
		    }
			
		};
		
		//获取数组中元素索引
		function indexOf(arr,x){

			if(!Array.indexOf) 
			{ 
			                    
		        for(var i=0; i<arr.length; i++) 
		        { 
		            if(arr[i]==x) 
		            { 
		                return i; 
		            } 
		        } 
		        return -1; 
			   
			} else {
				return arr.indexOf(x);
			}
			
		};
		
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
			        	margin:40,
			        	style:{
			        		color:'#64B9C9',
			        		fontSize:'18px',
						    fontFamily:'微软雅黑'
			        	},
			            text: '热毒宁注射液青金提取物正态分布'
			        },
			        colors:['#64B9C9','#F01041'],
			        xAxis: {
			            categories: [
			                '520',
			                '530',
			                '540',
			                '550',
			                '560',
			                '570',
			                '580',
			                '590',
			                '600',
			                '610',
			                '620',
			                '630',
			                '640',
			                '650',
			                '660',
			                '670',
			                '680',
			                '690',
			                '700',
			                '710',
			                '720',
			                '730',
			                '740',
			                '750',
			                '760'
			                
			            ],
			            title: {
			                text: '重量(Kg)',
			                style: {
			                    color: '#89A54E'
			                }
			            },
			            plotLines:[{
			                color:'#210AF4',           //线的颜色，定义为红色
			                dashStyle:'solid',     //默认值，这里定义为实线
			                value:11,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
			                width:0.8,                //标示线的宽度，1px
			                zIndex:100,
			                label:{
			                    text:'630',     //标签的内容
			                    verticalAlign:'top',                //标签的水平位置，水平居左,默认是水平居中center
			                    x:10                         //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
			                }},
			                {
			                	color:'red',           //线的颜色，定义为红色
				                dashStyle:'solid',     //默认值，这里定义为实线
				                value:5.5,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
				                width:0.8,                //标示线的宽度，1px
				                zIndex:100,
				                label:{
				                    text:'575',     //标签的内容
				                    verticalAlign:'top',                //标签的水平位置，水平居左,默认是水平居中center
				                    x:10                         //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
				                }
			                },{
			                	color:'red',           //线的颜色，定义为红色
				                dashStyle:'solid',     //默认值，这里定义为实线
				                value:16.5,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
				                width:0.8,                //标示线的宽度，1px
				                zIndex:100,
				                label:{
				                    text:'685',     //标签的内容
				                    verticalAlign:'top',                //标签的水平位置，水平居左,默认是水平居中center
				                    x:10                         //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
				                }
			                
			            },
			            {
		                	color:'#27EB19',           //线的颜色，定义为红色
			                dashStyle:'solid',     //默认值，这里定义为实线
			                value:2,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
			                width:0.8,                //标示线的宽度，1px
			                zIndex:100,
			                label:{
			                    text:'540',     //标签的内容
			                    verticalAlign:'top',                //标签的水平位置，水平居左,默认是水平居中center
			                    x:10                         //标签相对于被定位的位置水平偏移的像素，重新定位，水平居左10px
			                }
		                },{
		                	color:'#27EB19',           //线的颜色，定义为红色
			                dashStyle:'solid',     //默认值，这里定义为实线
			                value:20,               //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
			                width:0.8,                //标示线的宽度，1px
			                zIndex:100,
			                label:{
			                    text:'720',     //标签的内容
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
			                text: '频数',
			                style: {
			                    color: '#89A54E'
			                }
			            }
			        }, { // Secondary yAxis
			            min:0,
			        	title: {
			                text: '概率密度',
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
			            name: '重量频率',
			            data: [0,0,1,0,0,3,13,26,41,57,63,79,65,55,39,30,13,12,6,4,1,0,2,0,0]

			        },
			        {
			        	type: 'spline',
			            name: '重量正态分布曲线',
			            yAxis: 1,
			            lineWidth: 2, 
		            	//lineColor:'#F01041',
			            data: [0.0000447,0.0001966,0.0007455,0.002437,0.006864,0.01666,0.03487,0.06290,0.09778,
			                   0.1310,0.1513,0.15823,0.1506,0.1292,0.09553,0.06089,0.03345,0.01583,0.00646,
			                   0.00227,0.0006889,0.0001800,0.00004054,0.0000079,0.0000013],
				        marker: {                                                     
			            	//lineWidth: 1, 
			            	//lineColor:'#F01041',
			            	//lineColor: Highcharts.getOptions().colors[3],               
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
