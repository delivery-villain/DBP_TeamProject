<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>요기요</title>
<link rel="stylesheet" href="CSS/headerStyle.css">
</head>
<body>
	<header class="header">
	<div class="container">
		<h1 class="logo">
			<img class="logo-img" src="logo.png" alt="logo" />
		</h1>
	</div>
	</header>
	<div class = "login_container">
		<center>
			<form method = "post" action = "loginAction.jsp">
				<div class="form-group">
					<input type = "text" class="form-control" placeholder ="아이디" name="userID" maxlength="20">	
				</div>
				<div class="form-group">
					<input type = "text" class="form-control" placeholder ="비밀번호" name="userPassword" maxlength="20">	
				</div>
				<input type = "submit" class = "btn-primary" value ="로그인">
			</form>
			<form action="signin.jsp">
				<input type = "submit" value ="회원가입">
			</form>
		</center>
	</div>
	
	
</body>
</html>