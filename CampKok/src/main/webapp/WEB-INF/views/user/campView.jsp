<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 글자 수 자르기 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/img/main/tent.png" rel="shortcut icon" type="image/x-icon">
<title>${cl.campName }</title>
<style>
.modal-body {
	font-size: 23px;
	color: #405944;
}

.write-btn {
	display: inline-block;
	width: 80px;
	height: 40px;
	font-size: 16px;
	text-align: center;
	background-color: #405944;
	border: 2px solid #405944;
	border-radius: 7px;
	margin-bottom: 10px;
	list-style: none;
	line-height: 40px;
	color: #f2f2f2;
	text-decoration-line: none;
	float: right;
}
</style>

<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!-- 네이버 지도 API -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bxltou71l0&submodules=geocoder"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- Swiper -->
	<div class="swiper-container" style="margin-top: 50px;">
		<div class="swiper-wrapper">
			<c:forEach items="${cl.campFiles }" var="campFile">
				<div class="swiper-slide">
					<!-- 이미지 파일 경로 확인 -->
					<img src="/resources/upload/camp/${campFile.campFilePath }">
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
				<p>
					<span>★ ${cl.campStar }&nbsp;&nbsp;</span>&nbsp;${cl.campAddr }
				</p>
			</div>
			<!-- 기현쓰가 예약버튼 링크 추가 -->

			<c:if test="${!campRoomList.isEmpty() }">
				<c:choose>
					<c:when test="${sessionScope.user.userLevel == 1 }">
						<a href="#" data-toggle="modal" data-target="#myModal">예약하기</a>
					</c:when>
					<c:otherwise>
						<a href="/loginFrm.do" id="rev-no">예약하기</a>
					</c:otherwise>
				</c:choose>
				
				<!--  방 선택 보내기 모달 -->
				<div class="modal" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">캠핑장 룸 선택</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<c:forEach items="${campRoomList }" var="campRoomList"
									varStatus="index">
									<input type="radio"
										style="width: 20px; height: 20px; border: 1px;"
										name="campRoom" value="${campRoomList.roomNo }" />  ${campRoomList.roomName } 
								            <br>- 최대 인원 : ${campRoomList.roomMember } 명
								            <br>- 가격 : ${campRoomList.roomPrice } 원
								            <hr>
								</c:forEach>

							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button class="write-btn" onclick="campReservation();">선택</button>
							</div>

						</div>
					</div>
				</div>
			</c:if>
		</div>
		<div class="camp-naeyong">
			<div class="hr-sect">캠핑장 정보</div>
			<div>
				<table class="camp-tbl">
					<tr>
						<th>전화번호</th>
						<td>${cl.campTel }</td>
						<th>홈페이지</th>
						<td><a href="http://${cl.campSite }">${cl.campSite }</a></td>
					</tr>
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
								<%-- 
                                <ul>
                                	<c:forEach items="${list }" var="cl">
                                   		<li>${cl.campFac }</li>
                                    </c:forEach>
                                </ul> --%>
								<ul>
									<li>${cl.campFac }</li>
								</ul>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<div class="camp-re-no">
				<div>
					<p>
						REVIEW
						<c:choose>
							<c:when test="${sessionScope.user == null }">
								<a href="loginFrm.do" id="blank">more</a>
							</c:when>
							<c:otherwise>
								<a href="/camp/commentFrm.do?userNo=${sessionScope.user.userNo }&campNo=${campNo }">more</a>
							</c:otherwise>
						</c:choose>
					</p>
					<ul>
						<c:forEach items="${crList }" var="cr" begin="0" end="4" step="1">
							<li>
								<c:choose>
									<c:when test="${fn:length(cr.revContents) gt 35}">
									    <c:out value="${fn:substring(cr.revContents, 0, 35)}"/>...
								    </c:when>
								    <c:otherwise>
								    	<c:out value="${cr.revContents }"/>
								    </c:otherwise>
								</c:choose>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div>
					<p>
						NOTICE <a href="/camp/campNotice2.do?reqPage=1">more</a>
					</p>
					<ul>
						<c:forEach items="${cnList }" var="cn" begin="0" end="4" step="1">
							<li>${cn.campNoticeTitle }</li>
						</c:forEach>
					</ul>
				</div>
			</div>

			<div class="hr-sect">찾아오시는 길</div>
			<div>
				<p id="address">${cl.campAddr }</p>
				<div id="map"
					style="width: 1140px; height: 400px; border: 1px solid"></div>
			</div>

		</div>

	</div>


	<script>
     function campReservation() {
    	var campRoom = document.getElementsByName("campRoom");
    	console.log(campRoom);
        var radio_btn = document.getElementsByName("radio_btn");
        
        //라디오 버튼이 체크되었나 확인하기 위한 변수
        var campRoom_check = 0;
        for(var i = 0; i<campRoom.length; i++){
            //만약 라디오 버튼이 체크가 되어있다면 true
            if(campRoom[i].checked==true){
                //라디오 버튼 값
                //라디오 버튼이 체크되면 radio_btn_check를 1로 만들어준다.
                campRoom_check++;
    			$.ajax({
    				url : "/camp/campReservation.do",
    				data : {
    					roomNo : campRoom[i].value
    				},
    				type : "post",
     				success : function(data) {
     					if (data != null) {
    						location.href = 'camp/reservationPage.do?roomNo='+data.roomNo;
    					} 
    				} 
    			});
            }
        }

    } 
    
        window.onload = function() {
        	let campAddr = '${cl.campAddr}'
        	
        	naver.maps.Service.geocode({
		        query: campAddr // String 타입의 주소값
		    }, function(status, response) {
		        if (status !== naver.maps.Service.Status.OK) {
		            // 실행이 되지 않을 경우 
                    return alert('Something wrong!');
                    
		        }
				
                // 제대로 된 query가 들어가 결과가 나올 경우 
		        var result = response.v2, // 검색 결과의 컨테이너
		            items = result.addresses; // 검색 결과의 배열
				/* alert(items[0].x+', '+items[0].y+', '+typeof items[0].x+', '+typeof items[0].y); */
		            
		        
		    	//지도에 마커찍기 
		    	let x = parseFloat(items[0].x); // 경도
		    	let y = parseFloat(items[0].y); // 위도 
		    	
		    	
                // 지도 띄우기 
		    	var map = new naver.maps.Map('map', {
		    	    center: new naver.maps.LatLng(y, x),
		    	    zoom: 19,
		    	    zoomControl: true, //지도 확대,축소 컨트롤러
	                zoomControlOptions: {
	                    position: naver.maps.Position.TOP_RIGHT, //컨트롤러 위치 설정 (우측상단)
	                    style: naver.maps.ZoomControlStyle.SMALL //컨트롤러 크기 설정 (작게)
	                }
		    	});
				
                // 마커 찍기 
		    	var marker = new naver.maps.Marker({
		    	    position: new naver.maps.LatLng(y, x),
		    	    map: map
		    	});
		
		    	// 최초 중심지 주소
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
                
                
		    });
        	

        }
        
        $('#blank').click(function() {
			alert("리뷰조회는 로그인 후 이용가능합니다.");
		});
        
        $('#rev-no').click(function() {
			alert("로그인 후 예약이 가능합니다.");
		});
        
    </script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />


	<!-- Swiper -->
	<link rel="stylesheet"
		href="https://unpkg.com/swiper/swiper-bundle.css">
	<link rel="stylesheet"
		href="https://unpkg.com/swiper/swiper-bundle.min.css">

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

input[type=radio]:checked {
	background-color: #405944;
	color: #405944;
}
</style>
</body>
</html>