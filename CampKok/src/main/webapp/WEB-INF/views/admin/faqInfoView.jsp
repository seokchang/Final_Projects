<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ View</title>
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
				<h1>FAQ</h1>
				<hr>
				<div class="table-wrap" style="margin-top: 30px;">
					<form action="/updateFAQInfo.do" method="POST">
						<table class="table table-striped">
							<tbody>
								<input type="hidden" name="faqNo" value="${faqInfo.faqNo }">
								<tr>
									<th>분류</th>
									<td colspan="3">
										<select class="form-control" name="faqUser" style="width: 13%">
											<option value="client" selected="selected">고객</option>
											<option value="ceo">사업자</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td style="text-align: left;">
										<input class="read-only" type="text" name="userId" value="${faqInfo.userId }" readonly="readonly">
									</td>
									<th>등록일</th>
									<td>${faqInfo.faqDate }</td>
								</tr>
								<tr>
									<th>제목</th>
									<td colspan="3">
										<input class="form-control" type="text" name="faqTitle" value="${faqInfo.faqTitle }">
									</td>
								</tr>
								<tr>
									<th>내용</th>
									<td colspan="3">
										<textarea rows="20" class="form-control" name="faqContents" id="faqContents">${faqInfo.faqContents }</textarea>
									</td>
								</tr>

								<tr>
									<td colspan="4" style="text-align: center;">
										<input class="btn btn-warning btn-lg" type="submit" onclick="submitContents(this)" value="수정하기">
										<button class="btn btn-warning btn-lg" type="button" onclick="location.href='/deleteFAQInfo.do?faqNo=${faqInfo.faqNo}'">삭제하기</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div style="text-align: center;">
					<button class="btn btn-warning btn-md btn-list" onclick="location.href='/selectFAQInfoList.do?reqPage=1'">목록</button>
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
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "faqContents",
			sSkinURI : "/nse_files/SmartEditor2Skin2.html",
			fCreator : "createSEditor2"
		});
		function submitContents(elClickedObj) {
			console.log(document.getElementById("faqContents").value);
			oEditors.getById["faqContents"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다. 
			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}
	</script>
</body>
</html>