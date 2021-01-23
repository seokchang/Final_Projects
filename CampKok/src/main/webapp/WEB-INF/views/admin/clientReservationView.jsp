<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Client Info View</title>
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
				<h1>캠핑장 이용내역</h1>
				<hr>
				<div class="table-wrap" style="margin-top: 30px;">
					<table class="table table-striped">
						<tbody>
							<tr>
								<th>아이디</th>
								<td>${reservationInfo.clientInfo.userId }</td>
								<th>이름</th>
								<td>${reservationInfo.clientInfo.userName }</td>
							</tr>
							<tr>
								<th>캠핑장명</th>
								<td colspan="3">${reservationInfo.campInfo.campName }</td>
							</tr>
							<tr>
								<th>캠핑룸</th>
								<td colspan="3">${reservationInfo.campRoomInfo.roomName }</td>
							</tr>
							<tr>
								<th>입실 날짜</th>
								<td>${reservationInfo.resInDate }</td>
								<th>퇴실 날짜</th>
								<td>${reservationInfo.resOutDate }</td>
							</tr>
							<tr>
								<th>입실 시간</th>
								<td>${reservationInfo.resInTime }</td>
								<th>퇴실 시간</th>
								<td>${reservationInfo.resOutTime }</td>
							</tr>
							<tr>
								<th>인원</th>
								<td colspan="3">${reservationInfo.campRoomInfo.roomMember }</td>
							</tr>
							<tr>
								<th>이용 횟수</th>
								<td colspan="3">${reservationInfo.resCount }</td>
							</tr>
							<tr>
								<th>가격</th>
								<td>${reservationInfo.campRoomInfo.roomPrice }</td>
							</tr>
							<tr>
								<th>메모</th>
								<td colspan="3" style="text-align: left;"></td>
							</tr>
						</tbody>
					</table>
				</div>
				<hr>
				<div>
					<button class="btn btn-warning btn-md btn-list"
						onclick="location.href='/selectReservationInfoList.do?reqPage=1&userNo=${reservationInfo.clientInfo.userNo }'">목록</button>
				</div>
			</div>
		</div>
	</div>

	<link rel="stylesheet" href="/resources/css/admin/adminDesignCommon.css">

	<style type="text/css">
.table>tbody>tr>td {
	text-align: left;
}
</style>
</body>
</html>