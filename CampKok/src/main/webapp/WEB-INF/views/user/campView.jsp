<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- Swiper -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

    <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- 네이버 지도 API -->
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bxltou71l0&submodules=geocoder"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- Swiper -->
    <div class="swiper-container" style="margin-top: 50px;">
        <div class="swiper-wrapper">
        	<c:forEach items="${cl.campFiles }" var="campFile">
	            <div class="swiper-slide">
	                <img src="/resources/img/camp/${campFile.campFilePath }">
	            </div>
        	</c:forEach>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
    </div>

    <!-- Swiper JS -->
    <script src="../package/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper('.swiper-container', {
            spaceBetween: 30,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
        });
    </script>


    <div class="camp-content">
        <div class="camp-title">
            <div>
                <p>${cl.campName }</p>
                <p><span>★ ${cl.campStar } </span> ${cl.campAddr }</p>
            </div>
            <a href="#">예약하기</a>
        </div>
        <div class="camp-naeyong">

            <div class="hr-sect">캠핑장 정보</div>
            <div>
                <table class="camp-tbl">
                    <tr>
                        <th>테마</th>
                        <td>${cl.campTheme }</td>
                        <th>카테고리</th>
                        <td>${cl.campCtg }</td>
                    </tr>
                    <tr>
                        <th>시설</th>
                        <td colspan="3">
                            <div style="display: flex">
                                <ul>
                                	<c:forEach items="${list }" var="cl">
                                   		<li>${cl.campFac }</li>
                                    </c:forEach>
                                </ul>
                                <ul>
                                    <li>${cl.campFac }</li>
                                    <li>test</li>
                                    <li>test</li>
                                    <li>test</li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="camp-re-no">
                <div>
                    <p>REVIEW <a href="#">more</a></p>
                    <ul>
                        <li><a href="#">너무 조아용</a></li>
                        <li><a href="#">너무 조아용</a></li>
                        <li><a href="#">너무 조아용</a></li>
                        <li><a href="#">너무 조아용</a></li>
                        <li><a href="#">너무 조아용</a></li>
                    </ul>
                </div>
                <div>
                    <p>NOTICE <a href="#">more</a></p>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">공지공지공지지지</a></li>
                        <li><a href="#">공지공지공지지지</a></li>
                        <li><a href="#">공지공지공지지지</a></li>
                        <li><a href="#">공지공지공지지지</a></li>
                    </ul>
                </div>
            </div>

            <div class="hr-sect">찾아오시는 길</div>
            <div>
                <p id="address">경기도 고양시 고양구</p>
                <div id="map" style="width: 1140px; height: 400px;border: 1px solid"></div>
            </div>
        </div>

    </div>

    <script>
        window.onload = function() {

            //div id="map"에 네이버 지도를 넣어줘..
            //var map = new naver.maps.Map("map")
            //아무 값도 지정하지 않고 지도객체를 불러오면 서울 시청을 중심으로 불러와짐
            var map = new naver.maps.Map("map", {
                center: new naver.maps.LatLng(37.533801, 126.896772), //지도 중심좌표 설정
                zoom: 17, //지도 확대해서 보여주는 설정
                zoomControl: true, //지도 확대,축소 컨트롤러
                zoomControlOptions: {
                    position: naver.maps.Position.TOP_RIGHT, //컨트롤러 위치 설정 (우측상단)
                    style: naver.maps.ZoomControlStyle.SMALL //컨트롤러 크기 설정 (작게)
                }
            });

            //마커 추가(내위치 표시하는 파란 표시)
            var marker = new naver.maps.Marker({
                position: new naver.maps.LatLng(37.533801, 126.896772), //마커위치
                map: map //어떤 지도에 마커를 추가할지 설정
            });

            //지도에 클릭이벤트 추가
            naver.maps.Event.addListener(map, "click", function(e) {
                //클릭한 곳으로 마커 이동
                //e.coord : 클릭한 위치의 위경도 값
                marker.setPosition(e.coord);

                //정보창이 열린 상태로 이동하면 닫아주기
                if (infoWindow != null) {
                    if (infoWindow.getMap()) {
                        infoWindow.close();
                    }
                }

                //위치! 클릭함수 안에
                //위경도 좌표를 주소로 가져오는 기능 reverseGeocode -> submodule추가
                naver.maps.Service.reverseGeocode({
                    location: new naver.maps.LatLng(e.coord.lat(), e.coord.lng()), //위경도 좌표를 이용해서 주소 요청

                }, function(status, response) {
                    //오류일 때
                    if (status != naver.maps.Service.Status.OK) {
                        return alert("주소검색오류");
                    }
                    //정상일 때
                    var result = response.result;
                    var items = result.items; //json형태로 주소값을 가지고 옴
                    var address = items[1].address; //[0]지번, [1]도로명
                    contentString = [
                        '<div class="iw_inner">',
                        '	<p>' + address + '</p>',
                        '</div>'
                    ].join('');
                });

            });

            //최초 중심지 주소
            var contentString = [
                '<div class="iw_inner" style="padding:10px;">',
                '	<h4>${cl.campName }</h4>',
                '	<p>${cl.campAddr }</p>',
                '</div>'
            ].join('');

            var infoWindow = new naver.maps.InfoWindow();
            naver.maps.Event.addListener(marker, 'click', function(e) {
                if (infoWindow.getMap()) { //현재 정보창이 열려있으면
                    infoWindow.close(); //열려있는 정보창 닫기
                } else {
                    infoWindow = new naver.maps.InfoWindow({
                        content: contentString
                    });
                    infoWindow.open(map, marker);
                }
            });

        }
    </script>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <link rel="stylesheet" href="/resources/css/user/campView.css">
<style>
	

/* Swiper */
.swiper-container {
	width: 1200px;
	height: 700px;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide>img {
	width: 100%;
}

:root { -
	-swiper-theme-color: #405944;
}
</style>
</body>
</html>