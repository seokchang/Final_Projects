<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/img/main/tent.png" rel="shortcut icon" type="image/x-icon">
<title>비밀번호찾기</title>
<link rel="stylesheet" href="/resources/css/user/findPage.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="header-img">
        <div>
            <p>비밀번호 찾기</p>
            <p>아이디, 회원이름, 전화번호를 입력해주세요.</p>
        </div>
    </div>
    <div class="login-content">
        <div class="login-box">
           <p>비밀번호 찾기</p>
            <form action="findPw.do" method="post">
                <table>
                    <tr>
                        <td>아이디</td>
                        <td><input type="text" class="login-input" name="userId"></td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td><input type="text" class="login-input" name="userName"></td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td><input type="text" class="login-input" name="userPhone" placeholder="ex) 010-0000-0000"></td>
                    </tr>
                </table>
                <button type="submit" class="login-btn">찾기</button>
            </form>
            <p>아이디가 기억나지 않으신다면 <a href="/findIdPage.do">아이디 찾기</a></p>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>