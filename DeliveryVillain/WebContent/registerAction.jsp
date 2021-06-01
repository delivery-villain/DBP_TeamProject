<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, java.util.*, DeliveryVillain.*, java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("UTF-8");
String menuName = request.getParameter("storeName");
String phoneNumber = request.getParameter("StorePhoneNumber");
Object object = session.getAttribute("user");
User user = (User)object;
Store store = new Store(phoneNumber, menuName);
session.setAttribute("store", store);

StoreDAO.loadConnect();

int result = StoreDAO.addStore(store, user.getID());
if (result != 0) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('등록 완료')");
	script.println("</script>");
}
response.sendRedirect("indexForSeller.jsp");

%>
</body>
</html>