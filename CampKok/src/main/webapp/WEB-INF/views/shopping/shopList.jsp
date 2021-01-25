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
<title>쇼핑몰</title>

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
            <p>쇼핑몰</p>
            <p>필요한 캠핑용품을 찾아보세요.</p>
        </div>
    </div>
    <div class="camp-content">
        <div class="page-title">
            <p>| SHOPPING</p>
        </div>
        <!--<div class="searchbar">
            <form action="#" method="post">
                <input type="text"><input type="text"><input type="text"><input type="text"><button type="submit">검색</button>
            </form>
        </div>-->
        <div class="camp-naeyong">
        	<c:forEach items="${list }" var="s" varStatus="status">
            <div class="camp-item">
                <a href="#" class="shop-item">
                    <div class="camp-item-img">
                        <img src="/resources/upload/shop/${s.shopFilepath }">
                    </div>
                    <ul>
                        <li><b>${s.productName }</b></li>
                        <!-- <li>2021-01-22</li> -->
                        <li>
	                        <p style="font-size: 15px;color:gray;">${s.userName }</p>
	                        <p>
	                        	<fmt:formatNumber value="${s.productPrice }" pattern="#,###"/>원
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
    
    <script>
        $(document).ready(function() {
            $('.shop-item').click(function(){
               alert('준비중입니다.');
               return false;
            });
        });
    </script>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

	<link rel="stylesheet" href="/resources/css/user/shopList.css">

</html>