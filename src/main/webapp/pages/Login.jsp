﻿<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中港星BI系统 - 用户登录</title>
<meta name="keywords" content="中港星BI">
<meta name="description" content="“中港星BI”商业智能系统是由中港星集团自主研发的企业数据分析系统。 包含数据建模、数据报表、多维分析、仪表盘、移动BI等功能模块，构建商业智能平台，实现数据的快速分析及可视化。 ">
<link rel="shortcut icon" type="image/x-icon" href="resource/img/rs_favicon.ico">
<link href="ext-res/css/bootstrap.min.css" rel="stylesheet">
<link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="resource/css/animate.css" rel="stylesheet">
<link href="resource/css/style.css" rel="stylesheet">
<link href="resource/css/login.css" rel="stylesheet">
<link href="resource/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="resource/sweetalert/sweetalert.css" rel="stylesheet">
<script type="text/javascript" src="ext-res/js/jquery.min.js"></script>
<script type="text/javascript" src="ext-res/js/ext-base.js"></script>
<script type="text/javascript" src="resource/validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="resource/validate/messages_zh.min.js"></script>
<script type="text/javascript" src="ext-res/js/bootstrap.min.js?v=3.3.6"></script>
<script type="text/javascript" src="resource/sweetalert/sweetalert.min.js"></script>


<script language="javascript">
if(window.top != window.self){
	window.top.location.href = 'Login.action'
}
$(function(){
	$("#loginForm").validate({
		submitHandler:function(form){
				__showLoading();
			   $.ajax({
				    type:"POST",
					data:$(form).serialize(),
					url:'dologin.action',
					dataType:'json',
					success:function(ret){
						__hideLoading();
						if(ret.result == 0){
							msginfo(ret.msg, "error");
						}else{
							location.href = 'frame/Frame.action'
						}
					},
					error:function(){
						__hideLoading();
						msginfo("系统错误，请稍后再试。", "error");
					}
			   });
			}    
	});
});
</script>
</head>

<body class="gray-bg">
	  <div class="row border-bottom" role="navigation" style="margin-bottom: 0"> 
		<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
		<div class="col-sm-12" style="width: 12%;margin-left: 1%;">
			<img src="resource/img/frame3/log.png" class="img-responsive">
		</div>
		</nav>
	  </div>
	  <div class="middle-box signinpanel text-center loginscreen" style="max-width:600px;">
        <div>
             <form method="post" id="loginForm">
             		<h2 style="padding:10px 10px 20px 10px;">用户登录</h2>
					<input type="hidden" name="backurl" value="${backurl}">
					<div class="row">
						<div class="col-sm-6"><div style="padding:20px 10px 20px 0px;"><img src="resource/img/xsqq.png"></div></div>
						<div class="col-sm-6">
						<div class="form-group">
							<input type="text" name="userName" value="${userName}" class="form-control uname" placeholder="您的账号" required="true" aria-required="true"/>
						</div>
						<div class="form-group">
							<input type="password" name="password" value="${password}" class="form-control pword m-b" placeholder="您的密码" required="true" aria-required="true"/>
						</div>
							<button class="btn btn-primary block full-width m-b" type="submit">登录</button>
						账号/密码： admin/123456
						</div>
					</div>
                </form>
        </div>
    </div>
	<div style="margin:60px 30px 0px 30px; padding:10px;" align="center"> <a href='http://d.alphaqr.com/yqfapp' target="_blank">中港星APP</a> - <a href='http://120.79.155.246/' target="_blank">中港星CRM</a>  - <a href='http://www.zgxmall.com/' target="_blank">中港星商城</a> - <a href='http://vip.zgxmall.com/' target="_blank">中港星云企服</a> - <a href='http://col.zgxmall.com/' target="_blank">中港星商学院</a> - <a href='http://www.ruisibi.cn/book.htm' target="_blank">使用手册</a> </div>
		<div style="padding:10px;" >
		<div align="center">
			粤ICP备17143321号 Copyright © 2020 深圳市中港星科技企业服务中心有限公司 All Rights Reserved
            </div>
		</div>
</body>
</html>
