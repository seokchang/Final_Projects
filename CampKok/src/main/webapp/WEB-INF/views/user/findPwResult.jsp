<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/img/main/tent.png" rel="shortcut icon" type="image/x-icon">
<title>비밀번호찾기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="header-img">
        <div>
            <p>비밀번호 찾기</p>
            <p></p>
        </div>
    </div>
    <div class="login-content">
        <div class="login-box">
           <p>회원님의 비밀번호는 '${userPw }'입니다.</p>
           <a href="/loginFrm.do">로그인 하러 가기</a>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<link rel="stylesheet" href="/resources/css/user/findResult.css">
</html>