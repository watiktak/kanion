<%@   page   language="java"   contentType="text/html;   charset=utf-8"%>
<%
String path2 = request.getContextPath();
String basePath2 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path2+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <!--顶部导航-->
	<div class="Tray">
		<div class="tray">
			<a href="<%=basePath2%>index.jsp" title="康源PKS统计挖掘系统" class="logo">康源PKS统计挖掘系统</a>
			<ul class="nav">
				<li>
					<a href="<%=basePath2%>dataAnalysis.jsp">统计分析</a>				</li>
				<li>
					<a>数据挖掘</a>				</li>
				<li>
					<a>报表导出</a>				</li>
			</ul>
			<ul class="nav nav2">
				<li>欢迎您！username</li>
				<li>username@zju.edu.cn</li>   		
			</ul>			
		</div>		
	</div>
	<!--工具栏-->
	<div class="Toolbar Toolbar2">
		<div class="toolbar">
			<ul class="tools">
				<li id="trendAnalysis" class="tool">
					<button id="analysisBtn" title="趋势显示">
						<i class="i i1"></i>
					</button>	
				</li>	
				
				<li id="yieldAnalysis" class="tool">
					<button  id="analysisBtn" title="收率分析">
						<i class="i i22"></i>
					</button>	
				</li>	
						
				<li id="transferRateAnalysis" class="tool">
					<button  id="analysisBtn" title="转移率分析">
						<i class="i i3"></i>
					</button>	
				</li>	
				
				<li id="normalDistribution" class="tool">
					<button  id="analysisBtn" title="正太分布">
						<i class="i i4"></i>
					</button>	
				</li>	
				
				<li id="rsdAnalysis" class="tool">
					<button  id="analysisBtn" title="RSD计算">
						<i class="i i5"></i>
					</button>	
				</li>
				
				<li class="tool">
					<button  id="analysisBtn" title="趋势分析">
						<i class="i i6"></i>
					</button>	
				</li>
				
				<li id="curvefitAnalysis" class="tool">
					<button  id="analysisBtn" title="方程拟合">
						<i class="i i7"></i>
					</button>	
				</li>
				
				<li class="tool">
					<button  id="analysisBtn" title="相关性分析(单)">
						<i class="i i8"></i>
					</button>	
				</li>
				
				<li class="tool">
					<button  id="analysisBtn" title="相关性分析(多)">
						<i class="i i9"></i>
					</button>	
				</li>
				
				<li class="tool">
					<button  id="analysisBtn" title="预测分析">
						<i class="i i10"></i>
					</button>	
				</li>
					
			</ul>
						
		</div>
		<input type="hidden" value="<%=basePath2%>" id=basePath2>
	</div> 
	
	
<script language="JavaScript" type="text/javascript">
$(".tool").click(function(){
	var basePath=$("#basePath2").val();
	var id = $(this).attr("id");
	if(id=="trendAnalysis"){
		location.href = basePath + id + "/init.htm";
	}else{
		location.href = basePath + id + ".jsp";
	}
});	
</script>