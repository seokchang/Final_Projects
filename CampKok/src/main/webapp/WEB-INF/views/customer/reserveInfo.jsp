<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <style>
        .content {
            background-color: #405944;
            margin: 0 auto;
            border-radius: 10px;
            width: 100%;
            height: 800px;
        }

        .mypage-menu {
            position: relative;
            width: 20%;
            height: 100%;
            background-color: #5a7356;
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
            float: left;
            font-family: 'Do Hyeon', sans-serif;
        }

        img {
            display: block;
            margin: 0 auto;
            margin-top: 10px;
        }

        h1 {
            text-align: center;
            color: #eba13d;
            margin: 0;
            letter-spacing: 3px;
        }

        .menu {
            line-height: 40px;
            font-size: 20px;
            margin-top: 40px;
            margin-left: 30px;
            color: #f3d479;
            letter-spacing: 1px;
        }

        .menu a {
            text-decoration-line: none;
            color: #f3d479;
        }

        .mypage-main {
            width: 80%;
            height: 100%;
            float: right;
        }

        .mypage-content {
            margin: 3%;
            width: 94%;
            height: 93%;
            background-color: #f2f2f2;
            border-radius: 10px;
        }

        .info {
            text-align: center;
            line-height: 50px;
            font-size: 18px;
        }

        .info form {
            display: block;
            margin: 0 auto;
        }

        .info table {
            border-collapse: collapse;
            width: 80%;
            border-color: darkgray;
            margin: auto;
            border: none;
        }

        .info table input {
            width: 80%;
            height: 40px;
            border-radius: 5px;
            border: 1px solid darkgray;
            float: left;
            margin-left: 5px;
            box-shadow: 0px 0.5px 1.5px darkgray inset;
            font-size: 18px;
        }

        .info input:focus {
            outline: none;
        }

        .info th {
            background-color: #f3d479;
            width:30%;
        }

        .info td {
            background-color: white;
            text-align: left;
        }
        span{
        	font-size:13px;
        	color:#f2542f;
        }

    </style>
</head>
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set>
<%-- <c:set var="outDate"><fmt:parseDate value="${r.resOutDate}" pattern="yyyy-MM-dd"/></c:set>
<c:set var="date2"><fmt:formatDate value="${outDate }" pattern="yyyy-MM-dd" /></c:set> --%>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="content">
        <!--왼쪽-->
        <div class="mypage-menu">
            <img src="/resources/img/customer/tent.png" width="60%">
            <h1>MY PAGE</h1>
            <ul class="menu">
                <li><a href="/mypage.do?userNo=2">회원 정보</a></li>
                <li><a href="/reserve.do?userNo=2"><b>예약 확인</b></a></li>
                <li><a href="/reserveAll.do?reqPage=1&userNo=2">이용 내역</a></li>
                <li><a href="/review.do?reqPage=1&userId=user01">리뷰 내역</a>
                <li><a href="/point.do?userNo=2">포인트 내역</a></li>
            </ul>
        </div>
        <!--오른쪽-->
        <div class="mypage-main">
            <div class="mypage-content">
                <br><br>
                <div class="info">
                    <h2>예약 내역 조회</h2>
                     <c:if test="${r==null }">
                     	<p>최근 예약하신 내역이 없습니다.</p>
                     </c:if>
                     <c:if test="${r!=null }">
                    <span>* 예약에 변동사항이 있을 시에는 따로 문의 부탁드려요~ *</span>
                    <table border="1">
                            <tr>
                                <th>캠피장명</th>
                                <td style="padding-left: 5px;">${r.campName }</td>
                            </tr>
                            <tr>
                                <th>캠피장 데스크명</th>
                                <td style="padding-left: 5px;">${r.campRoomName }</td>
                            </tr>
                            <tr>
                                <th>위치</th>
                                <td style="padding-left: 5px;">${r.campAddr }</td>
                            </tr>
                            <tr>
                                <th>날짜</th>
                                <td style="padding-left: 5px;">${r.resInDate } ${r.resInTime } ~ ${r.resOutDate } ${r.resOutTime }</td>
                            </tr>
                            <tr>
                                <th>예약인원</th>
                                <td style="padding-left: 5px;">${r.resMember } 명</td>
                            </tr>
                            <tr>
                                <th>메모</th>
                                <td style="padding-left: 5px;">${r.resMemo }</td>
                            </tr>
                        </table>
                       </c:if>
                </div>
            </div>
        </div>


    </div>
</body>

</html>