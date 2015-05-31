var chart;
var  corsing;
var option = {
		 	chart: {
			renderTo:'tableCS', 
	        type: 'column',
	        width:'750',
	        
	        },
	        title: {
	            text: '单工段相关性分析'
	        },
	        subtitle: {
	            text: ''
	        },
	        credits:{
	        	text:''
	        },
	        xAxis: {
	        	type:'category',
	            categories: [],
	            labels: {
	            	autoRotationLimit: 5//图表显示时按单词换行，所以后台传过来的字符串句子中设置适当的间隔
	            }
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
	                pointPadding: 0.2,
	                borderWidth: 0,
	                dataLabels:{//将值显示在柱状图的上面
	                	enabled:true,
	                	crop:false,
	                	overflow:'none'
	                }
	            }
	        },
	        colors:['#0208fb','#484cfb','#797cf9','#689fbb','#68afbb','#fa6887','#f95a7c','#fa3962','#f7093b'
	                
	                ],
	        series: [{
	            name: '单工段相关性分析',
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
			option.series[0].data = corsing[0].values;
			option.xAxis.categories = corsing[0].key;
			option.title.text = corsing[0].title;
			option.series[0].name = corsing[0].title+"(目标属性:"+corsing[0].target+")";
			$('.chartInfo').html(corsing[0].information);
//			$.each(corsing[0],function(i,attr) {
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
		chart = new Highcharts.Chart(option);
		$('#explation1').show();
	});
})