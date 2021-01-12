<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Camp Info View</title>
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
				<h1>캠핑장정보 관리</h1>
				<hr>
				<div class="table-wrap" style="margin-top: 30px;">
					<table class="table table-striped">
						<tr>
							<th>사업자 아이디</th>
							<td>${campInfo.ceoId }</td>
							<th>사업자명</th>
							<td>${campInfo.ceoInfo.userName }</td>
						</tr>
					</table>
				</div>
				<hr>
				<div style="text-align: center;">
					<button class="btn btn-warning btn-lg" onclick="">캠핑장 정보 보기</button>
					<button class="btn btn-warning btn-md btn-list" onclick="location.href='/selectCeoInfoList.do?reqPage=1'">목록</button>
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