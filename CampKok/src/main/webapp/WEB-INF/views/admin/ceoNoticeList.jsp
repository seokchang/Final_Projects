<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CEO Notice List</title>
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
				<h1>사업자 공지사항</h1>
				<hr>
				<div class="search-wrap">
					<select class="form-control" name="userCategory" id="select-userCategory">
						<option value="client">제목</option>
						<option value="ceo">작성자</option>
					</select>
					<input class="form-control" type="text" name="search">
					<button class="btnSearch" onclick="">
						<img alt="Not Found Search" src="/resources/img/admin/baseline_search_black_18dp.png">
					</button>
					<button class="btnWriteNotice" onclick="location.href='/pageNoticeForm.do'">공지사항 작성</button>
				</div>

				<div class="table-wrap">
					<table class="table table-striped">
						<tbody>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>첨부파일</th>
								<th>작성자</th>
								<th>등록일</th>
								<th></th>
							</tr>
							<c:forEach items="${list }" var="ceoNotice" varStatus="index">
								<tr>
									<td>${ceoNotice.rNum }</td>
									<td>
										<a href="/selectCeoNotice.do?ceoNoticeNo=${ceoNotice.ceoNoticeNo }">${ceoNotice.ceoNoticeTitle }</a>
									</td>
									<td>
										<c:if test="${not empty ceoNotice.ceoNoticeFileName }">
											<img class="img-file" src="/resources/img/admin/free-icon-attached-file-1209914.png">
										</c:if>
									</td>
									<td>${ceoNotice.userId }</td>
									<td>${ceoNotice.ceoNoticeDate }</td>
									<td>
										<button class="btn btn-warning btn-sm" onclick="location.href='/selectCeoNotice.do?ceoNoticeNo=${ceoNotice.ceoNoticeNo}'">상세보기</button>
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