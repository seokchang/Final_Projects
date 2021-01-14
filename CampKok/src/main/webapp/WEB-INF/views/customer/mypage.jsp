<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/customer/mypage.css">
    <style>
/*         body {
            background-color: #f5f5f5;
        }

        .mypage-content {
            width: 80%;
            justify-items: center;
            flex-direction: column;
            align-items: center;
            margin: 0 auto;
        }

        .page-title {
            width: 100%;
            font-size: 30px;
            margin: 30px;
            margin-top: 60px;
            margin-left: 0;
            font-weight: bold;
            color: #405944;
        }

        .mypage-form {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .mypage-tbl {
            background-color: #fff;
            width: 100%;
            border-top: 3px solid #405944;
            border-collapse: collapse;
        }

        .mypage-tbl-th-1 {
            padding: 20px 30px;
        }

        .mypage-tbl-th-2 {
            width: 600px;
        }

        .mypage-tbl>tbody>tr>th {
            background-color: #fcfcfc;
        }

        .mypage-tbl>tbody>tr>td,
        th {
            border-bottom: 1px solid #ccc;
            padding: 15px 10px;
        }

		table input {
            width: 95%;
            height: 30px;
            border-radius: 5px;
            border: 1px solid darkgray;
            float: left;
            margin-left: 5px;
            box-shadow: 0px 0.5px 1.5px darkgray inset;
        }
        input[type=submit] {
            display: block;
            background-color: #405944;
            width: 200px;
            color: #fff;
            text-decoration: none;
            text-align: center;
            height: 50px;
            line-height: 50px;
            padding: 0;
            border: none;
            font-size: 16px;
            margin:0 auto;
        }

        input[type=submit]:hover {
            color: #405944;
            text-decoration: none;
            background-color: #fff;
            border: 1px solid #405944;

        }

        form {
            width: 100%;
        }

        .mypage-tbl th {
            text-align: center;
        }

        .modify-btn {
            width: 100%;
        }
        
                .navi {
            width: 450px;
            position: relative;
        }

        .navi>ul>li:first-child {
            border-top-left-radius: 10px;
        }

        .navi>ul>li:last-child {
            border-top-right-radius: 10px;
        }

        .navi>ul {
            overflow: hidden;
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        .navi>ul>li {
            float: left;
            width: 90px;
            background-color: #5a7356;

        }

        .navi>ul>li>a {
            text-decoration: none;
            text-align: center;
            line-height: 40px;
            display: block;
            height: 40px;
            color: white;
            box-sizing: border-box;
            font-size: 13px;
        }

        .navi>ul>li:hover>a {
            color: #f3d479;
            font-weight: bolder;
            font-size: 14px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;

        }

        .navi>ul>li:hover>ul>li {
            opacity: 1;
            position: relative;
            height: 50px;
            transition-duration: 0.5s;
        } */  
    </style>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="header-img">
        <div>
            <p>마이페이지</p>
            <p></p>
        </div>
    </div>
    <div class="mypage-content">
        <div class="page-title">
            | My Page
        </div>
        <div class="navi">
            <ul>
                <li style="background-color: #405944;">
                	<a style=" font-size: 14px; font-weight: bold; color: #f3d479;" href="/mypage.do?userNo=${user.userNo }">
                		<b>회원 정보</b>
                	</a>
                </li>
                <li><a href="/reserve.do?userNo=${user.userNo }">예약 확인</a></li>
                <li><a href="/reserveAll.do?reqPage=1&userNo=${user.userNo }">이용 내역</a></li>
                <li><a href="/review.do?reqPage=1&userId=${user.userId }">리뷰 내역</a></li>
                <li><a href="/point.do?userNo=${user.userNo }">포인트 내역</a></li>
            </ul>
        </div>
        <div class="mypage-form">
            <form action="/update.do" method="post">
            <input type="hidden" name="userNo" value="${u.userNo }">
                <table class="mypage-tbl">
                            <tr>
                                <th>아이디</th>
                                <td>${u.userId}</td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td style="padding:0;"><input type="password" placeholder="비밀번호를 입력해주세요" name="userPw" value="${u.userPw }"></td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>${u.userName}</td>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <td>${u.userBirth }</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td style="padding:0;"><input type="text" placeholder="010-0000-0000" name="userPhone" value="${u.userPhone }"></td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td style="padding:0;"><input type="text" name="userAddr" value="${u.userAddr}"></td>
                            </tr>
                            <tr>
                                <th>포인트</th>
                                <td>${u.userPoint}</td>
                            </tr>
                            <tr>
                                <th>가입일</th>
                                <td style="padding-left: 5px;">${u.userDate}</td>
                            </tr>
                </table>
                <br>
               
                <div class="modify-btn">
 					<input type="submit" value="수정">
                </div>
            </form>

        </div>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>