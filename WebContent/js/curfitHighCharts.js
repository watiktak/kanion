/**
 * @author zhsi
 */
/*---------------------------------------highCharts 曲线模拟图--------------------------------------------------------*/
var defaultChart = {
		chartContent : null,
		highChart : null,
		defaults : {
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
//				colors : [ '#000000',// 黑
//				'#ff0000',// 红
//				'#00ff00',// 绿
//				'#0000ff',// 蓝
//				'#ffff00',// 黄
//				'#ff00ff',// 紫
//				'#ffffff',// 紫
//				],
//				colors:[
//				        'red',
//				        'green',
//				        'blue',
//				        'magenta',
//				        'yellow',
//				        'chocolate',
//				        'blueviolet',
//				        'lime',
//				        '#0000AA',
//				        'azure',
//				        'deeppink',
//				        'coral',
//				        'orange',
//				        'bronze'
//				],
				xAxis: {
					type:'linear',
					startOnTick:true,
					min:0
					
//					plotLines:[{
//						value:0,
//						width:2,
//						color:'#808080'
//					}]
				},
				yAxis: {
					type: 'linear',
					startOnTick:true,
					min:0,
					tickInterval:10
				},
//				legend : {
//					layout : 'vertical',
//					align : 'left',
//					verticalAlign : 'top',
//					x : 50,
//					y : 0,
//					floating : true,
//					backgroundColor : '#fff',
//					borderWidth : 0
//				},
				plotOptions : {
					
					scatter : {
						marker : {
							//fillColor: '#ffffff',
							lineWidth: 1,
							lineColor: null,
							radius : 4,
							states : {
//								hover : {
//									enabled : true,
//								}
							}
						},
//						states : {
//							hover : {
//								marker : {
//									enabled : false
//								}
//							}
//						},
						tooltip : {
							
							headerFormat : '<b>{series.name}</b><br>',
							pointFormat : '{point.x},{point.y}'
//							formatter: function () {
//				                var symbol;
//				            
//				                switch ( this.point.graphic.symbolName ) {
//				                    case 'circle':
//				                        symbol = '●';
//				                        break;
//				                    case 'diamond':
//				                        symbol = '♦';
//				                        break;
//				                    case 'square':
//				                        symbol = '■';
//				                        break;
//				                    case 'triangle':
//				                        symbol = '▲';
//				                        break;
//				                    case 'triangle-down':
//				                        symbol = '▼';
//				                        break;
//				                }
//				                
//				                return this.x + '<br/>' + symbol + this.series.name + ': ' + this.y;
//				            }
							
						}
					}
				},
				series:[]
		},
		//merge the defaults with the object options
		init : function(options) {
			this.highChart = $.extend({},this.defaults,options);
			this.highChart.chart.renderTo = this.chartContent;
		},
		create : function() {
			new Highcharts.Chart(this.highChart);
		}
};

 var chart,
 	 data,
 	 optionsHighcharts = {
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
//			colors:[
//			        'red',
//			        'green',
//			        'blue',
//			        'magenta',
//			        'yellow',
//			        'chocolate',
//			        'blueviolet',
//			        'lime',
//			        '#0000AA',
//			        'azure',
//			        'deeppink',
//			        'coral',
//			        'orange',
//			        'bronze'
//			],
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
						//fillColor: '#ffffff',
						lineWidth: 1,
						lineColor: null,
						radius : 4,
						states : {
//							hover : {
//								enabled : true,
//							}
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
//						formatter: function () {
//			                var symbol;
//			            
//			                switch ( this.point.graphic.symbolName ) {
//			                    case 'circle':
//			                        symbol = '●';
//			                        break;
//			                    case 'diamond':
//			                        symbol = '♦';
//			                        break;
//			                    case 'square':
//			                        symbol = '■';
//			                        break;
//			                    case 'triangle':
//			                        symbol = '▲';
//			                        break;
//			                    case 'triangle-down':
//			                        symbol = '▼';
//			                        break;
//			                }
//			                
//			                return this.x + '<br/>' + symbol + this.series.name + ': ' + this.y;
//			            }
						
					}
				}
			},
			series:[]
 },


 	suffix,
 	zs_linear ,
	zs_polynomial ,
	zs_exponential ,
	zs_logarithmic ,


	one_equation ,
	two_equation ,
	three_equation ,
	exponential_equation ,


	startBtn ,
	resetBtn ,
	currentFile ,
	lineColor ,
	maxYvalue ,//y值的最大值，根据这个值设置y轴刻度范围
	maxXvalue ,//x值的最大值，根据这个值设置x轴刻度范围
	chartLinear,
	columnNum,
	rowNum;
 	
 	
