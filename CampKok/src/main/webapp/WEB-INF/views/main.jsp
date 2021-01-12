<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Campkok</title>
	<!-- jQuery -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

    <!-- font -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Paytone+One&display=swap" rel="stylesheet">
    
    <!-- css -->
	<link rel="stylesheet" href="/resources/css/main/main.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<div class="header">
        <div class="header-logo">
            <a href="#"></a><img src="resources/img/main/logo-w.png">
            <p><a href="#">Campkok</a></p>
        </div>
        <nav>
            <ul>
                <li><a href="#">캠핑장</a></li>
                <li><a href="#">게시판</a></li>
                <li><a href="#">쇼핑몰</a></li>
                <li><a href="#">FAQ</a></li>
            </ul>
        </nav>
        <div class="header-user">
            <div class="user-btn"><a href="#">
                    <div></div>
                </a></div>
            <div class="user-box">
                <ul>
                    <li>회원가입</li>
                    <li>로그인</li>
                    <li>마이페이지</li>
                    <li>1:1 채팅</li>
                    <li>쪽지</li>
                </ul>
            </div>
        </div>
    </div>


    <div class="main-content">
        <div class="banner">
            <div class="banner-content">d</div>
            <div class="searchbar">
                <form action="#" method="post">
                    <input type="text" placeholder="어느곳으로 캠핑을 떠나보시겠어요?"><button type="submit">검색</button>
                </form>

            </div>
            <img src="resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg">
        </div>

        <div class="hr-sect">이런 캠핑장은 어떠세요?</div>
        <div class="new-camping">
            <div class="new-camping-content">
                <div><img src="resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg"></div>
                <p>[ 지역 ] 캠핑장이름</p>
            </div>
            <div class="new-camping-content">
                <div><img src="resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg"></div>
                <p>[ 지역 ] 캠핑장이름</p>
            </div>
            <div class="new-camping-content">
                <div><img src="resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg"></div>
                <p>[ 지역 ] 캠핑장이름</p>
            </div>
            <div class="new-camping-content">
                <div><img src="resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg"></div>
                <p>[ 지역 ] 캠핑장이름</p>
            </div>
            <div class="new-camping-content">
                <div><img src="resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg"></div>
                <p>[ 지역 ] 캠핑장이름</p>
            </div>
        </div>

        <div class="hr-sect">새로운 캠핑장</div>
        <div class="new-camping">
            <div class="new-camping-content">
                <div><img src="resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg"></div>
                <p>[ 지역 ] 캠핑장이름</p>
            </div>
            <div class="new-camping-content">
                <div><img src="resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg"></div>
                <p>[ 지역 ] 캠핑장이름</p>
            </div>
            <div class="new-camping-content">
                <div><img src="resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg"></div>
                <p>[ 지역 ] 캠핑장이름</p>
            </div>
            <div class="new-camping-content">
                <div><img src="resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg"></div>
                <p>[ 지역 ] 캠핑장이름</p>
            </div>
            <div class="new-camping-content">
                <div><img src="resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg"></div>
                <p>[ 지역 ] 캠핑장이름</p>
            </div>
        </div>

        <div class="hr-sect">캠핑장 랭킹</div>
        <div class="rank-camping-wrap">
            <div class="rank-camping">
                <div class="rank-content">
                    <div><img src="resources/img/main/best-free-camping-united-states-740x419.jpg"></div>
                    <ul>
                        <li>
                            <p>1&nbsp;</p>고양캠핑장
                        </li>
                        <li>경기도 고양시 고양동</li>
                        <li>★ 5.0</li>
                        <li>58,000원 ~</li>
                    </ul>
                </div>
                <div class="rank-content">
                    <div><img src="resources/img/main/best-free-camping-united-states-740x419.jpg"></div>
                    <ul>
                        <li>
                            <p>2&nbsp;</p>고양캠핑장
                        </li>
                        <li>경기도 고양시 고양동</li>
                        <li>★ 5.0</li>
                        <li>58,000원 ~</li>
                    </ul>
                </div>
                <div class="rank-content">
                    <div><img src="resources/img/main/best-free-camping-united-states-740x419.jpg"></div>
                    <ul>
                        <li>
                            <p>3&nbsp;</p>고양캠핑장
                        </li>
                        <li>경기도 고양시 고양동</li>
                        <li>★ 5.0</li>
                        <li>58,000원 ~</li>
                    </ul>
                </div>
                <div class="rank-content">
                    <div><img src="resources/img/main/best-free-camping-united-states-740x419.jpg"></div>
                    <ul>
                        <li>
                            <p>4&nbsp;</p>고양캠핑장
                        </li>
                        <li>경기도 고양시 고양동</li>
                        <li>★ 5.0</li>
                        <li>58,000원 ~</li>
                    </ul>
                </div>
                <div class="rank-content">
                    <div><img src="resources/img/main/best-free-camping-united-states-740x419.jpg"></div>
                    <ul>
                        <li>
                            <p>5&nbsp;</p>고양캠핑장
                        </li>
                        <li>경기도 고양시 고양동</li>
                        <li>★ 5.0</li>
                        <li>58,000원 ~</li>
                    </ul>
                </div>
                <div class="rank-content">
                    <div><img src="resources/img/main/best-free-camping-united-states-740x419.jpg"></div>
                    <ul>
                        <li>
                            <p>6&nbsp;</p>고양캠핑장
                        </li>
                        <li>경기도 고양시 고양동</li>
                        <li>★ 5.0</li>
                        <li>58,000원 ~</li>
                    </ul>
                </div>
                <div class="rank-content">
                    <div><img src="resources/img/main/best-free-camping-united-states-740x419.jpg"></div>
                    <ul>
                        <li>
                            <p>7&nbsp;</p>고양캠핑장
                        </li>
                        <li>경기도 고양시 고양동</li>
                        <li>★ 5.0</li>
                        <li>58,000원 ~</li>
                    </ul>
                </div>
                <div class="rank-content">
                    <div><img src="resources/img/main/best-free-camping-united-states-740x419.jpg"></div>
                    <ul>
                        <li>
                            <p>8&nbsp;</p>고양캠핑장
                        </li>
                        <li>경기도 고양시 고양동</li>
                        <li>★ 5.0</li>
                        <li>58,000원 ~</li>
                    </ul>
                </div>
                <div class="rank-content">
                    <div><img src="resources/img/main/best-free-camping-united-states-740x419.jpg"></div>
                    <ul>
                        <li>
                            <p>9&nbsp;</p>고양캠핑장
                        </li>
                        <li>경기도 고양시 고양동</li>
                        <li>★ 5.0</li>
                        <li>58,000원 ~</li>
                    </ul>
                </div>
                <div class="rank-content">
                    <div><img src="resources/img/main/best-free-camping-united-states-740x419.jpg"></div>
                    <ul>
                        <li>
                            <p>10&nbsp;</p>고양캠핑장
                        </li>
                        <li>경기도 고양시 고양동</li>
                        <li>★ 5.0</li>
                        <li>58,000원 ~</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!--<nav>네비게이션 메뉴</nav>
    <div class="all">
        <header>대충 상단</header>
        <main>대충 본문</main>
        <aside>대충 사이드바</aside>
        <footer>대충 푸터</footer>
    </div>-->

    <!--<script>
        function navigo() {
            const header = document.querySelector('header'); //헤더부분획득
            const headerheight = header.clientHeight; //헤더높이
            document.addEventListener('scroll', onScroll, {
                passive: true
            }); //스크롤 이벤트
            function onScroll() {
                const scrollposition = pageYOffset; //스크롤 위치
                const nav = document.querySelector('nav'); //네비게이션
                if (headerheight <= scrollposition) { //만약 헤더높이<=스크롤위치라면
                    nav.classList.add('fix') //fix클래스를 네비에 추가
                } else { //그 외의 경우
                    nav.classList.remove('fix'); //fix클래스를 네비에서 제거
                }
            }

        }
        navigo()
    </script>-->
</body>
</html>