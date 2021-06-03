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

function addItem(s){
	var ul = document.getElementById("dynamic-list");
  var li = document.createElement("li");
  li.setAttribute('id',s);
  li.appendChild(document.createTextNode(s));
  ul.appendChild(li);
}

function addPrice(p) {
	var price = parseInt(p);
	 var totalPrice = document.getElementById("price");
	 totalPrice.innerText =  parseInt(totalPrice.innerHTML) + parseInt(price);
 }
 
function transferOrderList() {
	 
	 var form = document.createElement("form");

   form._submit_function_ = form.submit;

   form.setAttribute("method","post");
   form.setAttribute("action", "order.jsp");
    
   var lists = document.getElementById("dynamic-list");
   var list = lists.getElementsByTagName("li");
   var noMenu = list.length;
   
   var hiddenField = document.createElement("input");
   hiddenField.setAttribute("type", "text");
   hiddenField.setAttribute("value", noMenu);
   hiddenField.setAttribute("name", "size");
   form.appendChild(hiddenField);
   
   for (var i = 0; i < noMenu; i++) {
  	 	hiddenField = document.createElement("input");
  	 hiddenField.setAttribute("type", "text");
  	 	hiddenField.setAttribute("value", list[i].childNodes[0].nodeValue); 
       hiddenField.setAttribute("name", "id"+i);
       form.appendChild(hiddenField);
   }
  
	document.body.appendChild(form);
   
   form.submit();
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
    	out.print("<td id = \""+menu.getName()+"\" onclick='addItem(\""+menu.getName()+"\"), addPrice(\""+menu.getPrice()+"\")' style= 'cursor:pointer;''font-size: 30px'>");
    	out.print(menu.getName());
    	 
    	out.print("<p id = '"+menu.getName()+"' style='font-size: 20px'>" + menu.getPrice() + "원</p>");
    	out.print("</td>"); 	
    	
    }
    out.print("</tr>");
    
    %> 
  
    
    </table >
    
	<div style="border: 1px solid gold; float: left; width: 15%; padding:10px;">
        <!--주문표 메뉴얼-->
       
        <table border="1" width="250" height="200" style="float:left" >
            <tr>
                <td height="10">
                    <p style="font-size: 15px">주문표</p>
                </td>
            </tr>
            <tr>
                <td height="250">
                	<ul id = "dynamic-list">
                	</ul>
                	
                    
                </td>
            </tr>
            <tr>
                <td height="20">
                    배달요금 2000원 포함: <p id = "price" >2000</p>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <button onclick="transferOrderList()">주문하기</button>        <!-- 주문하기 버튼-->
                </td>
            </tr>
        </table>
       
        
        <br />
    </div>
	
</body>
</html>