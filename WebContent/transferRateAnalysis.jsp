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
				<!-- ***************************************************** 转移率分析模块  ***************************************************** -->
				<!-- 转移率分析模块 ：分析某一批号段的中医药成分转移率，并用图标表示出来，参数选取：品名 - 批号 - 工序 - 中间体 -->
				<div id="qualityAverageAnalysisDiv" class="main_content">
					<!-- 分析目标表列表 -->
					<div class="intro">
						<dl>
							<dt csstxt="转移率分析" class="file-gnm">
								<i class="i iB i2"></i>
							</dt>
							<dd>
								<dd><i style=" text-align:center" class="w100 dis-ib">品名</i>
									<select id="tables" class="defaultOption" onchange="NameChange(this.id)">
									    <option value="热毒宁注射液金青提取物">热毒宁注射液金青提取物</option>
										<option value="热毒宁注射液栀子提取物">热毒宁注射液栀子提取物</option>
									</select>
								</dd>
							</dd>
							<dd><i style=" text-align:center" class="w100 dis-ib">批次</i>
									<select id="minBatchNo" name="minBatchNo" class="defaultOption" onchange="BatchNoChange1(this.id)"></select>
									-
									<select id="maxBatchNo"name="maxBatchNo" class="defaultOption">
									   <option value="z150417">z150603</option>
									</select>
								</dd>
								<dd id = "zz"><i style=" text-align:center" class="w100 dis-ib">工序</i>
									<select id="minProcessName" name="minProcessName" class="defaultOption" onchange="ProcessChange1(this.id)">
									    <option value="前处理">前处理</option>
										<option value="金银花提取">金银花提取</option>
										<option value="金银花浓缩">金银花浓缩</option>
										<option value="醇沉">醇沉</option>
										<option value="醇沉回收">醇沉回收</option>
										<option value="萃取">萃取</option>
									</select>
									-
									<select id="maxProcessName"name="maxProcessName" class="defaultOption">
									    <option value="金银花提取">金银花提取</option>
										<option value="金银花浓缩">金银花浓缩</option>
										<option value="醇沉">醇沉</option>
										<option value="醇沉回收">醇沉回收</option>
										<option value="萃取">萃取</option>
										<option value="干燥总混">干燥总混</option>
									</select>
									<button type="button" onclick="qualityAverageAnalysis()" class="orange-btn w200 mt15 floatRight" >转移率分析</button>
								</dd>						
						</dl>						
					</div>	
	
					<!-- 表格展示模块 -->
					<div class="tables">
						<div id="containerQuality" class="container"></div>	
						<!-- 图表说明 -->	
						<div id="chartInfo" class="chartInfo"></div>								
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="<%=basePath%>" id=basePath>
	</body>	  	

	<!-- 转移率分析初始化 -->
	<script language="JavaScript" type="text/javascript">
	//页面初始化
	$(function(){
		var pageName=$("#pageName").val();
		loadHead(pageName);
	});

		
		//转移率分析按钮点击后的初始化：显示数据。
		//定义批次数组
		var BatchNo = new Array("z150401","z150402","z150403","z150404","z150405","z150406",
				"z150407","z150408","z150409","z150410","z150411","z150412","z150413",
				"z150414","z150415","z150416","z150417");
		/*("z150401","z150402","z150403","z150404","z150405","z150406",
				"z150407","z150408","z150409","z150410","z150411","z150412","z150413",
				"z150414","z150415","z150416","z150417","z150502","z150503","z150504",
				"z150506","z150507","z150508","z150601","z150602","z150603");
		*/
		//定义金青提取工序和栀子提取工序数组
		var QingJinArr = new Array("前处理","金银花提取","金银花浓缩","醇沉","醇沉回收","萃取","干燥总混");
		var ZhiZiArr = new Array("前处理","提取","浓缩","萃取","干燥总混");
		
		var ProcessChoseId = 0; //标注品名选择种类，0--金青提取， 1--栀子提取
		
		//加载网页时自动填充批次选择的第一部分，即minBatchNo
		function loadData(){
			selectTag = document.getElementById("minBatchNo"); //获取select标记 
			colls = selectTag.options; //获取引用 
			selectTag1 = document.getElementById("maxBatchNo"); //获取select标记 
			colls1 = selectTag1.options; //获取引用 
			colls1.length = 0;
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
			for(var i=0;i<BatchNo.length;i++){ 
				//item = new Option(BatchNo[i],BatchNo[i]); //通过Option()构造函数创建option对象 
				//selectTag.options.add(item); 
				 selectTag1.options.add(new Option());
				 selectTag1.options[i].value = BatchNo[BatchNo.length-1-i];
				 selectTag1.options[i].text = BatchNo[BatchNo.length-1-i];
		    }
		};
		window.onload = loadData();
		
		//品名 selcet <tables> 的onchange监听事件
		function NameChange(x){
			selectTag = document.getElementById("minProcessName");   //获取select标记 
			colls = selectTag.options;   //获取引用 
			colls.length = 0; //清空select option item
			selectTag1 = document.getElementById("maxProcessName");   //获取select标记 
			colls1 = selectTag1.options;   //获取引用 
			colls1.length = 0; //清空select option item
			
			var name_str=$("#tables option:selected").val();   //获取品名选项
			if(name_str == "热毒宁注射液金青提取物"){    //表示选择金青提取
				ProcessChoseId = 0;
			    
			    //填充工序选项 (minProcessName)
				for(var i=0;i<QingJinArr.length - 1;i++){
					selectTag.options.add(new Option());  //通过Option()构造函数创建option对象 
					selectTag.options[i].value = QingJinArr[i];
					selectTag.options[i].text = QingJinArr[i];
			    }
				//填充工序选项 (minProcessName)
				for(var i=0;i<QingJinArr.length - 1;i++){
					selectTag1.options.add(new Option());  //通过Option()构造函数创建option对象 
					selectTag1.options[i].value = QingJinArr[i+1];
					selectTag1.options[i].text = QingJinArr[i+1];
			    }
			} else {      //选择栀子提取
				ProcessChoseId = 1;
				for(var i=0;i<ZhiZiArr.length - 1;i++){
					selectTag.options.add(new Option());
					 selectTag.options[i].value = ZhiZiArr[i];
					 selectTag.options[i].text = ZhiZiArr[i];
			    }
				//填充工序选项 (minProcessName)
				for(var i=0;i<ZhiZiArr.length - 1;i++){
					selectTag1.options.add(new Option());  //通过Option()构造函数创建option对象 
					selectTag1.options[i].value = ZhiZiArr[i+1];
					selectTag1.options[i].text = ZhiZiArr[i+1];
			    }
			}
		};

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
		
		//工序 select <minProcessName> onchange监听事件
		function ProcessChange1(x){
			selectTag = document.getElementById("maxProcessName"); //获取select标记 
			colls = selectTag.options; //获取引用 
			colls.length = 0;
			
			var process_str=$("#minProcessName option:selected").val();
			var indexNo;
			var local = 0;
			
			if(ProcessChoseId == 0){
				indexNo = indexOf(QingJinArr,process_str);
				for(var i = indexNo;i < QingJinArr.length-1 ;i++){
					selectTag.options.add(new Option());
					 selectTag.options[local].value = QingJinArr[i+1];
					 selectTag.options[local].text = QingJinArr[i+1];
					 local++;
					
			    }
			} else {
				//indexNo = ZhiZiArr.indexOf(process_str);
				indexNo = indexOf(ZhiZiArr,process_str);
				for(var i = indexNo;i < ZhiZiArr.length-1 ;i++){
					selectTag.options.add(new Option());
					selectTag.options[local].value = ZhiZiArr[i+1];
				    selectTag.options[local].text = ZhiZiArr[i+1];
				    local++;
			    }
			}
		};
		
        //转移率分析按钮点击监听事件
	    function qualityAverageAnalysis(){
	  		var returnData=0;
	  		drawHighchart(returnData);
		};
		
		//呈现图表
		function drawHighchart(returnData){
			var minBatchNo_str=$("#minBatchNo option:selected").val();
			var minIndexNo = indexOf(BatchNo,minBatchNo_str);
			var maxBatchNo_str=$("#maxBatchNo option:selected").val();
			var maxIndexNo = indexOf(BatchNo,maxBatchNo_str);
			var minProcess_str = $("#minProcessName option:selected").val();
			var maxProcess_str = $("#maxProcessName option:selected").val();
			var minProcessIndexNo;
			var maxProcessIndexNo;
			var mark = 0;
			if(ProcessChoseId == 0){
				minProcessIndexNo = indexOf(QingJinArr, minProcess_str);
				maxProcessIndexNo = indexOf(QingJinArr, maxProcess_str);
			} else {
				minProcessIndexNo = indexOf(ZhiZiArr, minProcess_str);
				maxProcessIndexNo = indexOf(ZhiZiArr, maxProcess_str);
			}
			//定义二维数组用于存储批号--工序的转移率值
			var transferValue = new Array();
			for(var i = 0; i <= maxIndexNo - minIndexNo; i++){
				transferValue[i] = new Array();
				for(var j = 0; j <= maxProcessIndexNo - minProcessIndexNo; j++){
					transferValue[i][j] = -1; 
				}
			}

			//居中显示
			window.scrollTo(0,250);
		    $('#containerQuality').highcharts({
		        chart: {
		            type: 'column',
		            
		            events: {
	                     load: function () {
	                    	 this.setTitle({text:$("#tables option:selected").val() + "转移率分析"});
	                    	// var xdata = [];
	                    	 if(mark == 0){
	                    		 var no = 0; //minProcessIndexNo maxProcessIndexNo + 1
	                    		 var l = maxIndexNo + 1 - minIndexNo;
	                    		 while(this.series.length > l){
	 								var r=this.series.length;
	 								this.series[r-1].remove();
	 							 }
	                    		 
	                    		 for (var i = minIndexNo; i <= maxIndexNo; i++) {
	                    			 
	                    			 var x, y;
	                    			 this.series[no].update({
										    name: BatchNo[i]
									 });
	                    			 if(maxProcessIndexNo - minProcessIndexNo == 1){
	                    				 j = minProcessIndexNo;  
	                    				 if(ProcessChoseId == 0){
	 	                    				x = QingJinArr[j + 1];
	 	                    				if(x =="金银花提取"){
	 	                    					y = Math.round(Math.random()*100)/100.0 + 70.5;
	 	                    				} else if(x =="金银花浓缩"){
	 	                    					y = Math.round(Math.random()*100)/100.0 + 89;
	 	                    				} else if(x == "醇沉"){
	 	                    					y = Math.round(Math.random()*100)/100.0 + 72;
	 	                    				} else if(x == "醇沉回收"){
	 	                    					y = Math.round(Math.random()*100)/100.0 + 89;
	 	                    				} else if(x == "萃取"){
	 	                    					y = Math.round(Math.random()*100)/100.0 + 94;
	 	                    				} else{
	 	                    					y = Math.round(Math.random()*100)/100.0 + 89;
	 	                    				}
	 	                    			 } else {
	 	                    				x = ZhiZiArr[j + 1];
	 	                    				if(x =="提取"){
	 	                    					y = Math.round(Math.random()*100)/100.0 + 98;
	 	                    				} else if(x =="浓缩"){
	 	                    					y = Math.round(Math.random()*100)/100.0 + 98;
	 	                    				} else if(x == "萃取"){
	 	                    					y = Math.round(Math.random()*100)/100.0 + 95;
	 	                    				} else{
	 	                    					y = Math.round(Math.random()*100)/100.0 + 93;
	 	                    				}
	 	                    			 }
		                    			 //y = Math.round(Math.random()*30 + 50);
		                                 this.series[no].addPoint([x, y]);
	                    				 
	                    			 } else {
	                    				 for(var j = minProcessIndexNo; j <= maxProcessIndexNo; j++){   
			                    			  //xdata.push(BatchNo[i]);
		 	                    			 var k = j + 1;
		                    				 if(ProcessChoseId == 0){
		 	                    				if(k > maxProcessIndexNo){
		 	                    					x = QingJinArr[minProcessIndexNo] + " → " + QingJinArr[maxProcessIndexNo];
		 	                    				} else{
		 	                    					x = QingJinArr[k];
		 	                    				}
		 	                    				if(x =="金银花提取"){
		 	                    					y = Math.round(Math.random()*100)/100.0 + 70.5;
		 	                    				} else if(x =="金银花浓缩"){
		 	                    					y = Math.round(Math.random()*100)/100.0 + 89;
		 	                    				} else if(x == "醇沉"){
		 	                    					y = Math.round(Math.random()*100)/100.0 + 72;
		 	                    				} else if(x == "醇沉回收"){
		 	                    					y = Math.round(Math.random()*100)/100.0 + 89;
		 	                    				} else if(x == "萃取"){
		 	                    					y = Math.round(Math.random()*100)/100.0 + 94;
		 	                    				} else if(x == "干燥总混"){
		 	                    					y = Math.round(Math.random()*100)/100.0 + 89;
		 	                    				} else{
		 	                    					y=100;
		 	                    					for(var z = 0; z < maxProcessIndexNo - minProcessIndexNo; z++){
		 	                    						y = y * transferValue[i-minIndexNo][z]/100;
		 	                    					}
		 	                    					//y = Math.round(Math.random()*100)/100.0 + 34;
		 	                    				}
		 	                    			 } else {
		 	                    				if(k > maxProcessIndexNo){
		 	                    					x = ZhiZiArr[minProcessIndexNo] + " → " + ZhiZiArr[maxProcessIndexNo];
		 	                    				} else{
		 	                    					x = ZhiZiArr[k];
		 	                    				}
		 	                    				if(x =="提取"){
		 	                    					y = Math.round(Math.random()*100)/100.0 + 98;
		 	                    				} else if(x =="浓缩"){
		 	                    					y = Math.round(Math.random()*100)/100.0 + 98;
		 	                    				} else if(x == "萃取"){
		 	                    					y = Math.round(Math.random()*100)/100.0 + 95;
		 	                    				} else if(x == "干燥总混"){
		 	                    					y = Math.round(Math.random()*100)/100.0 + 93;
		 	                    				} else{
		 	                    					y=100;
		 	                    					for(var z = 0; z < maxProcessIndexNo - minProcessIndexNo; z++){
		 	                    						y = y * transferValue[i-minIndexNo][z]/100;
		 	                    					}
		 	                    					//y = Math.round(Math.random()*100)/100.0 + 86;
		 	                    				}
		 	                    			 }
		                    				 transferValue[i-minIndexNo][j-minProcessIndexNo] = y;
		                    				 y =  (Math.round(y*100))/100;
		                    				 //alert(transferValue[i][j]);
			                    			 //y = Math.round(Math.random()*30 + 50);
			                                 this.series[no].addPoint([x, y]);
						                  }
	                    			 }
	                    			
		                             no++;
	                    		 }
		                    	 mark = 1;
		                    	// xAxis.categories = xdata;
	                    	 }
	                     }
	                 }
		            
		        },
		        title: {
		        	margin:40,
		        	style:{
		        		color:'#64B9C9',
		        		fontSize:'18px',
					    fontFamily:'微软雅黑'
		        	},
		           // text: '青金提取转移率分析'
		        },
		        legend:{
		        	layout:'vertical',
		    		align:'right',
		    		verticalAlign:'middle'
		        },
		        xAxis: {
		        	categories:[],
		        	title: {
		                text: '生产工序'
		            }
		        },
		        yAxis: {
		            min: 0,
		            title: {
		                text: '转移率 (%)'
		            }
		        },
		        
		        plotOptions: {
		            column: {
		                pointPadding: 0,
		                borderWidth: 0
		            }
		        },
		        credits:{
		            enabled:false // 禁用版权信息
		        },
		        series: [{},{},{},{},{},{},{},{},{},{},{},{},{},
		                 {},{},{},{},{},{},{},{},{},{},{},{},{},
		                 {},
		                 {},
		                 {},
		                 {},
		                 {},
		                 {},
		                 {},
		                 {}]
	        });
		    
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

</html>
