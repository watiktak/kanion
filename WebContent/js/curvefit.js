

	var chart;
	$(document).ready(function(){
		chart=new Highcharts.Chart({
			chart:{
				renderTo:'tablesCur',
				type:'spline'
			},
			title:{
				text:"萃取率拟合图"
			}
			,
			credits:{
				href:'www.xxx.org',
				position:{
					x:-30,
					y:-30
				},
				style:{
					color:'red',
					fontWeight:'bold'
				},
				enable:true,
				text:'Source:www.kanion.com'
			},
			colors:[
				'#000000',//黑
				'#ff0000',//红
				'#00ff00',//绿
				'#0000ff',//蓝
				'#ffff00',//黄
				'#ff00ff',//紫
				'#ffffff',//紫
			],
			xAxis:{
				// categories:['Jan','Feb', 'Mar', 'Apr', 'May', 'Jun',  
    //                         'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
			},
			series:[{
				name:'新绿原酸',
				data:[3.7,13.9,16.9,22.6,25.3,30.6,33.1,35.4,37.6,39.8,
			41.9,44.0,45.9,50.8,53.8,56.9,59.9]  
			},
			{ name: '绿原酸',  
              data: [5.1,19.0,23.1,26.9,34.1,37.4,40.8,43.9,49.3,54.4,
			56.7,58.9,61.0,67.5,70.7,74.0]},
              {
              	name: '隐绿原酸',  
                data: [5.3,19.5,23.7,27.5,34.8,38.2,41.5,44.7,47.5,
			50.1,52.6,57.4,59.5,64.7,67.9,71.1,74.2]  
              },
              {
              	name: '咖啡酸',  
                        data: [8.1,15.5,22.3,28.7,34.5,39.5,44.3,48.8,52.9,56.8,60.3,63.3,
			65.9,70.7,72.8,76.3,81.4,83.9,86.5]  
              }]
		});
	});
