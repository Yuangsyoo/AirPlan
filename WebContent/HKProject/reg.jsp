<%@page import="Util.FormatUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<% String path=request.getContextPath()+"/HKProject/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
			<title>index</title>
			<link href="<%=path %>css/jumbotron.css" rel="stylesheet">
				<link href="<%=path %>css/carousel.css" rel="stylesheet">
					<link rel="stylesheet" type="text/css" href="<%=path %>css/signin.css" />
					<link rel="stylesheet" href="<%=path %>libs/bootstrap3/css/bootstrap.min.css">
						<script src="<%=path %>libs/jquery-3.3.1.min.js"></script>
						<script src="<%=path %>libs/bootstrap3/js/bootstrap.min.js"></script>
						<style type="text/css">
#navtop {
	width: 60%;
}

#order {
	
}
</style>
${requestScope.notice }
</head>

<body>
	<!-- 头部 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<img style="float: left; width: 16%;" src="<%=path %>img/HKlogo.png" /><img
					style="float: right; padding-right: 1.2%; padding-top: 1%;"
					src="<%=path %>img/mfyjp.png" />
			</div>
		</div>
	</div>

	<!-- 导航栏 -->
	<nav class="navbar navbar-default"
		style="margin-bottom: 0;border-radius: 0;">

	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/AirPlan/HKProject/index.jsp">飞哪儿航空官网</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-left">
				<li class="active"><a href="/AirPlan/HKProject/index.jsp">首页<span
						class="sr-only">(current)</span></a></li>
				<li><a href="/AirPlan/HKProject/SearchPlane.jsp">预定行程</a></li>
				<li><a href="#">新闻动态</a></li>
				<li><a href="/AirPlan/HKProject/orderquery.jsp">订单查询</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><c:if var="eu" test="${sessionScope.usermail!=null}" scope="session" ><a href="/AirPlan/HKProject/user.jsp?usermail=${sessionScope.usermail }">用户：${sessionScope.usermail }${sessionScope.userstatus }</a></c:if>
				<c:if test="${!eu }" ><a href="/AirPlan/HKProject/login.jsp">登陆</a></c:if>
				</li>
				<li><a href="#">|</a></li>
				<li>${sessionScope.usermail==null? '<a href="/AirPlan/HKProject/reg.jsp">注册</a>':'<a href="/AirPlan/logout.user">退出</a>' }</li>
			</ul>

		</div>
		<!--/.navbar-collapse -->
	</div>
	</nav>

	<!-- /container -->
	<div class="container">
		<form class="form-signin" action="/AirPlan/reg.user" method="post">
			<h2 class="form-signin-heading">用户注册</h2>
			<label for="text" class="sr-only">真实姓名</label> <input type="text"
				id="text" class="form-control" name="username" placeholder="真实姓名" required>
				<label for="text" class="sr-only">身份证号</label> <input type="text"
				id="text" class="form-control" name="useridno" placeholder="身份证号" required>
				<label for="inputaddr" class="sr-only">联系地址</label>
				<input type="address" list='addrlist' id="inputaddr" class="form-control" name="useraddr" placeholder="联系地址" required>
					<datalist id='addrlist'>
					<%request.setAttribute("addrlist", FormatUtil.addrlist); %>
					<c:forEach var='addr' items="${requestScope.addrlist }" varStatus="s" >
					<option value="${addr.addr }">${addr.addr }</option>
					</c:forEach>
					</datalist>
					<label for="tel" class="sr-only">tel</label> <input type="tel"
					id="tel" class="form-control" name="userphone" placeholder="电话号码" pattern='1[3578][1-9]{9}' required>
						<label for="inputEmail" class="sr-only">邮箱地址</label> <input
						type="email" id="inputEmail" class="form-control"
						name="usermail" placeholder="邮箱地址" pattern='^(.*@qq.com)$' required> <label for="inputPassword"
							class="sr-only">密码</label> <input type="text"
							id="inputPassword" name="userpsw" class="form-control"
							placeholder="密码" required>
			<button style="border: 0; margin-top: 30px;"
				class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
	</div>
	<p style="color:red" >${requestScope.idnoerror }</p>
	<p style="color:red" >${requestScope.pswerror }</p>
	<p style="color:red" >${requestScope.exsistuser }</p>
	</form>
	</div>
	<!-- /container -->

	<!--footer -->
	<div style="background-color: rgb(247, 247, 249);">
		<hr>
			<footer class="container page-footer"> <br>
				<div class="row">
					<div class="col-md-3">
						<h6>
							<strong>关于我们</strong>
						</h6>
						<ul class="list-unstyled">
							<li><a href="/">走进我们</a></li>
							<li><a href="#">新闻资讯</a></li>
							<li><a href="#">法律条款</a></li>
							<li><a href="#">运输条件</a></li>
						</ul>
					</div>
					<div class="col-md-3">
						<h6>
							<strong>互动支持</strong>
						</h6>
						<ul class="list-unstyled">
							<li><a href="#">联系我们</a></li>
							<li><a href="#">常见问题</a></li>
							<li><a href="#">网站导航</a></li>
						</ul>
					</div>
					<div class="col-md-3">
						<h6>
							<strong>友情链接</strong>
						</h6>
						<ul class="list-unstyled">
							<li><a href="#">西藏航空</a></li>
							<li><a href="#">中国东方航空</a></li>
							<li><a href="#">四川航空</a></li>
							<li><a href="#">上海航空</a></li>
						</ul>
					</div>
					<div class="col-md-3">
						<h6>
							<strong>关注我们</strong>
						</h6>
						<ul class="list-unstyled">
							<li><img style="width: 36%;" src="<%=path %>img/815556919.png" /></li>

						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<hr>
					</div>
					<div class="col-md-6 text-xs-left">
						<small><span>© Copyright 2018 飞哪儿航空</span></small>
					</div>

				</div>
			</footer>
			<br>
	</div>

</body>

</html>