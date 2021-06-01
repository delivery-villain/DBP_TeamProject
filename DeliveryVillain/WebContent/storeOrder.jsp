<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, java.util.*, DeliveryVillain.*, java.io.PrintWriter"%>
    <%
    request.setCharacterEncoding("UTF-8");
    StoreDAO.loadConnect();
    int num = Integer.parseInt(request.getParameter("num"));
    Store store = StoreDAO.getStore(num);
    
    Vector<Menu> menus = MenuDAO.getAllMenus(store.getsno());
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>요기요</title>
<link rel="stylesheet" href="CSS/headerStyle.css">
<script type="text/javascript">
list =[]
funtion addMenu() {
	var ul = document.getElementById();
	var li  = document.createElement("li");
	li.setAttribute('id', menu.value)
	li.appendChild(document.createTextnode(menu.value))
	ul.appnedChild(li);
}
</script>
</head>
<body>
	<header class="header">
	<div class="container">
		<h1 class="logo">
			<img class="logo-img" src="logo.png" alt="logo" />
		</h1>
	</div>
	</header>
	
    <p style="font-size: 30px; text-align:center; "><%= store.getName() %></p>
    <table border="1" width="1000" height="100" ; style="margin-left: auto; margin-right: auto;">
        <thead>
        <th><input type="button" value="메뉴" /></th>
        <th><input type="button" value="리뷰" /></th>
        <th><input type="button" value="정보" /></th>
        </thead>
    </table>
    <br />
    <table border="2" width="1000" height="100" ; style="margin-left: auto; margin-right: auto;">
    <%
    for (int i = 0; i < menus.size(); i++) {
    	Menu menu = menus.get(i);
    	out.print("<tr>");
    	out.print("<td onClick='location.href=\'링크입력\'' style='font-size: 30px'>");
    	out.print(menu.getName());
    	out.print("<p style='font-size: 20px'>" + menu.getPrice() + "원</p>");
    }
    %>
    
    </table>
	<div style="border: 1px solid gold; float: left; width: 15%; padding:10px;">
        <!--주문표 메뉴얼-->
        <table border="1" width="250" height="200" style="float:left">
            <tr>
                <td height="10">
                    <p style="font-size: 15px">주문표</p>
                </td>
            </tr>
            <tr>
                <td height="250">
                    [주문표에 담긴 메뉴]
                </td>
            </tr>
            <tr>
                <td height="20">
                    배달요금 2000원 별도 + [금액]
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <input type="button" value="주문하기" onclick="location.href='order.jsp'"/>            <!-- 주문하기 버튼-->
                </td>
            </tr>
        </table>
        <br />
    </div>
	
</body>
</html>