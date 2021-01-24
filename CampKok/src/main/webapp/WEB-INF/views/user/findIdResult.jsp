<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="header-img">
        <div>
            <p>아이디 찾기</p>
            <p></p>
        </div>
    </div>
    <div class="login-content">
        <div class="login-box">
           <p>회원님의 아이디는 '${userId }'입니다.</p>
           <a href="/loginFrm.do">로그인 하러 가기</a>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<link rel="stylesheet" href="/resources/css/user/findResult.css">
</html>