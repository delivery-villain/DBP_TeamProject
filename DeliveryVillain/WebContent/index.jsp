<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����</title>
<link rel="stylesheet" href="CSS/style.css">
</head>
<body>
	<header class="header">
	<div class="container">
		<h1 class="logo">
			<img class="logo-img" src="logo.png" alt="logo" />
		</h1>
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
					placeholder="�ǹ���, ���θ�, �������� �˻��ϼ���." ng-minlength="1"
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
					ng-click="select_location($event)">�˻�</button>
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
				<a href="" class="thumbnail" ng-click="select_home_category('all')"><div
						class="category-title">��ü����</div> <img src="image/category-01.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3">
				<a href="" class="thumbnail"
					ng-click="select_home_category('1�κ��ֹ�')"><div
						class="category-title">1�κ� �ֹ�</div> <img
					src="image/category-onedish.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail"
					ng-click="select_home_category('����������')"><div
						class="category-title">����������</div> <img
					src="image/category-10.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('ġŲ')"><div
						class="category-title">ġŲ</div> <img src="image/category-02.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('���ھ��')"><div
						class="category-title">����/���</div> <img
					src="image/category-03.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('�߽�')"><div
						class="category-title">�߱���</div> <img src="image/category-04.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('�ѽ�')"><div
						class="category-title">�ѽ�</div> <img src="image/category-05.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail"
					ng-click="select_home_category('�Ͻĵ��')"><div
						class="category-title">�Ͻ�/���</div> <img
					src="image/category-06.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('���ߺ���')"><div
						class="category-title">����/����</div> <img
					src="image/category-07.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('�߽�')"><div
						class="category-title">�߽�</div> <img src="image/category-08.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('�н�')"><div
						class="category-title">�н�</div> <img src="image/category-09.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail"
					ng-click="select_home_category('ī�����Ʈ')"><div
						class="category-title">ī��/����Ʈ</div> <img
					src="image/category-11.png"></a>
			</div>
			<div class="col-xs-6 col-sm-4 col-md-3">
				<a href="" class="thumbnail" ng-click="select_home_category('������')"><div
						class="category-title">������/��Ʈ</div> <img
					src="image/category-convenience-store.png"></a>
			</div>
		</div>
	</div>
</body>
</html>