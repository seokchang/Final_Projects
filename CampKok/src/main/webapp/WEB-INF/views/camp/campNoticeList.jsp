<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>��������</h1>
	<hr>
	<table border=1>
		<tr>
			<th>��ȣ</th><th>����</th><th>�ۼ���</th><th>�ۼ���</th>
		</tr>
		<c:forEach items="${list }" var="n">
			<tr>
				<td>${n.CampNoticeNo }</td>
				<td>${n.CampNoticeTitle }</td>
				<td>${n.CampNo }</td>
				<td>${n.CampNoticeDate }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" style="text-align : center">${pageNavi }</td>
		</tr>
 	</table>
</body>
</html>