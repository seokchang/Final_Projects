<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
                        <td><input type="text" class="login-input" name="userPhone"></td>
                    </tr>
                </table>
                <button type="submit" class="login-btn">찾기</button>
            </form>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>