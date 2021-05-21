<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.sql.*, java.util.*, DeliveryVillain.*, java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>요기요</title>
</head>
<body>
<%
String userName = request.getParameter("userName");
String userID = request.getParameter("userID");
String userPassword = request.getParameter("userPassword");
String userPhoneNumber = request.getParameter("userPhoneNumber");
Boolean userType = Boolean.parseBoolean(request.getParameter("userType"));
User user = new User(userName, userID, userPassword, userPhoneNumber, userType);
DB.loadConnect();

DB.insertUser(user);

PrintWriter script = response.getWriter();

script.println("<script>");
script.println("location.href = 'login.jsp'");
script.println("</script>");

%>
</body>
</html>