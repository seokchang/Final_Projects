<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/customer/noticeView.css">
</head>
<style>
		.list-btn {
        	display:inline-block;
            width: 80px;
            height: 40px;
            font-size: 16px;
            text-align: center;
            background-color: #405944;
            border: 2px solid #405944;
            border-radius: 7px;
            margin-bottom: 10px;
            list-style: none;
            line-height:40px;
            color: #f2f2f2;
            text-decoration-line: none;
        }

        .write {
            width: 1200px;
            text-align: right;
        }
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="header-img">
        <div>
            <p>자유 게시판</p>
            <p></p>
        </div>
    </div>
    <div class="notice-content">
        <div class="page-title">
            | BOARD
        </div>
        <div class="write">
			<a href="/boardList.do?reqPage=1" class="list-btn">목록</a>
		</div>
        
        <div class="notice-naeyong">
            <table class="notice-tbl">
                <tr>
                    <th class="">제목</th>
                    <td colspan="3">${b.boardTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${b.userId }</td>
                    <th>등록일</th>
                    <td>${b.boardDate }</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3"><a href="javascript:fileDownload('${b.boardFilename }','${b.boardFilepath }')">${b.boardFilepath }</a></td>
                    <%-- <td colspan="3">${b.boardFilepath }</td> --%>
                </tr>
                <tr>
                    <td colspan="4" style="height: 400px;">${b.boardContents }</td>
                </tr>
<!--                 <tr>
                    <td colspan="4" style="text-align: center;height: 55px;"><a href="/boardList.do?reqPage=1" class="notice-btn">목록</a></td>
                </tr> -->
<%--                 <c:if test="${sessionScope.member.memberId.equals(b.boardId) }"> --%>
				<c:if test="${sessionScope.user.userId.equals(b.userId) }">
                <tr>
                	<td colspan="4" style="text-align: center;height: 55px;">
                    	<a href="/boardUpdateFrm.do?boardNo=${b.boardNo }" class="notice-btn">수정</a>
                    	<a href="/deleteBoard.do?boardNo=${b.boardNo }" class="notice-btn">삭제</a>
                    </td>
                </tr>
                </c:if>
            </table>
            <table class="notice-tbl2">
                <tr>
                    <th style="width: 200px;">다음글</th>
                    <td><a href="#">공지사항입니다</a></td>
                </tr>
                <tr>
                    <th>이전글</th>
                    <td><a href="#">공지사항입니다</a></td>
                </tr>
            </table>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
       <script>
      //첨부파일 다운로드
       function fileDownload(filename,filepath){//인코딩작업해주려고 자바스크립트로 함
         var url = "/boardDownload.do";
         var encFilename = encodeURIComponent(filename);
         var encFilepath = encodeURIComponent(filepath);
         location.href=url+"?filename="+encFilename+"&filepath="+encFilepath+"&boardNo="+${b.boardNo};
      }
   </script>
    </body>
</html>