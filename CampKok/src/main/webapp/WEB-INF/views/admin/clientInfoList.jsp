<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Client Info List</title>
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
				<h1>고객정보 관리</h1>
				<hr>
				<div class="search-wrap">
					<select class="form-control" name="userCategory" id="select-userCategory">
						<option value="client">아이디</option>
						<option value="ceo">이름</option>
					</select>
					<input class="form-control" type="text" name="search">
					<button class="btnSearch" onclick="">
						<img alt="Not Found Search" src="/resources/img/admin/baseline_search_black_18dp.png">
					</button>
				</div>

				<div class="table-wrap">
					<table class="table table-striped">
						<tbody>
							<tr>
								<th>번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>주소</th>
								<th>포인트</th>
								<th>가입일</th>
								<th></th>
							</tr>
							<c:forEach items="${list }" var="clientInfo">
								<tr>
									<td>${clientInfo.rNum }</td>
									<td>
										<a href="/selectClientInfo.do?userNo=${clientInfo.userNo }"><strong>${clientInfo.userId }</strong></a>
									</td>
									<td>${clientInfo.userName }</td>
									<td>${clientInfo.userPhone }</td>
									<td>${clientInfo.userAddr }</td>
									<td>${clientInfo.userPoint }</td>
									<td>${clientInfo.userDate }</td>
									<td>
										<button class="btn btn-warning btn-md" onclick="location.href='/selectClientInfo.do?userNo=${clientInfo.userNo}'">상세보기</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="pageNavi">${pageNavi }</div>
				</div>
			</div>
		</div>
	</div>

	<link rel="stylesheet" href="/resources/css/admin/adminDesignCommon.css">
	<link rel="stylesheet" href="/resources/css/admin/adminDesignList.css">
</body>
</html>