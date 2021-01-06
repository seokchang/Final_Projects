<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Header</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/css/admin/adminHeader.css">
</head>

<body>
	<ul class="header-wrap">
		<li><a href="/adminPage.do?reqPage=1"><img alt="Not Found Logo.png" src="/resources/img/admin/Logo.png"></a></li>
		<li>
			<div class="header-menu">
				<a href="#">신규등록 신청 <span class="count">1</span></a> <a href="#">FAQ</a>
				<button class="btnExit" onclick="location.href='index.jsp'">Main Page</button>
			</div>
		</li>
	</ul>
</body>
</html>