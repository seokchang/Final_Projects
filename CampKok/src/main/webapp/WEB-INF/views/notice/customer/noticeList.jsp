<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="resources/img/main/tent.png" rel="shortcut icon" type="image/x-icon">
    <title>공지사항</title>
    <link rel="stylesheet" href="/resources/css/customer/noticeList.css">

<style>
.selectPage {
	color: #f2f2f2;
	display: inline-block;
	width: 30px;
	height: 30px;
	border: none;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
	background-color: #405944;
	margin: 5px;
	font-weight: bold;
	font-size: 15px;
}

.pageNavi {
	width: 100%;
	display: block;
	text-align: center;
	margin-top: 10px;
	font-size: 14px;
}

.pageNavi a {
	text-decoration-line: none;
	color: #405944;
	display: inline-block;
	width: 30px;
	height: 30px;
	border: none;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
	background-color: white;
	margin: 5px;
}

.pageNavi a:hover {
	text-decoration-line: none;
	color: #F2542F;
}
</style>

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
                    <th class="notice-tbl-th-1">번호</th>
                    <th class="notice-tbl-th-2">제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                </tr>
                <c:forEach items="${list }" var="clientNotice" varStatus="index">
                <tr>
                    <td style="text-align: center">${clientNotice.rNum }</td>
                    <td><a href="/selectCustomerNotice.do?clientNoticeNo=${clientNotice.clientNoticeNo }">${clientNotice.clientNoticeTitle }</a></td>
                    <td style="text-align: center">${clientNotice.userId }</td>
                    <td style="text-align: center">${clientNotice.clientNoticeDate }</td>
                </tr>
                </c:forEach>
            </table>
        </div>

        <div class=".pageNavi">
            ${pageNavi }
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>