<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<link rel="stylesheet" href="/resources/css/admin/admin.css">
</head>

<body>
	<div class="wrap">
		<div class="header-wrap">
			<jsp:include page="/WEB-INF/views/admin/commons/adminHeader.jsp" />
		</div>

		<div class="content-wrap">
			<!-- Navi -->
			<div class="content-navi">
				<jsp:include page="/WEB-INF/views/admin/commons/adminNavi.jsp" />
			</div>

			<!-- Main -->
			<div class="content-main">
				<ul class="todo">
					<li style="background-color: #f3d479; color: #bf372b;"><strong>작업 리스트</strong></li>
					<li><a href="#">신규등록 신청 <span class="count">1</span></a></li>

				</ul>
				<div class="content-list">
					<!-- Statistics -->
					<div id="statistics">
						<h3>통계</h3>
					</div>

					<!-- Notice -->
					<div id="notice">
						<h3>공지사항 리스트</h3>
					</div>

					<!-- User Info -->
					<div id="userInfo">
						<h3>회원정보 리스트</h3>
					</div>

					<!-- Camp Info -->
					<div id="campInfo">
						<h3>캠핑장정보 리스트</h3>
					</div>

					<!-- Board -->
					<div id="board">
						<h3>자유게시판 리스트</h3>
					</div>

					<!-- FAQ -->
					<div>
						<h3>FAQ 게시판</h3>
					</div>
				</div>
			</div>

			<!-- Profile -->
			<div class="content-profile">
				<ul class="profile-wrap">
					<li><img alt="Admin Photo" src=""></li>
					<li class="profile">
						<table id="profile">
							<tr>
								<th>아이디</th>
								<td>
									<input type="text" name="userId" value="admin" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>
									<input type="text" name="userName" value="홍길동" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>
									<input type="text" name="phone" value="010-1234-5678" readonly="readonly">
								</td>
							</tr>
						</table>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>