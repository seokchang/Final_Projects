<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/campList.jsp" />
	<div class="header-img">
        <div>
            <p>캠핑장</p>
            <p>전국 방방곡곡의 캠핑장을 한 곳에 모아보았습니다.<br>원하는 캠핑장을 찾아보세요.</p>
        </div>
    </div>
    <div class="camp-content">
        <div class="page-title">
            
        </div>
        <div class="searchbar">
            <form action="#" method="post">
                <input type="text"><input type="text"><input type="text"><input type="text"><button type="submit">검색</button>
            </form>
        </div>
        <div class="camp-naeyong">
        <!-- 왜이래ㅠ -->
        	<c:forEach items="${list }" var="list" varStatus="index">
	            <div class="camp-item">
	                <a href="#">
	                    <div class="camp-item-img">
	                        <img src="/src/main/webapp/resources/img/main/best-free-camping-united-states-740x419.jpg">
	                    </div>
	                    <ul>
	                        <li style="display: none">${list.campNo }</li>
	                        <li>${list.campAddr }</li>
	                        <li>${list.campName }</li>
	                        <li><p>★ 4.9</p><p>39,000원 ~</p></li>
	                    </ul>
	                </a>
	            </div>
            </c:forEach>
        </div>

        <div class="paging">
            ${pageNavi }
        </div>

    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <link rel="stylesheet" href="/resources/css/common/campList.css">
</body>
</html>