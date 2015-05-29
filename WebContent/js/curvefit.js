/*---------------------------------------highCharts 曲线模拟图--------------------------------------------------------*/
 var chart;
 var optionsHighcharts = {
		 chart:{
			 renderTo : '',
				type : 'scatter',
				//width:'800',
				height:'550',
				plotBorderWidth:1,
				//borderWidth:1
		 },
		 title : {
				text : ""
			},
			credits : {
				href : 'www.xxx.org',
				position : {
					x : -30,
					y : 0
				},
				style : {
					color : 'black',
					fontWeight : 'normal'
				},
				enable : true,
				text : ''
			},
//			colors : [ '#000000',// 黑
//			'#ff0000',// 红
//			'#00ff00',// 绿
//			'#0000ff',// 蓝
//			'#ffff00',// 黄
//			'#ff00ff',// 紫
//			'#ffffff',// 紫
//			],
			colors:[
			        'red',
			        'green',
			        'blue',
			        'magenta',
			        'yellow',
			        'chocolate',
			        'blueviolet',
			        'lime',
			        '#0000AA',
			        'azure',
			        'deeppink',
			        'coral',
			        'orange',
			        'bronze'
			],
			xAxis: {
				type:'linear',
				startOnTick:true,
				min:0
				
//				plotLines:[{
//					value:0,
//					width:2,
//					color:'#808080'
//				}]
			},
			yAxis: {
				type: 'linear',
				startOnTick:true,
				min:0,
				tickInterval:10
			},
//			legend : {
//				layout : 'vertical',
//				align : 'left',
//				verticalAlign : 'top',
//				x : 50,
//				y : 0,
//				floating : true,
//				backgroundColor : '#fff',
//				borderWidth : 0
//			},
			plotOptions : {
				
				scatter : {
					marker : {
						fillColor: '#ffffff',
						lineWidth: 2,
						lineColor: null,
						radius : 4,
						states : {
							hover : {
								enabled : true,
							}
						}
					},
//					states : {
//						hover : {
//							marker : {
//								enabled : false
//							}
//						}
//					},
					tooltip : {
						headerFormat : '<b>{series.name}</b><br>',
						pointFormat : '{point.x},{point.y}'
					}
				}
			},
			series:[]
 };
 
 /*-------------------------------------------------------------------------------------------------------------------------------------------*/
