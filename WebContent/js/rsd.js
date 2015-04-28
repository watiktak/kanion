var chart1;//全局变量
$(document).ready(function(){
	chart1=new Highcharts.Chart({
		chart:{
			renderTo:'tablesRsd',
			type:'line'
		},
		title:{
			text:'中间体趋势图'
		},
		credits:{
				href:'www.xxx.org',
				position:{
					x:-30,
					y:-30
				},
				style:{
					color:'#909090',
					fontWeight:'normal'
				},
				enable:true,
				text:'Source:www.kanion.com'
			}
		,
		xAxis:{
			// categories:['Apples','Bananas','Oranges']
		},
		yAxis:{
			title:{
				text:'浸膏量'
			}
		},
		series:[{
			name:'栀子',
			data:[435,409,413,372,400,381,458,376,343,379,350,369,443,361,392,363,387,386,431,406]
		}]
	});
});