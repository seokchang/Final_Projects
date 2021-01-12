<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CEO Info List</title>
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
				<div class="search-wrap">
					<form action="/searchCampInfo.do" method="GET">
						<input type="hidden" name="reqPage" value="1">
						<table>
							<tbody>
								<tr>
									<td>
										<select class="form-control" id="search-category" name="searchCategory">
											<option value="campName" selected="selected">캠핑장명</option>
											<option value="ceoId">아이디</option>
										</select>
									</td>
									<td>
										<input class="form-control" id="search" type="text" name="search">
									</td>
									<td>
										<input class="form-control" id="btnSearch" type="submit" value="">
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>

				<div class="table-wrap">
					<table class="table table-striped">
						<tbody>
							<tr>
								<th>번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>카테고리</th>
								<th>캠핑장명</th>
								<th>주소</th>
								<th>전화번호</th>
								<th></th>
							</tr>
							<c:forEach items="${list }" var="campInfo">
								<tr>
									<td>${campInfo.rNum }</td>
									<td>
										<a href="#"><strong>${campInfo.ceoId }</strong></a>
									</td>
									<td></td>
									<td>${campInfo.campCtg }</td>
									<td>
										<a href=#><strong>${campInfo.campName }</strong></a>
									</td>
									<td>${campInfo.campAddr }</td>
									<td>${campInfo.campTel }</td>
									<td>
										<button class="btn btn-warning btn-md" onclick="">상세보기</button>
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