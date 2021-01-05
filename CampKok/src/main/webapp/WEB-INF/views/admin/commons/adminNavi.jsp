<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Navi</title>
<link rel="stylesheet" href="/resources/css/admin/adminNavi.css">
</head>

<body>
	<ul class="menu-wrap">
		<li><a href="#">DashBoard</a></li>
		<li>
			<a href="javascript:void(0)" id="notice">공지사항 관리</a>
			<ul class="submenu">
				<li><a href="#">공지사항 리스트</a></li>
				<li><a href="#">공지사항 작성</a></li>
			</ul>
		</li>
		<li><a href="#">회원정보 관리</a></li>
		<li><a href="#">캠핑장정보 관리</a></li>
		<li><a href="#">자유게시판 관리</a></li>
		<li><a href="#">FAQ</a></li>
		<li><a href="#">통계</a></li>
		<li><a href="#">1:1채팅</a></li>
	</ul>

	<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".submenu").hide();
			$(".submenu").prev().append("<span class='more'>+</span>");
			$("#notice").click(function() {
				$(".submenu").slideToggle();
				$(".more").toggleClass("active");
			});
		})
	</script>
</body>
</html>