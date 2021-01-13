<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	<title>ķ���� ��������</title>
	<link rel="stylesheet" href="/resources/css/customer/noticeList.css">
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<div class="header-img">
        <div>
            <p>ķ���� ��������</p>
            <p></p>
        </div>
    </div>
	<hr>
	
	<div class="notice-content">
		<div class="page-title">
            | NOTICE
        </div>
         <div class="notice-naeyong">
        	<table class="notice-tbl">
			<tr>
				<th class="notice-tbl-th-1">��ȣ</th>
				<th class="notice-tbl-th-2">����</th>
				<th>ķ����</th>
				<th>�ۼ���</th>
			</tr>
			<c:forEach items="${list }" var="n" varStatus="index">
			<tr>
				<td style="text-align: center">${n.campNoticeNo }</td>
				<td>${n.campNoticeTitle }</td>
				<td style="text-align: center">${n.campNo }</td>
				<td style="text-align: center">${n.campNoticeDate }</td>
			</tr>
			</c:forEach>
			</table>
        </div>
        <div class="paging">
            ${pageNavi }
        </div>       
	</div>
 	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>