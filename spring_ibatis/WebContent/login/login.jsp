<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<title>Login Manager</title>
	<link href="<%=basePath%>/resource/css/style.css" rel='stylesheet' type='text/css' />
  </head>
  <body>
	<div class="main">
		<div class="login-form">
			<h1>User Login</h1>
			<div class="head">
				<img src="<%=basePath%>/resource/images/user.png" />
			</div>
			<form action="<%=basePath%>/login/login">
				<input type="text"  name="managerName" placeholder="UserName" >
				<input type="password" name="managerPassword" placeholder="PassWord" >
				<input type="text" name="validateCode" placeholder="ValidateCode" >
				<a href="#"><img id="validateCodeImg" src="<%=basePath%>/login/validateCode" /></a></br></br>
				<div class="submit">
					<input type="submit" value="LOGIN">
				</div>
				<p>
					<a href="<%=basePath%>/login/forgot.jsp">Forgot Password ?</a>
				</p>
			</form>
		</div>
	</div>
</body>
</html>