/*{$(document).ready(
		function() {
			chart = new Highcharts.Chart({
				chart : {
					renderTo : 'tablesCur-5',
					type : 'scatter',
					width:'800'
				},
				title : {
					text : "指数曲线拟合图"
				},
				credits : {
					href : 'www.xxx.org',
					position : {
						x : -30,
						y : 0
					},
					style : {
						color : '#909090',
						fontWeight : 'normal'
					},
					enable : true,
					text : 'Source:www.kanion.com'
				},
				colors : [ '#000000',// 黑
				'#ff0000',// 红
				'#00ff00',// 绿
				'#0000ff',// 蓝
				'#ffff00',// 黄
				'#ff00ff',// 紫
				'#ffffff',// 紫
				],
				xAxis : {

				},
				legend : {
					layout : 'vertical',
					align : 'left',
					verticalAlign : 'top',
					x : 50,
					y : 0,
					floating : true,
					backgroundColor : '#fff',
					borderWidth : 0
				},
				plotOptions : {
					scatter : {
						marker : {
							radius : 5,
							states : {
								hover : {
									enabled : true,
									lineColor : 'rgb(100,100,100)'
								}
							}
						},
						states : {
							hover : {
								marker : {
									enabled : false
								}
							}
						},
						tooltip : {
							headerFormat : '<b>{series.name}</b><br>',
							pointFormat : '{point.x},{point.y}'
						}
					}
				},
				series : [
						{
							regression : true,
							rValue : true,
							regressionSettings : {
								type : 'exponential',
								color : 'rgba(223,83,83,.9)'
							},
							color : 'rgba(223,83,83,.5)',
							name : '新绿原酸',
							data : [ [ 1, 3.7 ], [ 2, 7.2 ], [ 3, 10.6 ],
									[ 4, 13.9 ], [ 5, 16.9 ], [ 6, 19.8 ],
									[ 7, 22.6 ], [ 8, 25.3 ], [ 9, 28 ],
									[ 10, 30.6 ], [ 11, 33.1 ], [ 12, 35.4 ],
									[ 13, 37.6 ], [ 14, 39.8 ], [ 15, 41.9 ],
									[ 16, 44 ], [ 17, 45.9 ],[18,47.8],[19,50.8],[20,53.8],[21,56.9],[22,59.9] ]

						},
						{
							regression : true,
							rValue:true,
							regressionSettings : {
								type : 'exponential',
								color : 'rgba(19,221,77,.9)'
							},
							color : 'rgba(19,221,77,.5)',
							name : '绿原酸',
							data : [ [ 1, 5.1 ], [ 2, 10 ], [ 3, 14.6 ],
									[ 4, 19 ], [ 5, 23.1 ], [ 6, 26.9 ],
									[ 7, 30.5 ], [ 8, 34.1 ], [ 9, 37.4 ],
									[ 10, 40.8 ], [ 11, 43.9 ], [ 12, 46.7 ],
									[ 13, 49.3 ], [ 14, 51.9 ], [ 15, 54.4 ],
									[ 16, 56.7 ],[17,58.9],[18,61],[19,64.2],[20,67.5],[21,56.9],[22,59.9] ]
						},
						{
							regression : true,
							regressionSettings : {
								type : 'exponential',
								color : 'rgba(86,255,255,.9)'
							},
							color : 'rgba(86,255,255,.5)',
							name : '隐绿原酸',
							data : [ [ 1, 5.3 ], [ 2, 10.2 ], [ 3, 15],
									[ 4, 19.5 ], [ 5, 23.7 ], [ 6, 27.5 ],
									[ 7, 31.3 ], [ 8, 34.8 ], [ 9, 38.2 ],
									[ 10, 41.5 ], [ 11, 44.7 ], [ 12, 47.5 ],
									[ 13, 50.1], [ 14,52.6], [ 15, 55 ],
									[ 16, 57.4 ], [ 17, 59.5 ],[18,61.5],[19,64.7], [20,67.9],[21,71.1],[22,74.3]]
						},
						{
							regression : true,
							regressionSettings : {
								type : 'exponential',
								color : 'rgba(0,0,191,.9)'
							},
							color : 'rgba(0,0,191,.5)',
							name : '咖啡酸',
							data : [ [ 1, 8.1 ], [ 2, 15.5 ], [ 3, 22.3 ],
									[ 4, 28.7 ], [ 5, 34.5 ], [ 6, 39.5 ],
									[ 7, 44.3 ], [ 8, 48.8 ], [ 9, 52.9 ],
									[ 10, 56.8 ], [ 11, 60.3 ], [ 12, 63.3 ],
									[ 13, 65.9 ], [ 14, 68.4 ], [ 15, 70.7 ],
									[ 16, 72.8 ], [ 17, 74.6 ], [ 18, 76.3 ],
									[ 19, 78.9 ],[20,81.4],[21,83.9],[22,86.5] ]
						} ]
			});
		});}*/
 /*-----------------------------------------------------------------------------------------------------------*/

/*$(document).ready(function(){
	$('#uploadForm').submit(function(){
		$(this).ajaxSubmit({
			type:'post',
			url:'http://localhost:8080/kanion/curvefit/addAction.json',
			dataType:'text',//注意这里的格式和前台定义的格式，不然会出错，success函数不执行
			success:function(data){
				console.log("111");
				console.log("fileName:"+data);
				alert("文件"+data+"上传成功");
				getDataFromFile(data);
			},
			error:function(){
				console.log("数据格式出错");
			}
		});
		return false;//阻止表单默认提交
	});
});
function getDataFromFile(name){
	$.get('/kanion/'+name,function(csvString){
		$('#tablesCur-1').html(csvString); 
	});
}
*/
/*添加事件函数*/
var EventUtil={
		addHandler:function(element,type,handler){
			if(element.addEventListener){//DOM2级方法
				element.addEventListener(type,handler,false);
			}else if(element.attachEvent){//IE方法
				element.attachEvent("on"+type,handler);
			}else{//DOM0级方法
				element["on"+type]=handler;
			}
		},
		removeHandler:function(element,type,handler){
			if(element.removeEventListener,handler){
				element.removeEventListener(type,handler,false);
			}else if(element.detachEvent){
				element.detachEvent("on"+type,handler);
			}else{
				element["on"+type]=null;
			}
		}
}

google.load("visualization", "1", {
	packages : [ "corechart" ]
});
google.setOnLoadCallback(drawChart);

