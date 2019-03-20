<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>管理员登录</title>

<link rel="stylesheet" type="text/css" href="../css/styles.css">

</head>
<body>

<div class="wrapper">

	<div class="container">
		<h1>MOOC 后台管理</h1>
		<form class="form" action="/course/managerlogin.action" method="post">
			<input name="UserName" type="text" placeholder="Username">
			<input name="UserPwd" type="password" placeholder="Password"><br>
			<button type="submit" id="login-button" ><strong>登录</strong></button>
			
		</form>
	</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		
	</ul>
	
</div>


</body>
</html>