function drawChart() {
	suffix = '';
	 zs_linear = document.getElementById("zs_linear");
	 zs_polynomial = document.getElementById("zs_polynomial");
	 zs_exponential = document.getElementById("zs_exponential");
	 zs_logarithmic = document.getElementById("zs_logarithmic");


	 one_equation = document.getElementById("zs_onefit");
	 two_equation = document.getElementById("zs_twofit");
	 three_equation = document.getElementById("zs_threefit");
	 exponential_equation = document.getElementById("zs_exponentialfit");


	 startBtn = document.getElementById("start");
	 resetBtn = document.getElementById("reset");
	 currentFile = document.getElementById("inputFile");
	 lineColor = ['red','green','blue','magenta','yellow','chocolate','blueviolet','lime','#0000AA','azure','deeppink','coral','orange','bronze'];
	 maxYvalue = 0.0;//y值的最大值，根据这个值设置y轴刻度范围
	 maxXvalue = 0.0;//x值的最大值，根据这个值设置x轴刻度范围
	 chartLinear;
	 columnNum;
	 rowNum;
	//上传文件,获得数据---------------------------------------------
	$('#uploadForm').submit(function(){
		var url = $("#basePath").val()+"curvefit/addAction.json";
		$(this).ajaxSubmit({
			type:'post',
			//url:'http://localhost:8080/kanion/curvefit/addAction.json',
			url:url,
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
						
	/*----------------------------使用highcharts进行曲线拟合---------------------------------------------*/		
						var lines = csvString.split('\n');
						var series = [];
						var firstLine = lines[0].split(',');
						columnNum = firstLine.length;//列数，即series中有columnNum-1组数据
						rowNum = lines.length;
						//csv文件的第一行
						
						for(i = 0;i < columnNum-1; i++ ) {
							series.push({
								marker:{
									symbol:'circle'
								},
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
						for(i = 0;i < columnNum-1 ;i++) {
							optionsHighcharts.series.push(series[i]);
							defaultChart.defaults.series.push(series[i]);
						}
						
						optionsHighcharts.xAxis.max = maxXvalue + 1;
						optionsHighcharts.yAxis.max = maxYvalue + 1;
	
						defaultChart.defaults.xAxis.max = maxXvalue + 1;
						defaultChart.defaults.yAxis.max = maxYvalue + 1;
						
						
					});
				}
			},
			error:function(){
				console.log("数据格式出错");
			}
		});
		
		return false;//阻止表单默认提交
	});
	
}
	


	
//var data1 = google.visualization.arrayToDataTable([
//			[ "次数", "新绿原酸", '绿原酸', '隐绿原酸','咖啡酸' ], [ 1, 3.7, 5.1, 5.6,8.1 ],
//			[ 2, 7.2, 10, 9.2 ,15.5], [ 3, 10.6, 14.6, 14.0 ,22.3],
//			[ 4, 13.9, 19.0, 17.5 ,28.7], [ 5, 16.9, 23.1, 20.7 ,34.5],
//			[ 6, 19.8, 26.9, 25.5 ,39.5], [ 7, 22.6, 30.5, 31.2 ,44.3],
//			[ 8, 25.3, 34.1, 36.8 ,48.8], [ 9, 28, 37.4, 37.2 ,52.9],
//			[ 10, 30.6, 40.8, 39.5 ,56.8], [ 11, 33.1, 43.9, 42.7,60.3 ],
//			[ 12, 35.4, 46.7, 49.5 ,63.3], [ 13, 37.6,49.3, 50.1 ,65.9],
//			[ 14, 39.8, 51.9, 52.6 ,68.4], [ 15, 41.9, 54.4, 55,70.7 ],
//		[ 16,44 , 56.7,57.4,72.8 ], [ 17, 45.9, 58.9, 59.5 ,74.6],
//		[ 18, 47.8, 61, 61.5 ,76.3], [ 19, 50.8, 64.2, 64.7 ,78.9],
//			[ 20, 53.8, 67.5, 67.9 ,81.4], [ 21, 56.9, 70.7, 71.1 ,83.9] ,
//			[22,59.9,74,74.3,86.5]]);
//	
	
	
	
