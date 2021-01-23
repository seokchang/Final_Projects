<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Form</title>
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
				<h1>공지사항 등록</h1>
				<hr>
				<div class="table-wrap">
					<form action="/insertNotice.do" method="POST" enctype="multipart/form-data">
						<table class="table table-striped">
							<tr>
								<th>분류</th>
								<td>
									<select name="userCategory" style="float: left;">
										<option value="client">고객</option>
										<option value="ceo">사업자</option>
									</select>
								</td>
								<th>작성자</th>
								<!-- Session ID로 변경 -->
								<td>
									<input type="text" name="userId" value="admin" readonly="readonly" style="border: none; background-color: transparent;">
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="3">
									<input class="form-control" type="text" name="noticeTitle" style="height: 35px; float: left;">
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="3">
									<input type="file" name="noticeFile" onchange="LoadImg(this)">
								</td>
							</tr>
							<tr>
								<th>이미지</th>
								<td colspan="3">
									<div style="text-align: left;">
										<img id="img-view" style="width: 50%">
									</div>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3">
									<textarea rows="20" class="form-control" name="noticeContents" id="noticeContents"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<input class="btn btn-warning btn-lg" name="submit" type="submit" onclick="submitContents(this)" value="등록하기">
								</td>
							</tr>
						</table>
					</form>
				</div>
				<hr>
				<div>
					<button class="btn btn-warning btn-md btn-list" onclick="location.href='/pageAdmin.do?reqPage=1'">Main</button>
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
			elPlaceHolder : "noticeContents",
			sSkinURI : "/nse_files/SmartEditor2Skin2.html",
			fCreator : "createSEditor2"
		});
		function submitContents(elClickedObj) {
			console.log(document.getElementById("noticeContents").value);
			oEditors.getById["noticeContents"]
					.exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다. 
			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

			try {
				elClickedObj.form.submit();
			} catch (e) {
			}
		}

		$(function() {
			$("input[name='submit']")
					.click(
							function() {
								var checkNoticeTitle = $("input[name='noticeTitle']");
								var checkNoticeContents = $("input[name='noticeContents']");

								if (checkNoticeTitle.val() == ""
										|| checkNoticeContents.val() == "") {
									alert("제목과 내용을 모두 작성해 주세요");
									return false;
								}
								return true;
							});
		});
	</script>
</body>
</html>