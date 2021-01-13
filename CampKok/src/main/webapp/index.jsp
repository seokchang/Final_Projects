<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>CampKok Main</h1>
	<hr>
	<h3>
		<a href="/pageAdmin.do?reqPage=1">Admin Page</a>
	</h3>
	<hr>
	<h3>고객_은영</h3>
	<h2>[${sessionScope.user.userName }]</h2>
	<h2>[${sessionScope.user.userLevel }]</h2>
	<a href="/joinPage.do">회원가입</a>
	<a href="/loginFrm.do">로그인</a>
	<a href="/logout.do">로그아웃</a>
	<a href="/customerNoticeList.do?reqPage=1">공지사항</a>
	<a href="/mainCeoNoticeList.do?reqPage=1">사장님공지사항</a>
	<a href="/campList.do?reqPage=1">캠핑장리스트</a>
	<hr>
	<h3>고객</h3>
	<a href="/mypage.do?userNo=${sessionScope.user.userNo }">마이페이지</a>
	<a href="/allMemberChat.do">채팅</a>
	<a href="/boardList.do?reqPage=1">자유 게시판</a>
	<hr>
	<h3>사업자_기현</h3>
	<a href="/camp/kihyun.do">사업자_기현페이지</a>
	<a href="/mypage.do?userNo=2">마이페이지</a>
	<a href="/camp/jinwoo.do">진우 작업페이지</a>
	
	<hr>
	<a href="/main.do">메인페이지</a>
</body>
</html>