<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Client Reservation List</title>
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
				<h1>캠핑장 이용내역 관리</h1>
				<hr>
				<div class="table-wrap">
					<table class="table table-striped">
						<tbody>
							<tr>
								<th>번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>캠핑장명</th>
								<th>이용날짜</th>
								<th>인원</th>
								<th>가격</th>
								<th></th>
							</tr>
							<c:forEach items="${list }" var="reservationInfo">
								<tr>
									<td>${reservationInfo.rNum }</td>
									<td>${reservationInfo.clientInfo.userId }</td>
									<td>${reservationInfo.clientInfo.userName }</td>
									<td>
										<a href="/selectCampInfo.do?campNo=${reservationInfo.campInfo.campNo }"><strong>${reservationInfo.campInfo.campName }</strong></a>
									</td>
									<td>${reservationInfo.resInDate }</td>
									<td>${reservationInfo.resMember }</td>
									<td>${reservationInfo.resPrice }</td>
									<td>
										<button class="btn btn-warning btn-md" onclick="location.href='/selectReservationInfo.do?resNo=${reservationInfo.resNo}'">상세보기</button>
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