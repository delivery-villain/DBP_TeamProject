<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     import="java.sql.*, java.util.*, DeliveryVillain.*, java.io.PrintWriter"%>
    <%request.setCharacterEncoding("UTF-8");
   
    int count = Integer.parseInt(request.getParameter("size"));
    Vector<Menu> menus = new Vector<Menu>();
    
    for (int i = 0; i < count; i++) {	
    	menus.add(MenuDAO.getMenu(request.getParameter("id"+ Integer.toString(i))));
    }
   
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%


%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>요기요</title>
<link rel="stylesheet" href="CSS/headerStyle.css">
<style type="text/css">
		body {
			margin: 0;
		}
		h1 {
			margin: 0;
			color: white;
			Background-color: #f41458;
			font-family:"여기어때 잘난체";
		}
		header img {
			margin-left: 10%;
		}
		p {
			margin-left: 10px;
		}
		span {
			padding: 7px 10px;
		}
		#id00 {
			position: absolute;
			left: 25%;
			top: 200;
			margin: 10;
		}
		#id01 {
			background-color: #333;
			float: left;
			width: auto;
			min-width: 500px;
			margin: 10px 5px;
		}
		#id02 {
			color: white;
			padding-left: 5px;
		}
		#id03 {
			background-color: gainsboro;
			padding: 5px;
		}
		#id04 {
			height: auto;
		}

		#id100 {
			float: right;
			background-color: gainsboro;
			margin: 10px 5px;
			width: auto;
			min-width: 300px;
			padding-left: 5px;
		}

	</style>
	
	<script type="text/javascript">
	
	function checkOnlyOne(element) {
		  
		  const checkboxes = document.getElementsByName("type");
		  
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  element.checked = true;
		}
	
	
	function transferOrderList() {
		 
		 var form = document.createElement("form");

	   // Move the submit function to another variable
	   // so that it doesn't get overwritten.
	   form._submit_function_ = form.submit;

	   form.setAttribute("method","post");
	   form.setAttribute("action", "orderAction.jsp");
	    
	   var lists = document.getElementById("dynamic-list");
	   var list = lists.getElementsByTagName("li");
	   var address1 = document.getElementById("address1");
	   var address2 = document.getElementById("address2");
	   var orderStr = document.getElementById("order");
	   
	   var noMenu = list.length;
	   
	   var hiddenField = document.createElement("input");
	   hiddenField.setAttribute("type", "text");
	   hiddenField.setAttribute("value", noMenu);
	   hiddenField.setAttribute("name", "size");
	   form.appendChild(hiddenField);
	   
	    hiddenField = document.createElement("input");
	   hiddenField.setAttribute("type", "text");
	   hiddenField.setAttribute("value", address1.value);
	   hiddenField.setAttribute("name", "address1");
	   form.appendChild(hiddenField);
	   
	    hiddenField = document.createElement("input");
	   hiddenField.setAttribute("type", "text");
	   hiddenField.setAttribute("value", address2.value);
	   hiddenField.setAttribute("name", "address2");
	   form.appendChild(hiddenField);
	   
	    hiddenField = document.createElement("input");
	   hiddenField.setAttribute("type", "text");
	   hiddenField.setAttribute("value", orderStr.value);
	   hiddenField.setAttribute("name", "orderStr");
	   form.appendChild(hiddenField);
	   
	    hiddenField = document.createElement("input");
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
	   
	   var checkBoxes = document.getElementsByName("type");
	   
	   for (var i = 0; i < checkBoxes.length; i++) {
		   if (checkBoxes[i].checked) {
			   hiddenField = document.createElement("input");
			   hiddenField.setAttribute("type", "text");
			   hiddenField.setAttribute("value", checkBoxes[i].value);
			   hiddenField.setAttribute("name", "type");
			   form.appendChild(hiddenField);
		   }
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
	
	
	<div id="id00">

		<div id="id01">
			<div id="id02">
				<p>
					결제하기
				</p>
			</div>
			
			<div id="id03">
				<p>
					배달정보
				</p>
			</div>
			<div id="id04">
				<div>
					<input id = "address1" type="text" placeholder="배달 주소" value="경기도 오산시 양산동 한신대길 137">
				</div>
					  <div class="col-sm-offset-2 col-sm-10">
						<input id = "address2" type="text"placeholder="(필수)상세주소 입력">
						<span class="text-danger">상세한 주소를 입력해주세요.</span>
					  </div>
			</div>


			<div id="id03">
				<p>
					주문시 요청사항
				</p>
			</div>
			<div id="id05">
				<textarea id = "order" rows="3" name="comment" maxlength="100" placeholder="코로나19 예방을 위해 비대면 배달 권장드립니다. 요기서 결제 선택 후, &quot;문 앞 배달&quot;을 요청사항에 남겨주세요." style="margin: 0px -9.34375px 0px 0px; width: 481px; height: 76px;"></textarea>
				<div style="padding: 2px 0px;">
					<div style="padding: 2px 0px;">
						0 / 100
					</div>
				</div>
			</div>
			<div id="id03">
				<p>
					결제수단 선택
					<input type ="checkbox" name ="type" value = "신용카드" onclick = "checkOnlyOne(this);"/>신용카드
					<input type ="checkbox" name ="type" value = "현금결제" onclick = "checkOnlyOne(this);"/>현금결제
					<input type ="checkbox" name ="type" value = "토스" onclick = "checkOnlyOne(this);"/>토스
				</p>
			</div>
		</div>
		
		<div id="id100">
		
		
			<p>
				주문내역
			</p>
			
			
			<%
			out.print("<ul id = 'dynamic-list'>");
			int totalPrice = 0;
			for (int i = 0; i < count; i++) {
				Menu menu = menus.get(i);
				out.print("<li>"+menu.getName()+"</li>\t" + menu.getPrice()+"원");
				totalPrice += menu.getPrice();
			}
			
			out.print("</ul>");
			out.print("<p>배달료 2000원</p>");
			out.print("<p>총 결제 금액:  " + (totalPrice +2000) + "</p>");
			
			
			%>
			<button onclick="transferOrderList()">결제하기</button>
			
		</div>
	</div>
		
</body>
</html>