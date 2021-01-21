<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
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
                <a href="#" id="shop-item">
                    <div class="camp-item-img">
                        <img src="/src/main/webapp/resources/upload/shop/${s.shopFilepath }">
                    </div>
                    <ul>
                        <li>${s.productContents }</li>
                        <!-- <li>2021-01-22</li> -->
                        <li><p>${s.userName }</p><p>${s.productPrice }원</p></li>
                    </ul>
                </a>
            </div>
            </c:forEach>
        </div>

        <div class="paging">
            ${pageNavi }
        </div>

    </div>
    
    <script>
        $(document).ready(function() {
            $('#shop-item').click(function(){
               alert('준비중입니다.');
               return false;
            });
        });
    </script>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

	<link rel="stylesheet" href="/resources/css/user/shopList.css">

</html>