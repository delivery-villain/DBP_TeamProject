<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����</title>
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
	
	<form action = "signinAction.jsp">
		<div class="form-group"> 
			<input type = "text" class="form-control" placeholder ="ID" name="userID" maxlength="20">
		</div>
			<input type = "text" class="form-control" placeholder ="password" name="userPassword" maxlength="20">	
		<div class="form-group"> 
			<input type = "text" class="form-control" placeholder ="password Ȯ��" name="userPassword" maxlength="20">	
		</div>
		<div class="form-group"> 
			<input type = "text" class="form-control" placeholder ="�̸�" name="userName" maxlength="20">
		</div>
		<div class="form-group"> 
			<input type = "text" class="form-control" placeholder ="��ȭ��ȣ" name="userPhoneNumber" maxlength="20">	
		</div>
		
		<label>���Ի���� <input type = "checkbox" name = "userType" checked = "checked"></label>
		
		<div class="form-group"> 
			<input type = "submit" value = "ȸ������" >
		</div>
		
	</form>
	

</body>
</html>