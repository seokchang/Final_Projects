<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 글자 수 자르기 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 숫자 포맷을 사용하기 위한 라이브러리 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/img/main/tent.png" rel="shortcut icon" type="image/x-icon">
<title>Campkok</title>
<!-- jQuery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>

<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Paytone+One&display=swap"
	rel="stylesheet">

<!-- css -->
<link rel="stylesheet" href="/resources/css/main/main.css">

<!-- favicon -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
</head>
<body>

	<div class="header">
		<div id="header-scroll"></div>
		<div class="header-logo">
			<a href="/"></a><img src="resources/img/main/logo-w.png">
			<p>
				<a href="/main.do">Campkok</a>
			</p>
		</div>
		<nav>
			<ul>
				<!-- <li><a href="/index2.do">작업페이지</a></li> -->
				<li><a href="/campList.do?reqPage=1">캠핑장</a></li>
				<li><a href="/boardList.do?reqPage=1">게시판</a></li>
				<li><a href="/shopList.do?reqPage=1">쇼핑몰</a></li>
				<c:choose>
					<c:when test="${sessionScope.user.userLevel != 2 }">
						<li><a href="/faqList.do?reqPage=1&faqUser=client">FAQ</a></li>
						<li><a href="/customerNoticeList.do?reqPage=1">공지사항</a></li>
					</c:when>
					<c:when test="${sessionScope.user.userLevel == 2 }">
						<li><a href="/faqList.do?reqPage=1&faqUser=ceo">FAQ</a></li>
						<li><a href="/mainCeoNoticeList.do?reqPage=1">공지사항</a></li>
						<!-- <li><a href="#">광고</a></li> -->
						<!-- <li><a href="/camp/campjoinFrm.do">캠핑장 등록</a></li> -->
					</c:when>
				</c:choose>
			</ul>
		</nav>
		<div class="header-user">
			<div class="user-btn">
				<div id="user-btn-slide"></div>
			</div>
			<div class="user-box">
				<ul>
					<c:choose>
						<c:when test="${sessionScope.user == null }">
							<li><a href="joinPage.do">회원가입</a></li>
							<li><a href="loginFrm.do">로그인</a></li>
						</c:when>
						<c:when test="${sessionScope.user.userLevel != 2 }">
							<li><a href="/mypage.do?userNo=${sessionScope.user.userNo }">마이페이지</a></li>
							<li><a href="/dmList.do?userId=${sessionScope.user.userId }">쪽지</a></li>
							<hr>
							<li><a href="logout.do">로그아웃</a></li>
						</c:when>
						<c:when test="${sessionScope.user.userLevel == 2 }">
							<li><a href="/mypage.do?userNo=${sessionScope.user.userNo }">마이페이지</a></li>
							<li><a href="/camp/campmypage.do?userId=${sessionScope.user.userId }">내 캠핑장</a></li>
							<li><a href="/camp/campjoinFrm.do?userId=${sessionScope.user.userId }">캠핑장 등록</a></li>
							<hr>
							<li><a href="logout.do">로그아웃</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>


	<div class="main-content">
		<div class="banner">
			<div class="banner-content">d</div>
			<div class="searchbar">
				<form action="/searchCampList.do" method="post">
					<input type="text" name="keyword" placeholder="어느곳으로 캠핑을 떠나보시겠어요?">
					<input type="hidden" name="reqPage" value="1"> <input
						type="hidden" name="searchSelect" value="campAddr">
					<button type="submit">검색</button>
				</form>

			</div>
			<img src="/resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg">
		</div>

		<div class="hr-sect">이런 캠핑장은 어떠세요?</div>
		<div class="new-camping">
			<div class="new-camping-content">
				<a href="/campView.do?campNo=3">
					<div>
						<img src="/resources/upload/camp/89beada650250.jpg">
					</div>
					<p>[ 경기 ] 글램비글램핑</p>
				</a>
			</div>
			<div class="new-camping-content">
				<a href="/campView.do?campNo=5">
					<div>
						<img src="/resources/upload/camp/mosadvshqj.jpeg">
					</div>
					<p>[ 경기 ] 산중호걸 글램핑</p>
				</a>
			</div>
			<div class="new-camping-content">
				<a href="/campView.do?campNo=7">
					<div>
						<img src="/resources/upload/camp/다운로드.jpg">
					</div>
					<p>[ 경기 ] 포시즌오토캠핑장</p>
				</a>
			</div>
			<div class="new-camping-content">
				<a href="/campView.do?campNo=1">
					<div>
						<img src="/resources/upload/camp/대표이미지1(2).png">
					</div>
					<p>[ 강원 ] 캠누리오토캠핑장</p>
				</a>
			</div>
			<div class="new-camping-content">
				<a href="/campView.do?campNo=45">
					<div>
						<img src="/resources/upload/camp/mosa9WNVWh.jpeg">
					</div>
					<p>[ 인천 ] 마리원캠핑장</p>
				</a>
			</div>
		</div>

		<div class="hr-sect">새로운 캠핑장</div>
		<div class="new-camping">
			<c:forEach items="${newCampList }" var="newCamp" begin="0" end="4"
				step="1">
				<div class="new-camping-content">
					<a href="/campView.do?campNo=${newCamp.campNo }">
						<div>
							<img src="/resources/upload/camp/${newCamp.imgpath }">
						</div>
						<p>[ 
							<c:choose>
								<c:when test="${fn:length(newCamp.campAddr) gt 2}">
								    <c:out value="${fn:substring(newCamp.campAddr, 0, 2)}"/>
							    </c:when>
							    <c:otherwise>
							    	<c:out value="${newCamp.campAddr}"/>
							    </c:otherwise>
							</c:choose>
							] ${newCamp.campName }
						</p>
					</a>
				</div>
			</c:forEach>
		</div>

		<div class="hr-sect">캠핑장 랭킹</div>
		<div class="rank-camping-wrap">
			<div class="rank-camping">
				<c:forEach items="${campRanking }" var="rank" varStatus="vs"
					begin="0" end="9" step="1">
					<div class="rank-content">
						<div>
							<img src="/resources/upload/camp/${rank.imgpath }">
						</div>
						<ul>
							<li>
								<p class="rank-num">${vs.count }&nbsp;</p><a href="/campView.do?campNo=${rank.campNo }" style="text-decoration: none; color: #232323;">${rank.campName }</a>
							</li>
							<li>
								<c:choose>
									<c:when test="${fn:length(rank.campAddr) gt 16}">
									    <c:out value="${fn:substring(rank.campAddr, 0, 16)}"/>...
								    </c:when>
								    <c:otherwise>
								    	<c:out value="${rank.campAddr}"/>
								    </c:otherwise>
								</c:choose>
							</li>
							<li><p class="rank-star">★ ${rank.campStar }</p></li>
							<li>
								<fmt:formatNumber value="${rank.campMinPrice }" pattern="#,###"/>원 ~
							</li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>


	<script>
		$(document).ready(function() {
			// header scroll fadin,out
			var hdOffset = $('.header').offset();
			$(window).scroll(function() {
				if ($(document).scrollTop() > hdOffset.top) {
					$('#header-scroll').stop(true).animate({
						'opacity' : 1
					}, 150);
				} else {
					$('#header-scroll').stop(true).animate({
						'opacity' : 0
					}, 150);
				}
			});

			// user-box show,hide
			$("#user-btn-slide").click(function() {
				if ($(".user-box").css("display") == "none") {
					/*$(this).css({'float':'right','background-color':'#2d2d2d'});*/
					// 버튼좀 스무스하게 움직이고 싶은데 마음대로 안되네
					$(".user-btn").css({
						'flex-direction' : 'row-reverse',
						'transition-duration' : '0.5s'
					});
					$(".user-box").fadeIn('fast');
				} else {
					/*$(this).css({'float':'','background-color':'#fff'});*/
					$(this).css({
						'float' : ''
					});
					$(".user-btn").css({
						'flex-direction' : 'row'
					});
					// $(".user-btn").css({'backgroun-color':''});
					$(".user-box").fadeOut('fast');
				}
			});

			/*
			// header 메뉴 클릭했을때 bgco fix
			$('nav').find('a').click(function() {
			    if ($('#header-scroll').css("opacity") == "0") {
			        $("#header-scroll").animate({
			            'opacity': 1
			        }, 200);
			    } else if($(this).mouseleave()) {
			        $("#header-scroll").css('opacity', '0');
			    }
			});
			 */
		});
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>