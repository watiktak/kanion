var chart1,chart2;
var  corsing;
var option1 = {
		 chart: {
			renderTo:'tableCM1', 
	        type: 'column',
	        width:'400'
	        },
	        title: {
	            text: '多工段相关性分析'
	        },
	        subtitle: {
	            text: ''
	        },
	        credits:{
	        	text:''
	        },
	        xAxis: {
	            categories: []
	        },
	        yAxis: {
	            
	            title: {
	                text:''
	            }
	        },
	        tooltip: {
	        	valueSuffix: ''
	        },
	        plotOptions: {
	            series: {
	            	colorByPoint:true,
	            	pointWidth: 30,
	                pointPadding: 0,
	                borderWidth: 0,
	                dataLabels: {
	                	enabled:true,
	                	crop:false,
		            	overflow:'none'
	            }
	          }
	        },
//	        colors:[
//	            
//	        ],
	        series: [{
	            name: '多工段相关性分析',
	            data:[]
	        }]
}

var  option2 = {
		chart: {
			renderTo:'tableCM2', 
	        type: 'column',
	        width:'400'
	        },
	        title: {
	            text: '多工段相关性分析'
	        },
	        subtitle: {
	            text: ''
	        },
	        credits:{
	        	text:''
	        },
	        xAxis: {
	            categories: []
	        },
	        yAxis: {
	            
	            title: {
	                text:''
	            }
	        },
	        tooltip: {
	        	valueSuffix: ''
	        },
	        plotOptions: {
	            series: {
	            	colorByPoint:true,
	            	pointWidth: 30,
	                pointPadding: 0,
	                borderWidth: 0,
	                dataLabels: {
	                	enabled:true,
	                	crop:false,
		            	overflow:'none'
	            }
	          }
	        },
	        
	        series: [{
	            name: '多工段相关性分析',
	            data:[]
	        }]
}
$(document).ready(function() {
	var url = $("#basePath").val()+"correlation/corrAnalysis.json";
	$.ajax({
		async:false,
		type:'get',
		//url:'http://localhost:8080/kanion/correlation/corrAnalysis.json',
		url:url,
		dataType:'json',
		success:function(data){
			corsing = data;
			console.log(corsing);
			option1.series[0].data = corsing[1].values;
			console.log(option1.series[0].data);
			option1.xAxis.categories = corsing[1].key;
			option1.title.text = corsing[1].title;
			option1.series[0].name = corsing[1].title+"(目标属性:"+corsing[1].target+")";
			$('#explation2').html(corsing[1].information);
			
			
			option2.series[0].data = corsing[2].values;
			console.log(option2.series[0].data);
			option2.xAxis.categories = corsing[2].key;
			option2.title.text = corsing[2].title;
			option2.series[0].name = corsing[2].title+"(目标属性:"+corsing[2].target+")";
			$('#explation3').html(corsing[2].information);
//			$.each(corsing[1],function(i,attr) {
//				var num = parseFloat(attr.toFixed(2));
//				option.series[0].data.push(num);
//				option.xAxis.categories.push(i);
//			});
		},
		error:function(data){
			alert('json数据获取失败，请联系管理员');
		}
	});
	
	$(document).on("click","#zs_midButton",function() {
		chart1 = new Highcharts.Chart(option1);
		
		$('#explation2').show();
		chart2 = new Highcharts.Chart(option2);
		$('#explation3').show();
	});
	
	
	
})