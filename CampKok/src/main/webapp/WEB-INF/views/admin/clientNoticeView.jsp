<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CEO Notice View</title>
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
				<h1>공지사항</h1>
				<hr>
				<div class="table-wrap" style="margin-top: 30px;">
					<form action="/updateClientNotice.do" method="POST" enctype="multipart/form-data">
						<table class="table table-striped">
							<tr>
								<th>작성자</th>
								<td>${clientNotice.userId }</td>
								<th>등록일</th>
								<td>${clientNotice.clientNoticeDate }</td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="3">
									<input class="form-control" type="text" value="${clientNotice.clientNoticeTitle }">
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="3">
									<c:if test="${not empty clientNotice.clientNoticeFilePath }">
										<span id="fileInfo">${clientNotice.clientNoticeFilePath }</span>
									</c:if>
									<input type="file" name="clientNoticeFileName" value="${clientNotice.clientNoticeFilePath }">
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3">
									<textarea class="form-control" name="clientNoticeContents">${clientNotice.clientNoticeContents }</textarea>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<input class="btn btn-warning btn-lg" type="submit" value="수정하기">
									<button class="btn btn-warning btn-lg" type="button"
										onclick="location.href='/deleteClientNotice.do?clientNoticeNo=${clientNotice.clientNoticeNo}'">삭제하기</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<hr>
				<div>
					<button class="btn btn-warning btn-md btn-list" onclick="location.href='/selectClientNoticeList.do?reqPage=1'">목록</button>
				</div>
			</div>
		</div>
	</div>

	<link rel="stylesheet" href="/resources/css/admin/adminDesignCommon.css">
</body>
</html>