<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, java.util.*, DeliveryVillain.*, java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>요기요</title>


</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String menuName = request.getParameter("menuName");
int price = Integer.parseInt(request.getParameter("price")) ;
int sno = Integer.parseInt(request.getParameter("storeNum"));
Menu menu = new Menu(menuName, price);
MenuDAO.loadConnect();

int result = MenuDAO.addMenu(menu, sno);
if (result != 0) {
	response.sendRedirect("menuManagement.jsp");	
}


%>
</body>
</html>