function drawChart() {
	var data;
	var suffix="";
	var zs_linear = document.getElementById("zs_linear");
	var zs_polynomial = document.getElementById("zs_polynomial");
	var zs_exponential = document.getElementById("zs_exponential");
	var zs_logarithmic = document.getElementById("zs_logarithmic");
	
	
	var one_equation = document.getElementById("zs_onefit");
	var two_equation = document.getElementById("zs_twofit");
	var three_equation = document.getElementById("zs_threefit");
	var exponential_equation = document.getElementById("zs_exponentialfit");
	var startBtn = document.getElementById("start");
	var resetBtn = document.getElementById("reset");
	var currentFile = document.getElementById("inputFile");
	var lineColor = ['red','green','blue','magenta','yellow','chocolate','blueviolet','lime','#0000AA','azure','deeppink','coral','orange','bronze'];
	var maxYvalue = 0.0;//y值的最大值，根据这个值设置y轴刻度范围
	var maxXvalue = 0.0;//x值的最大值，根据这个值设置x轴刻度范围
	var chartLinear;
	var columnNum;
	var rowNum;
	//上传文件,获得数据---------------------------------------------
	$('#uploadForm').submit(function(){
		$(this).ajaxSubmit({
			type:'post',
			url:'http://localhost:8080/kanion/curvefit/addAction.json',
			dataType:'text',//注意这里的格式和前台定义的格式，不然会出错，success函数不执行
			success:function(fileName){
				console.log("fileName:"+fileName);
				alert("文件"+fileName+"上传成功");
				var index=fileName.lastIndexOf(".");
				suffix=fileName.substring(index+1);
				if(suffix == "csv"){
					$.get('/kanion/'+fileName,function(csvString){
						console.log("上传文件中获得的数据：");
						console.log(csvString);
						
	/*----------------------使用googlecharts进行曲线拟合*------------------------------------------------*/
						
						var zs_arrayData=$.csv.toArrays(csvString, {onParseValue: $.csv.hooks.castToScalar});
						data=google.visualization.arrayToDataTable(zs_arrayData);
						
   
						
	/*----------------------------使用highcharts进行曲线拟合---------------------------------------------*/		
						var lines = csvString.split('\n');
						var series = [];
						var firstLine = lines[0].split(',');
						columnNum = firstLine.length;//列数，即series中有columnNum-1组数据
						rowNum = lines.length;
						//csv文件的第一行
						
						for(i = 0;i < columnNum-1; i++ ) {
							series.push({
								data: [],
								name:firstLine[i+1],
								color:lineColor[i],
								regression: true,
								rValue: true,
								regressionSettings:{
									//type: 'polynomial'
									type:''
								}
							});
						}
						$.each(lines,function(lineNo,line) {
							var items = line.split(',');
							//header line containers categories
							if (lineNo == 0) {
//								$.each(items, function(itemNo, item) {
//									if (itemNo > 0) optionsHighcharts.xAxis.categories.push(item);
//								});
							}else {  //the rest of the lines contain data 
								var xValue =parseFloat(items[0]);
								var seriesRow = {
									data: []
								};
								$.each(items,function(itemNo,item) {
									
									if (itemNo == 0) {
										if(maxXvalue < item) {
											maxXvalue = parseFloat(item);
										}
										
									}
									else {
										if(maxYvalue < item) {
											maxYvalue = parseFloat(item);
										}
										series[itemNo-1].data.push([xValue,parseFloat(item)]);
									}
									
								});
							}
						}) ;
//						console.log("data series as follows");
//						console.log(optionsHighcharts.series);
						for(i = 0;i < columnNum-1 ;i++) {
							optionsHighcharts.series.push(series[i]);
						}
						
	
						optionsHighcharts.xAxis.max = maxXvalue + 1;
						optionsHighcharts.yAxis.max = maxYvalue + 1;
						//chart = new Highcharts.Chart(optionsHighcharts);
					});
				}
			},
			error:function(){
				console.log("数据格式出错");
			}
		});
		
		return false;//阻止表单默认提交
	});
	
	
	
	
	/*------------------------------------------------*/
//	$.get("/kanion/test.csv",function(csvString){
//		var zs_arrayData=$.csv.toArrays(csvString, {onParseValue: $.csv.hooks.castToScalar});
//		data2 = google.visualization.arrayToDataTable(zs_arrayData);
//	});
	
	
var data1 = google.visualization.arrayToDataTable([
			[ "次数", "新绿原酸", '绿原酸', '隐绿原酸','咖啡酸' ], [ 1, 3.7, 5.1, 5.6,8.1 ],
			[ 2, 7.2, 10, 9.2 ,15.5], [ 3, 10.6, 14.6, 14.0 ,22.3],
			[ 4, 13.9, 19.0, 17.5 ,28.7], [ 5, 16.9, 23.1, 20.7 ,34.5],
			[ 6, 19.8, 26.9, 25.5 ,39.5], [ 7, 22.6, 30.5, 31.2 ,44.3],
			[ 8, 25.3, 34.1, 36.8 ,48.8], [ 9, 28, 37.4, 37.2 ,52.9],
			[ 10, 30.6, 40.8, 39.5 ,56.8], [ 11, 33.1, 43.9, 42.7,60.3 ],
			[ 12, 35.4, 46.7, 49.5 ,63.3], [ 13, 37.6,49.3, 50.1 ,65.9],
			[ 14, 39.8, 51.9, 52.6 ,68.4], [ 15, 41.9, 54.4, 55,70.7 ],
		[ 16,44 , 56.7,57.4,72.8 ], [ 17, 45.9, 58.9, 59.5 ,74.6],
		[ 18, 47.8, 61, 61.5 ,76.3], [ 19, 50.8, 64.2, 64.7 ,78.9],
			[ 20, 53.8, 67.5, 67.9 ,81.4], [ 21, 56.9, 70.7, 71.1 ,83.9] ,
			[22,59.9,74,74.3,86.5]]);
	
	
	var options = {
		title : '原酸萃取曲线拟合',
		height:550,
		hAxis : {
			title : '萃取值',
			//minValue : 0,
			//maxValue : 20
		},
		legend:{
			position:'right',
			textStyle:{
				fontSize:16,
				color:'black'
			},
			alignment:'start',
			
		},
		vAxis : {
			title : '时间（分钟）',
		},
		chartArea : {
			width : '50%',
			left:'5%',
			
		},
		trendlines : {
			0 : {
				type : 'linear',
				showR2 : true,
				degree : '2',
				visibleInLegend : true
			},
			1 : {
				type : 'linear',
				showR2 : true,
				degree : '2',
				visibleInLegend : true
			},
			2 : {
				type : 'linear',
				showR2 : true,
				degree : '2',
				visibleInLegend : true
			},
			3:{
				
			},
			4:{
				
			},
			5:{
				
			},
			6:{
				
			},7:{},8:{},9:{},10:{},11:{},12:{},13:{},14:{},15:{},16:{},17:{},18:{},19:{},20:{}

		}
	};
	for(var i = 0;i < 21;i++){
		options.trendlines[i].type = "linear";
		options.trendlines[i].showR2 = true;
		options.trendlines[i].visibleInLegend = true;
		options.trendlines[i].degree = "2";
	}
	
//	currentFile = document.getElementById("inputFile").value;
//	index = currentFile.lastIndexOf("\\");
//	fileName = currentFile.substring(index+1);
	
	EventUtil.addHandler(startBtn,"click",function(){
		
		/*{if(suffix != "csv"){
			alert("请上传.csv格式的文件");
		} }*/
		
		/*highcharts进行曲线拟合  方式选择   ，事件点击*/
		var choosed=false;
		var hgChoosed = false;
		
		
//{		if(zs_linear.checked) {
//			var tempOption1 = optionsHighcharts;
//			hgChoosed = true;
//			choosed = true;
//			optionsHighcharts.title.text = "一次方程拟合";
//			for(var i = 0; i < columnNum-1; i++) {
//				tempOption1.series[i].regressionSettings.type = 'linear';
//				tempOption1.chart.renderTo = 'tablesCur-1';
//			}
//			 var chart1 = new Highcharts.Chart(tempOption1);
//		}
//		if(zs_polynomial.checked) {
//			var tempOption2 = optionsHighcharts;
//			hgChoosed = true;
//			choosed = true;
//			tempOption2.title.text = "二次方程拟合";
//			for(var i = 0; i < columnNum-1; i++) {
//				tempOption2.series[i].regressionSettings.type = 'polynomial';
//				tempOption2.chart.renderTo = 'tablesCur-2';
//			}
//			
//			var  chart2 = new Highcharts.Chart(tempOption2);
//			console.log(tempOption2.series[0].regressionSettings.type);
//			
//		}
//		if(zs_exponential.checked) {
//			hgChoosed = true;
//			choosed = true;
//			optionsHighcharts.title.text = "指数方程拟合";
//			for(var i = 0; i < columnNum-1; i++) {
//				optionsHighcharts.series[i].regressionSettings.type = 'exponential';
//				optionsHighcharts.chart.renderTo = 'tablesCur-3';
//			}
//			console.log(optionsHighcharts.series[0].regressionSettings.type);
//			var  chart3 = new Highcharts.Chart(optionsHighcharts);
//		}
//		if(zs_logarithmic.checked) {
//			hgChoosed = true;
//			choosed = true;
//			optionsHighcharts.title.text = "对数方程拟合";
//			for(var i = 0; i < columnNum-1; i++) {
//				optionsHighcharts.series[i].regressionSettings.type = 'logarithmic';
//				optionsHighcharts.chart.renderTo = 'tablesCur-5';
//			}
//			var chart4 = new Highcharts.Chart(optionsHighcharts);
//		}
//		
//		if(!hgChoosed){
//			alert('请先选择拟合方式');
//		}                                                 }
		
		
		
		/*google charts进行曲线拟合   方式选择，事件点击*/
		
		if(one_equation.checked){
			choosed=true;
			options.title = "一次曲线拟合";
			for(var i = 0;i < 21;i++){
				options.trendlines[i].type = 'linear';
			}
			chartLinear = new google.visualization.ScatterChart(document
					.getElementById('tablesCur-1'));
			chartLinear.draw(data1, options);
		}
		if(two_equation.checked){
			choosed=true;
			options.title = "二次曲线拟合";
			for(var i = 0;i < 21;i++){
				options.trendlines[i].degree = "2";
				options.trendlines[i].type = 'polynomial';
			}
			chartLinear = new google.visualization.ScatterChart(document
					.getElementById('tablesCur-2'));
			chartLinear.draw(data1, options);
		}
		if(three_equation.checked){
			choosed=true;
			options.title="三次曲线拟合";
			for(var i = 0;i < 21;i++) {
				options.trendlines[i].degree = '3';
				options.trendlines[i].type = 'polynomial';
			}
			chartLinear = new google.visualization.ScatterChart(document
					.getElementById('tablesCur-3'));
			chartLinear.draw(data1, options);
		}
		if(exponential_equation.checked){
			choosed=true;
			options.title="指数曲线拟合";
			for(var i = 0;i < 21;i++) {
				options.trendlines[i].type = "exponential";
			}
			chartLinear = new google.visualization.ScatterChart(document.getElementById('tablesCur-4'));
			chartLinear.draw(data1,options);
		} 
		
		if(!choosed){
			alert("请先选择拟合方式");
		}
		
		
	});
	
	//重置
	EventUtil.addHandler(resetBtn,"click",function(){
		$("#tablesCur-1").html("");
		$("#tablesCur-2").html("");
		$("#tablesCur-3").html("");
		$("#tablesCur-4").html("");
		one_equation.checked=false;
		two_equation.checked=false;
		three_equation.checked=false;
		exponential_equation.checked=false;
		currentFile.value="";
		data="";
		suffix="";
	});
	
	/*一次曲线
	EventUtil.addHandler(one_equation,"click",function() {
		options.title = "一次曲线拟合";
		options.chartArea.width = "40%";
		chartLinear = new google.visualization.ScatterChart(document
				.getElementById('tablesCur-1'));
		chartLinear.draw(data, options);
	});
	二次曲线
	EventUtil.addHandler(two_equation,"click",function() {
		options.title = "二次曲线拟合";
		options.chartArea.width = "40%";
		for(var i = 0;i < 21;i++){
			options.trendlines[i].degree = "2";
			options.trendlines[i].type = 'polynomial';
		}
		chartLinear = new google.visualization.ScatterChart(document
				.getElementById('tablesCur-2'));
		chartLinear.draw(data, options);
	});
	三次曲线
	EventUtil.addHandler(three_equation,"click",function() {
		options.title="三次曲线拟合";
		options.chartArea.width = "30%";
		for(var i = 0;i < 21;i++) {
			options.trendlines[i].degree = '3';
			options.trendlines[i].type = 'polynomial';
		}
		chartLinear = new google.visualization.ScatterChart(document
				.getElementById('tablesCur-3'));
		chartLinear.draw(data, options);
	});
	指数曲线
	EventUtil.addHandler(exponential_equation,"click",function() {
		options.title="指数曲线拟合";
		for(var i = 0;i < 21;i++) {
			options.trendlines[i].type = "exponential";
		}
		chartLinear = new google.visualization.ScatterChart(document.getElementById('tablesCur-4'));
		chartLinear.draw(data,options);
	});*/
	
}
