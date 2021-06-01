<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
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
			<form method = "post" action = "loginAction.jsp">
				<div class="form-group">
				주소 <br>
					<input type = "text" class="form-control" placeholder ="(필수)주소를 입력하세요" name="address" maxlength="255">
							
				</div>
				
				<input type = "text" class="form-control" placeholder ="(필수)상세주소를 입력하세요" name="address2" maxlength="255">
				<div class="form-group">
				주문시 요청사항 <br>
					<input type = "text" class="form-control" placeholder ="요청사항을 남겨주세요" name="request" maxlength="255">	
				</div>
				<input type = "submit" class = "btn-primary" value ="결제하기">
			</form>
			
		</center>
	</div>
		
</body>
</html>