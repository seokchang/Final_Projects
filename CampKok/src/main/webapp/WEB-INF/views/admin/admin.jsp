<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
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
					<!-- Client Info -->
					<div id="client-info">
						<h3>
							<a href="/selectClientInfoList.do?reqPage=1">고객정보 관리</a>
						</h3>
						<table class="table table-striped">
							<tbody>
								<tr>
									<th>번호</th>
									<th>아이디</th>
									<th>이름</th>
									<th>가입일</th>
								</tr>
								<c:forEach items="${clientInfoList }" var="clientInfo" begin="0" end="4" step="1">
									<tr>
										<td>${clientInfo.rNum }</td>
										<td>
											<a href="">${clientInfo.userId }</a>
										</td>
										<td>${clientInfo.userName }</td>
										<td>${clientInfo.userDate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<button class="btn btn-warning btn-md" onclick="">리스트 보기</button>
					</div>

					<!-- CEO Info -->
					<div id="ceo-info">
						<h3>
							<a href="#">사업자정보 관리</a>
						</h3>
					</div>

					<!-- Client Notice -->
					<div id="client-notice">
						<h3>
							<a href="/selectClientNoticeList.do?reqPage=1">고객 공지사항</a>
						</h3>
						<table class='table table-striped'>
							<tbody>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>등록일</th>
								</tr>
								<c:forEach items="${clientNoticeList }" var="clientNotice" begin="0" end="4" step="1">
									<tr>
										<td>${clientNotice.rNum }</td>
										<td>
											<a href="/selectClientNotice.do?clientNoticeNo=${clientNotice.clientNoticeNo }">${clientNotice.clientNoticeTitle }</a>
										</td>
										<td>${clientNotice.clientNoticeDate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<button class='btn btn-warning btn-md' onclick="location.href='/selectClientNoticeList.do?reqPage=1'">리스트 보기</button>
					</div>

					<!-- CEO Notice -->
					<div id="ceo-notice">
						<h3>
							<a href="/selectCeoNoticeList.do?reqPage=1">사업자 공지사항</a>
						</h3>
						<table class="table table-striped">
							<tbody>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>등록일</th>
								</tr>
								<c:forEach items="${ceoNoticeList }" var="ceoNotice" begin="0" end="4" step="1">
									<tr>
										<td>${ceoNotice.rNum }</td>
										<td>
											<a href="/selectCeoNotice.do?ceoNoticeNo=${ceoNotice.ceoNoticeNo }">${ceoNotice.ceoNoticeTitle }</a>
										</td>
										<td>${ceoNotice.ceoNoticeDate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<button class="btn btn-warning btn-md" onclick="location.href='/selectCeoNoticeList.do?reqPage=1'">리스트보기</button>
					</div>

					<!-- Camp Info -->
					<div id="camp-info">
						<h3>
							<a href="#">캠핑장 관리</a>
						</h3>
					</div>

					<!-- Board Info -->
					<div id="board">
						<h3>
							<a href="#">자유게시판 관리</a>
						</h3>
					</div>

				</div>
			</div>

			<!-- Profile -->
			<div class="content-profile">
				<ul class="profile-wrap">
					<li><img alt="Admin Photo" src="/resources/img/admin/main_img4.jpg"></li>
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

	<link rel="stylesheet" href="/resources/css/admin/adminDesignCommon.css">
	<link rel="stylesheet" href="/resources/css/admin/admin.css">
</body>
</html>