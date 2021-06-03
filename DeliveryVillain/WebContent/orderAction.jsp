<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, java.util.*, DeliveryVillain.*, java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
MenuDAO.loadConnect();
request.setCharacterEncoding("UTF-8");
String type = request.getParameter("type");
String adderss = request.getParameter("address1") + request.getParameter("address2");
String orders = request.getParameter("orderStr");
int count = Integer.parseInt(request.getParameter("size"));

Object object = session.getAttribute("user");
User user = (User)object;

Vector<Menu> menus = new Vector<Menu>();
String menu = "";

for (int i = 0; i < count; i++) {	
	menus.add(MenuDAO.getMenu(request.getParameter("id"+ Integer.toString(i))));
	menu = menu + (menus.get(i).getName() + ", ");
}


Order order = new Order(user.getID(), adderss, orders, type, menus.get(0).getSno());

order.setMenus(menu);



OrderDAO.loadConnect();


int result = OrderDAO.addOrder(order, menus.get(0).getSno());
if (result != 0) {
	response.sendRedirect("finish.jsp");
}


%>

</body>
</html>