<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>康缘PKS统计挖掘系统</title>
	<link rel="stylesheet" type="text/css" href="CSS/index.css">
	<link rel="bookmark"  type="image/x-icon"  href="icons/logo.png"/>
	<link rel="shortcut icon" href="icons/logo.png"> 
	<link rel="icon" href="icons/logo.png">
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
	<script type="text/javascript" src="js/jquery-extend.js"></script>
  </head>
  
  <body>
  
 	 <!--顶部导航-->
	 <div id="header">
	 	<div class="w960">
			<h1>
				<a href="index.jsp"></a>			
			</h1>
			<ul class="top-menu">
				<li>
					<a href=""></a>
				</li>
				<li>
					<a href=""></a>
				</li>
	
			</ul>
		</div>
	 </div> 
	 <!--主体-->
	 <div id="main">  
	 	<div id="top-main">
			<div class="w960 pr">    
				<!--主体左栏-->
				<ul class="left-banner">
					<li style="left: 0px; opacity: 1;">
						<a title="点击查看" target="_blank" href=""><img src="images/yinling.png"></a>
					</li>
					<li style="left: -1470px; opacity: 0;">
						<a title="点击查看" href=""><img src="images/analysis.png "></a>
					</li>				
					<li style="left: -1470px; opacity: 0;">
						<a title="点击查看" target="_blank" href=""><img src="images/datamining.png"></a>
					</li>
					<li style="left: -1470px; opacity: 0;">
						<a title="点击查看" target="_blank" href=""><img src="images/feedback.png"></a>
					</li>				
				</ul>
				<ul class="controller">
					<li class="current"></li>
					<li class=""></li>
					<li class=""></li>
					<li class=""></li>
				</ul>		
				
				<!--主体右栏-->
				
				<div id="account-box" class="right-account">
					<div class="login-box">
						<div class="ml26">  
							<h3>登录系统：</h3> 							      
								<p class="msg">&nbsp;</p>
								<form id="login_in_form" action="dataAnalysis.jsp" method="post" >
									<input type="text" name="username" id="username" class="text" placeholder="输入用户名" >
									<input type="password" name="password" id="password" class="text mt6" placeholder="输入密码" >
								</form>
								<div class="mt15">  
									<div class="fr mr26">
										<a>忘记密码？</a>   
									</div>
								</div>
								<div class="login-btn mt35">
									<input type="submit" id="login_in"value="">
								</div>
							</form> 
						  
						</div>      
						<div class="reg-btn-box">
							<a href="" class="reg-btn orange-btn">注册账户</a>
				   		</div>	
					</div>
			   </div>
			   
			</div>
		</div>

		<div id="download" class="clearfix">
			<ul class="download-list clearfix">
				<li class="ico-analysis" title="数据分析"><a data-ca="main-downpc" href="">数据分析</a></li>
				<li class="ico-mining" title="数据挖掘"><a data-ca="main-downandroid" href="">数据挖掘</a></li>
				<li class="ico-feedback last" title="数据预测与反馈"><a data-ca="main-downiphone" href="">模型预测与反馈</a></li>
			</ul>
		</div>
		<input type="hidden" value="<%=basePath%>" id=basePath2>
	</div>

	 
	 <!--footer
	<div id="footer">
		<div class="top-footer">
			<div class="w960">
				<ul class="more">
					<li>
						<dl>
							<dd>关于我们</dd>
							<dd><a href="mailto:ccnt@zju.edu.cn">联系我们</a></dd>
						</dl>						
					</li>
				</ul>
				<div class="social">
					<ul class="mb28">					
						<li class="social-zju">
							<a target="_blank" href="http://www.zju.edu.cn/"></a>
						</li>
						<li class="social-ccnt">
							<a target="_blank" href="http://ccnt.zju.edu.cn/"></a>
						</li>
						<li class="social-kanion last">
							<a target="_blank" href="http://www.kanion.com/"></a>
						</li>
					</ul>				    
            	</div>					
			</div>
		</div>
		<div class="copyright">
			<p>© 2014 CCNT All Rights Reserved  <a href="http://ccnt.zju.edu.cn/" target="_blank">浙江大学计算机科学与技术学院 CCNT实验室</a></p>
		</div>
	</div>
	 -->   
  </body>
  

<script>
//.left-banner直接调用.fadeAnimate，返回它自身
$('#top-main .left-banner').fadeAnimate({});

$("#login_in").click(function(){
	
	var username=$("#username").val();
	var password=$("#password").val();
	if(null==username || null==password){
		alert('用户名或密码不能为空！');
		return;
	}
	if(username!="kanion" || password!= "kanion"){
		alert('用户名和密码不匹配！');
		return;
	}
	$("#login_in_form").submit();
	
});
</script>


</html>
