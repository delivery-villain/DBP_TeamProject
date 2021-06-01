<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, java.util.*, DeliveryVillain.*, java.io.PrintWriter"%>
    
    <%
    request.setCharacterEncoding("UTF-8");
   
    	Object obj = session.getAttribute("store2");
    	Store store = (Store)obj;
    	
    	Vector<Menu> menus = new Vector<Menu>();
    	
    	menus = MenuDAO.getAllMenus(store.getsno());
    	
    	
    %>
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
			<img class="logo-img" src="logo.png" alt="logo"  />
		</h1>
	</div>
	</header>

<center>

<table border = "1">
<th>메뉴</th>
<th>가격</th>
<th>가격 수정</th>
<% 
	int length = menus.size();
	
	for (int i = 0; i < length; i++) {
		Menu menu = menus.get(i);
		out.print("<tr>");
		out.print("<td> " + menu.getName()  + "</td>");
		out.print("<td> " + Integer.toString(menu.getPrice()) + "</td>");
		out.print("<td>");
		out.print("<form method = 'post' action = 'loginAction.jsp'>");
		out.print("<input type = 'text' class='form-control' placeholder ='' name='storeNum' maxlength='8'>");
		out.print("</form>");
		out.print("</td>");
		out.print("</tr>");
	}
	
	%>
</table>
	<button type="button" class="btn btn-login ng-binding" onclick = "location.href = 'menu.jsp'">메뉴등록</button>
	<button type="button" class="btn btn-login ng-binding">저장</button>
</center>

</body>
</html>