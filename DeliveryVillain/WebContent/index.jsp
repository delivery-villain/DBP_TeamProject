<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import ="java.io.PrintWriter"
	import="java.sql.*, java.util.*, DeliveryVillain.*, java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>요기요</title>
<link rel="stylesheet" href="CSS/style.css">
</head>
<body>

<% 
 StoreDAO.loadConnect();
request.setCharacterEncoding("UTF-8");
	String s;
if(session.getAttribute("user") == null) {
			s = "로그인";
        	 }
         else {
        	 s = "로그아웃";
         }
%>

	<header class="header">
	<div class="container">
		<h1 class="logo">
			<img class="logo-img" src="logo.png" alt="logo" />
		</h1>
		<div class="nav-top clearfix" ng-hide="$location.path() == '/login/' &amp;&amp; is_mobile_device">
        <div id="cart" class="pull-right">
          <span class="gps-status ng-binding" ng-show="check_show_location_button()" ng-click="toggle_location_block()" ng-bind="current_location">위치 알 수 없음</span>
          <a class="visible-xs" ng-show="check_show_location_button()" ng-click="toggle_location_block()">
           <span class="ico-set-pic"></span>
         </a>
         <a id="button-cart" href="" class="visible-xs ng-hide" ng-click="click_cart_button()" ng-show="check_show_cart_button()">
           <span class="ico-cart"></span>
           <span class="badge ng-binding" ng-bind="global_cart.get_amount()">0</span>
         </a>
         <button type="button" class="btn btn-login ng-binding" onclick = "location.href = 'login.jsp'" ><%= s %></button>
         <button type="button" class="btn btn-warning hidden-xs ng-binding ng-hide" ng-show="show_pc_cart_button()" ng-click="click_cart_button()" ng-bind="&quot;주문표(&quot; + global_cart.get_amount() + &quot;)&quot;">주문표(0)</button>
         </div>
       </div>
	</div>
	</header>
	<div id="search" class="search">
		<div class="input-group">
			<span class="input-group-btn loc">
				<button class="btn btn-default ico-loc" type="button"
					ng-click="get_current_location()">&nbsp;</button>
			</span>
			<form action="." onsubmit="return false"
				class="ng-pristine ng-invalid ng-invalid-required ng-valid-minlength">
				<input type="search"
					class="form-control ng-pristine ng-scope ng-invalid ng-invalid-required ng-valid-minlength ng-touched"
					name="address_input" autocomplete="off" autocorrect="off"
					autocapitalize="off" spellcheck="false"
					placeholder="건물명, 도로명, 지번으로 검색하세요." ng-minlength="1"
					ng-required="true"
					ng-model="session_storage.location.address_input" bs-dropdown=""
					ng-focus="show_location_search()" required="required">
			</form>
			<span id="button_search_address"
				class="input-group-btn always-show-search-buttons  show-search-buttons">
				<button
					class="btn-search-location-cancel btn-search-location btn btn-default"
					type="button" ng-click="clear_search_location_input($event)"
					ng-show="is_shown_location_search.v">
					<span class="searchfield-cancel-button">&nbsp;</span>
				</button>
				<button class="btn btn-default ico-pick" type="button"
					ng-click="select_location($event)">검색</button>
			</span>
		</div>
	</div>
	<div class="category-list" ng-hide="$location.path() != &quot;/&quot;">
		<div class="row">
			<!-- ngRepeat: banner in banner_list -->
			<div class="col-xs-6 col-sm-4 col-md-3 category-banner ng-scope"
				ng-repeat="banner in banner_list" style=""
				on-finish-render="completeBannerListRender()">
				<a href="" class="thumbnail" ng-click="setEvent($index, banner)"
					ng-style="{'background': banner.background_color}"
					style="background: rgb(0, 144, 255);"><img
					ng-src="https://d5bfh7nnlp98y.cloudfront.net/ohal_banner/YGY_ohal05_MW_thumd_2.png"
					alt="202105_ohal"
					src="https://d5bfh7nnlp98y.cloudfront.net/ohal_banner/YGY_ohal05_MW_thumd_2.png"><i
					class="icon-move"></i></a>
			</div>
			<!-- end ngRepeat: banner in banner_list -->
			<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
				<a href="store.jsp" class="thumbnail" ng-click="select_home_category('all')"><div
						class="category-title">전체보기</div> <img src="image/category-01.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
				<a href="store.jsp" class="thumbnail"
					ng-click="select_home_category('1인분주문')"><div
						class="category-title">1인분 주문</div> <img
					src="image/category-onedish.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="store.jsp" class="thumbnail"
					ng-click="select_home_category('프랜차이즈')"><div
						class="category-title">프랜차이즈</div> <img
					src="image/category-10.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="store.jsp" class="thumbnail" ng-click="select_home_category('치킨')"><div
						class="category-title">치킨</div> <img src="image/category-02.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="store.jsp" class="thumbnail" ng-click="select_home_category('피자양식')"><div
						class="category-title">피자/양식</div> <img
					src="image/category-03.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="store.jsp" class="thumbnail" ng-click="select_home_category('중식')"><div
						class="category-title">중국집</div> <img src="image/category-04.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="store.jsp" class="thumbnail" ng-click="select_home_category('한식')"><div
						class="category-title">한식</div> <img src="image/category-05.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="store.jsp" class="thumbnail"
					ng-click="select_home_category('일식돈까스')"><div
						class="category-title">일식/돈까스</div> <img
					src="image/category-06.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="store.jsp" class="thumbnail" ng-click="select_home_category('족발보쌈')"><div
						class="category-title">족발/보쌈</div> <img
					src="image/category-07.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="store.jsp" class="thumbnail" ng-click="select_home_category('야식')"><div
						class="category-title">야식</div> <img src="image/category-08.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="store.jsp" class="thumbnail" ng-click="select_home_category('분식')"><div
						class="category-title">분식</div> <img src="image/category-09.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="store.jsp" class="thumbnail"
					ng-click="select_home_category('카페디저트')"><div
						class="category-title">카페/디저트</div> <img
					src="image/category-11.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="store.jsp" class="thumbnail" ng-click="select_home_category('편의점')"><div
						class="category-title">편의점/마트</div> <img
					src="image/category-convenience-store.png"></a>
			</div>
		</div>
	</div>
</body>
</html>