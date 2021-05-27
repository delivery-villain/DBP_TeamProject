<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, java.util.*, DeliveryVillain.*, java.io.PrintWriter"%>
    
    <%
    request.setCharacterEncoding("UTF-8");
    String storeName = "";
    String phoneNumber = "";
    String sno ="";
    int storeNum = 0;
    
    Object object = session.getAttribute("user");
    User user = (User)object;
    
    Store store = new Store();
    StoreDAO.setStoreInfo(user, store);
    session.setAttribute("store2", store);
    
     if (store.getName() != null){
    	 storeName = store.getName();
     }
     if (store.getPhoneNumber() != null) {
    	 phoneNumber = store.getPhoneNumber();
     }
     
     storeNum = store.getsno();
 
    if (storeNum != 0){
    	sno = Integer.toString(storeNum);
    }
    
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
	가게이름: <%= storeName %><br>
	전화번호: <%= phoneNumber %><br>
	가게번호: <%= sno %><br>

	<div class= "bnt container">
	<button type="button" class="btn btn-login ng-binding" onclick = "location.href = 'menuManagement.jsp'">매뉴관리</button>
	<button type="button" class="btn btn-login ng-binding" onclick = "location.href = 'register.jsp'">주문관리</button>
	<button type="button" class="btn btn-login ng-binding" onclick = "location.href = 'register.jsp'">업체등록</button>
	</div>

</body>
</html>