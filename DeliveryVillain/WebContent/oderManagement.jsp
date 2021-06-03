<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, java.util.*, DeliveryVillain.*, java.io.PrintWriter"%>
    <%request.setCharacterEncoding("UTF-8");
    
    
    Object obj = session.getAttribute("store2");
	Store store = (Store)obj;
	
    Vector<Order> orderList = OrderDAO.getAllOrders(store.getsno());
    OrderDAO.loadConnect();
    
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
			<img class="logo-img" src="logo.png" alt="logo" />
		</h1>
	</div>
	</header>
	<center>
	
	<table border = "1">
	<th>주문번호</th>
	<th>주문날짜</th>
	<th>메뉴</th>
	<th>배송지</th>
	<th>요청사항</th>
	<th>결제수단</th>
	<th>주문처리</th>
	
	<% for (int i = 0; i < orderList.size(); i++) {
		out.print("<tr>");
		out.print("<td>" + orderList.get(i).getSno());
		out.print("<td>" + orderList.get(i).getDate());
		out.print("<td>" + orderList.get(i).getMenus());
		out.print("<td>" + orderList.get(i).getAddress());
		out.print("<td>" + orderList.get(i).getOrder());
		out.print("<td>" + orderList.get(i).getType());
		out.print("<td><button>승인</button>");
		out.print("</tr>");
	}
	
	%>
	
	</table>
	</center>
	

</body>
</html>