<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/customer/noticeView.css">
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="header-img">
        <div>
            <p>공지사항</p>
            <p></p>
        </div>
    </div>
    <div class="notice-content">
        <div class="page-title">
            | NOTICE
        </div>
        <div class="notice-naeyong">
            <table class="notice-tbl">
                <tr>
                    <th class="">제목</th>
                    <td colspan="3">${ceoNotice.ceoNoticeTitle }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ceoNotice.userId }</td>
                    <th>등록일</th>
                    <td>${ceoNotice.ceoNoticeDate }</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3">${ceoNotice.ceoNoticeFilePath }</td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 400px;">${ceoNotice.ceoNoticeContents }</td>
                </tr>
                <tr>
                    <td colspan="4" style="text-align: center;height: 55px;"><a href="/mainCeoNoticeList.do?reqPage=1" class="notice-btn">목록</a></td>
                </tr>
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
</body></html>