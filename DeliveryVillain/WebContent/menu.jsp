<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%  %>
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
	<div class = "order_container">
		<center>
			<form method = "post" action = "menuAction.jsp">
				<div class="form-group">
					<input type = "text" class="form-control" placeholder ="가게 번호" name="storeNum" maxlength="20">
							
				</div>
				<input type = "text" class="form-control" placeholder ="메뉴이름" name="menuName" maxlength="20">
				<div class="form-group">
					<input type = "text" class="form-control" placeholder ="가격" name="price" maxlength="20">	
				</div>
				<input type = "submit" class = "btn-primary" value ="메뉴등록">
			</form>
		
			
		</center>
	</div>
		
</body>
</html>