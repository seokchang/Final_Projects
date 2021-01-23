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
				<h1>사업자 공지사항</h1>
				<hr>
				<div class="table-wrap" style="margin-top: 30px;">
					<form action="/updateCeoNotice.do" method="POST" enctype="multipart/form-data">
						<table class="table table-striped">
							<input type="hidden" name="ceoNoticeNo" value="${ceoNotice.ceoNoticeNo }">
							<c:if test="${not empty ceoNotice.ceoNoticeFilePath}">
								<input type="hidden" name="oldFile" value="${ceoNotice.ceoNoticeFilePath }">
							</c:if>
							<tr>
								<th>작성자</th>
								<td>
									<input class="read-only" type="text" name="userId" value="${ceoNotice.userId }" readonly="readonly" style="float: left;">
								</td>
								<th>등록일</th>
								<td>
									<input class="read-only" type="text" name="ceoNoticeDate" value="${ceoNotice.ceoNoticeDate }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="3">
									<input class="form-control" type="text" name="ceoNoticeTitle" value="${ceoNotice.ceoNoticeTitle }">
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="3">
									<c:if test="${not empty ceoNotice.ceoNoticeFilePath}">
										<span id="fileInfo">${ceoNotice.ceoNoticeFilePath }</span>
									</c:if>
									<input type="file" name="ceoNoticeFile" onchange="LoadImg(this)">
								</td>
							</tr>
							<tr>
								<th>이미지</th>
								<td colspan="3">
									<div style="text-align: left;">
										<c:if test="${not empty ceoNotice.ceoNoticeFilePath}">
											<img id="img-view" src="/imgPreview.do?filePath=${ceoNotice.ceoNoticeFilePath }" style="width: 50%;">
										</c:if>
										<c:if test="${empty ceoNotice.ceoNoticeFilePath}">
											<img id="img-view" style="width: 50%;">
										</c:if>
									</div>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3">
									<textarea rows="20" class="form-control" name="ceoNoticeContents" id="ceoNoticeContents">${ceoNotice.ceoNoticeContents }</textarea>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<input class="btn btn-warning btn-lg" type="submit" onclick="submitContents(this)" value="수정하기">
									<button class="btn btn-warning btn-lg" type="button"
										onclick="location.href='/deleteCeoNotice.do?ceoNoticeNo=${ceoNotice.ceoNoticeNo}&ceoNoticeFilePath=${ceoNotice.ceoNoticeFilePath }'">삭제하기</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<hr>
				<div>
					<button class="btn btn-warning btn-md btn-list" onclick="location.href='/selectCeoNoticeList.do?reqPage=1'">목록</button>
				</div>
			</div>
		</div>
	</div>

	<link rel="stylesheet" href="/resources/css/admin/adminDesignCommon.css">
	<script type="text/javascript" src="/resources/js/admin/imgPreView.js"></script>
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ceoNoticeContents",
			sSkinURI : "/nse_files/SmartEditor2Skin2.html",
			fCreator : "createSEditor2"
		});
		function submitContents(elClickedObj) {
			console.log(document.getElementById("ceoNoticeContents").value);
			oEditors.getById["ceoNoticeContents"].exec("UPDATE_CONTENTS_FIELD",
					[]); // 에디터의 내용이 textarea에 적용됩니다. 
			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}
	</script>
</body>
</html>