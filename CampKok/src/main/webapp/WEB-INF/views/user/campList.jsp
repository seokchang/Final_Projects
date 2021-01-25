<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <!-- 숫자 포맷을 사용하기 위한 라이브러리 -->
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/img/main/tent.png" rel="shortcut icon" type="image/x-icon">
<title>캠핑장</title>

<style>
.selectedPage {
	color: #f2f2f2;
	display: inline-block;
	width: 30px;
	height: 30px;
	border: none;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
	background-color: #405944;
	margin: 5px;
	font-weight: bold;
	font-size: 15px;
}

.pageNavi {
	width: 100%;
	display: block;
	text-align: center;
	margin-top: 10px;
	font-size: 14px;
}

.pageNavi a {
	text-decoration-line: none;
	color: #405944;
	display: inline-block;
	width: 30px;
	height: 30px;
	border: none;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
	background-color: white;
	margin: 5px;
}

.pageNavi a:hover {
	text-decoration-line: none;
	color: #F2542F;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
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
            <form action="/searchCampList.do" method="get">
            	<input type="hidden" name="reqPage" value="1">
                <select name="searchSelect">
                	<option value="campName">캠핑장이름</option>
                	<option value="campAddr">지역</option>
                </select>
                <input type="text" name="keyword"><button type="submit">검색</button>
            </form>
        </div>
        <div class="camp-naeyong">
        <!-- varStatus 번호 매길때 'i'역할!! -->
        	<c:forEach items="${list }" var="cl" varStatus="status">
        	<%-- ${brandList[status.index] }
        	${brandList[status.index].name}
        	${list.name } 한개의 for each문에서 여러개 list 같이 불러오고 싶을 때 사용하는 방법! --%>
	            <div class="camp-item">
	                <a href="/campView.do?campNo=${cl.campNo }">
	                <%-- 번호 출력하고 싶을 때 ${status.count } --%>
	                    <div class="camp-item-img">
	                    	<!-- 캠핑장 이미지 경로 설정 -->
	                        <img src="/resources/upload/camp/${cl.imgpath }">
	                    </div>
	                    <ul>
	                        <li style="display: none">${cl.campNo }</li>
	                        <li style="font-size: 14px; color:gray;">${cl.campAddr }</li>
	                        <li>${cl.campName }</li>
	                        <li>
	                        	<p>★ ${cl.campStar }</p>
	                        	<p>
	                        		<fmt:formatNumber value="${cl.campMinPrice }" pattern="#,###"/>원 ~
	                        	</p>
	                        </li>
	                    </ul>
	                </a>
	            </div>
            </c:forEach>
        </div>

        <div class="pageNavi">
            ${pageNavi }
        </div>

    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <link rel="stylesheet" href="/resources/css/user/campList.css">
</body>
</html>