<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

        .info th {
            background-color: #f3d479;
            font-size:15px;
        }

        .info td {
            background-color: white;
            font-size:15px;
            text-align: center;
        }
/*          .info tr:last-child>td {
            background-color: #f2f2f2;
            border:none;
            font-size:15px;
            text-align: center;
        } */
        .selectedPage{
        	color: #f2f2f2;
        	display:inline-block;
        	width:30px;
        	height: 30px;
        	border:none;
        	text-align: center;
        	line-height: 30px;
        	border-radius: 5px;
        	background-color: #f3d479;
        	margin:5px;
        	font-weight:bold;
        	font-size: 15px;
        }
        .pageNavi{
        	width:100%;
        	display:block;
        	text-align: center;
        	margin-top:10px;	
        	font-size: 14px;
        }
        .pageNavi a{
        	text-decoration-line: none;
        	color: #405944;
        	display:inline-block;
        	width:30px;
        	height: 30px;
        	border:none;
        	text-align: center;
        	line-height: 30px;
        	border-radius: 5px;
        	background-color: white;
        	margin:5px;
        }
        .star{
        	display:inline-block;
        }

    </style>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="content">
        <!--왼쪽-->
        <div class="mypage-menu">
            <img src="/resources/img/customer/tent.png" width="60%">
            <h1>MY PAGE</h1>
            <ul class="menu">
                <li><a href="/mypage.do?userNo=2">회원 정보</a></li>
                <li><a href="/reserve.do?userNo=2">예약 확인</a></li>
                <li><a href="/reserveAll.do?reqPage=1&userNo=2">이용 내역</a></li>
                <li><a href="/review.do?reqPage=1&userId=user01"><b>리뷰 내역</b></a>
                <li><a href="/point.do?userNo=2">포인트 내역</a></li>
            </ul>
        </div>
        <!--오른쪽-->
        <div class="mypage-main">
            <div class="mypage-content">
                <br><br>
                <div class="info">
                    <h2>리뷰 작성 내역 조회</h2>
                    
                    <table border="1">
                           <tr>
                               <th width="15%">캠핑장 명</th>
                               <th width="45%">리뷰 내용</th>
                               <th width="13%">별점</th>
                               <th width="7%">좋아요</th>
                           </tr>
                           <c:forEach items="${list }" var="rv">
                           <tr>
                           		<td width="15%">${rv.campName }</td>
                           		<td width="45%">${rv.revContents }</td>
                           		<td width="13%">
                           		<c:forEach begin="1" end="${rv.revStar }">
                           		<img class="star" src="/resources/img/customer/star-on.png">
                           		</c:forEach>
                           		</td>
                           		<td width="7%">${rv.revHeart }</td>
                           </tr>
                             </c:forEach>
                        </table>
                        <div class="pageNavi">${pageNavi }</div>
                  
                </div>
            </div>
        </div>


    </div>
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>