<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, java.util.*, DeliveryVillain.*, java.io.PrintWriter"%>
    <%request.setCharacterEncoding("UTF-8"); 
    
    %>
    
    <% 
    
   	Vector<Store> stores = StoreDAO.getAllStores();
    
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
	<form action = "sotreOrder.jsp" method = "post">
	
	
	
	<table border="2" width="1000" height="100" ; style="margin-left: auto; margin-right: auto;" >
	
	<% 
	
	int count = stores.size();
	for (int i = 0; i < count - 1; i +=2) {
		Store store1 =stores.get(i);
		Store store2 =stores.get(i + 1);
	out.print("<tr>");
	out.print("<td style = 'cursor:pointer;' onClick = \"location.href='storeOrder.jsp?&num=" + store1.getsno() + "'\">" + store1.getName()  + "</td>");
	out.print("<td style = 'cursor:pointer;' onClick = \"location.href='storeOrder.jsp?&num=" + store2.getsno() + "'\">" + store2.getName()  + "</td>");
	out.print("</tr>");
	}
	if(stores.size() % 2 != 0) {
		Store store = stores.get(count -1);
		out.print("<tr>");
		out.print("<td style = 'cursor:pointer;' onClick = \"location.href='storeOrder.jsp?&num=" + store.getsno() + "'\">" + store.getName()  + "</td>");
		out.print("<td>"); 
		out.print("</tr>");
	}
		%>
	
	
	</table>
	</form>
	</center>
	
	
</body>
</html>