//	currentFile = document.getElementById("inputFile").value;
//	index = currentFile.lastIndexOf("\\");
//	fileName = currentFile.substring(index+1);

	$(document).ready(function() {
		drawChart();
		EventUtil.addHandler(startBtn,"click",function(){
			
			if(suffix != "csv"){
				alert("请上传.csv格式的文件");
			} 
			
			/*highcharts进行曲线拟合  方式选择   ，事件点击*/
			
			var hgChoosed = false;
			
			
			if(zs_linear.checked) {
				
				
				hgChoosed = true;
				
				/*------------------直接将optionsHighcharts赋值给一个变量---------------------
				var tempOption1 = optionsHighcharts;
				tempOption1.title.text = "一次方程拟合";
				for(var i = 0; i < columnNum-1; i++) {
					tempOption1.series[i].regressionSettings.type = 'linear';
					tempOption1.chart.renderTo = 'tablesCur-1';
				}
				 var chart1 = new Highcharts.Chart(tempOption1);*/
				
				var linearChart = {
						chartContent : 'tablesCur-1',
						options:{
							title:{
								text:'一次方程拟合'
							}
						}
				}
				
				for(var i = 0; i < columnNum-1; i++) {
					defaultChart.defaults.series[i].regressionSettings.type = 'linear';
				}
				linearChart = $.extend(true,{},defaultChart,linearChart);
				linearChart.init(linearChart.options);
				linearChart.create();
				 
			}
			if(zs_polynomial.checked) {
				hgChoosed = true;
				
				var polynomialChart = {
						chartContent : 'tablesCur-2',
						options:{
							title:{
								text:'二次方程拟合'
							}
						}
				}
				
				for(var i = 0; i < columnNum-1; i++) {
					defaultChart.defaults.series[i].regressionSettings.type = 'polynomial';
				}
				polynomialChart = $.extend(true,{},defaultChart,polynomialChart);
				polynomialChart.init(polynomialChart.options);
				polynomialChart.create();
			}
			if(zs_exponential.checked) {
				hgChoosed = true;
				var exponentialChart = {
						chartContent : 'tablesCur-3',
						options:{
							title:{
								text:'指数方程拟合'
							}
						}
				}
				
				for(var i = 0; i < columnNum-1; i++) {
					defaultChart.defaults.series[i].regressionSettings.type = 'exponential';
				}
				exponentialChart = $.extend(true,{},defaultChart,exponentialChart);
				exponentialChart.init(exponentialChart.options);
				exponentialChart.create();
				
			}
			if(zs_logarithmic.checked) {
				hgChoosed = true;
				var logarithmicChart = {
						chartContent : 'tablesCur-4',
						options:{
							title:{
								text:'对数方程拟合'
							}
						}
				}
				
				for(var i = 0; i < columnNum-1; i++) {
					defaultChart.defaults.series[i].regressionSettings.type = 'logarithmic';
				}
				logarithmicChart = $.extend(true,{},defaultChart,logarithmicChart);
				logarithmicChart.init(logarithmicChart.options);
				logarithmicChart.create();
			}
			
			if(!hgChoosed){
				alert('请先选择拟合方式');
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
		
	});
	
	
	
	
	
	

