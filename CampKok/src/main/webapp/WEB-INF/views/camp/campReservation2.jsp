<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<br>
	<div class="cal_top">
        <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
        <span id="cal_top_year"></span>
        <span id="cal_top_month"></span>
        <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
    </div>
    <div id="cal_tab" class="cal">
    </div>
    <div class="reservationInfo">
    	<h4>캠핑장 정보</h4>
    	<table>
    		<tr>
    			<th>회원명</th>
    			<th>세션정보</th>
    		</tr>
    		<tr>
    			<th>캠핑장명</th>
    			<th>${campInfo.campName }</th>
    		</tr>
    		<tr>
    			<th>방이름</th>
    			<th>${campRoomInfo.roomName }</th>
    		</tr>
    		<tr>
    			<th>기준인원</th>
    			<th>${campRoomInfo.roomMember }</th>
    		</tr>
    		<tr>
    			<th>입,퇴실시간</th>
    			<th>15:00 / 11:00(익일)</th>
    		</tr> 		
    	</table> 
    	<hr>
		<h4>예약 정보</h4>
		<form action="/camp/campRes.do">  			
			<input type="hidden" name="userNo" value="2"> <!-- 로그인세션정보담기 -->			
			<input type="hidden" name="campNo" value="${campInfo.campNo }">
			<input type="hidden" name="campRoomNo" value="${campRoomInfo.roomNo }">
			<table>			
				<tr>
					<th>날짜선택</th>
					<th>입실 : <input type="date" name="resInDate" id="sdate" min=""></th>
					<th>퇴실 : <input type="date" name="resOutDate" id="edate" min=""></th>
				</tr>
				<tr>
					<th>인원수</th>
					<th><input type=text name=amount value=2>
						<input type=button value="+" id="countPlus" onClick="javascript:this.form.amount.value++;">
						<input type=button value="-" id="countMinus"onClick="javascript:this.form.amount.value--;">
						<br><span style="font-size:10px;">*기준인원 초가시 1인당 5,000원의 추가요금이 발생합니다.</span>
						
					</th>
				</tr>
				<tr>
					<th>비고</th>
					<th><input type="text" name="resMemo" placeholder="픽업 부탁드려요 :)"></th>
				</tr>
			</table>
			<input type="submit" value="예약하기">
		</form>
		<hr>
    	<h4>결제 정보</h4>
    	<table>
    		<tr>
    			<th>결제금액</th>
    			<th id="price">${campRoomInfo.roomPrice }</th>
    		</tr>
    		<tr>
    			<th>포인트 사용여부</th>
    			<th>test</th>
    		</tr>
    		<tr>
    			<th><br><input type="button" value="결제하기"></th>
    		</tr>   		
    	</table> 
    </div>
 
<script type="text/javascript">
    
    var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
 
    $(document).ready(function() {
        drawCalendar();
        initDate();
        drawDays();
        $("#movePrevMonth").on("click", function(){movePrevMonth();});
        $("#moveNextMonth").on("click", function(){moveNextMonth();});
    });
    
    //calendar 그리기
    function drawCalendar(){
        var setTableHTML = "";
        setTableHTML+='<table class="calendar">';
        setTableHTML+='<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
        for(var i=0;i<6;i++){
            setTableHTML+='<tr height="100">';
            for(var j=0;j<7;j++){
            	//예약된 room 캘린더 표시
            	if(i==4 && j==5){
            		 setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap; border:1px solid #d9bd6a;">';
                     setTableHTML+='    <div class="cal-day"></div>';
                     setTableHTML+='    <div class="cal-schedule"><span id="test">room1예약완료</span><br><span id="test">room3예약대기</span></div>';
                     setTableHTML+='</td>';
            	}else{
            		 setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap; border:1px solid #d9bd6a;">';
                     setTableHTML+='    <div class="cal-day"></div>';
                     setTableHTML+='    <div class="cal-schedule"></div>';
                     setTableHTML+='</td>';
            	}
               
            }
            setTableHTML+='</tr>';
        }
        setTableHTML+='</table>';
        $("#cal_tab").html(setTableHTML);
    }
 
    //날짜 초기화
    function initDate(){
        $tdDay = $("td div.cal-day")
        $tdSche = $("td div.cal-schedule")
        dayCount = 0;
        today = new Date();
        year = today.getFullYear();
        month = today.getMonth()+1;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
    }
    
    //calendar 날짜표시
    function drawDays(){
        $("#cal_top_year").text(year);
        $("#cal_top_month").text(month);
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            $tdDay.eq(i).text(++dayCount);
        }
        for(var i=0;i<42;i+=7){
            $tdDay.eq(i).css("color","red");
        }
        for(var i=6;i<42;i+=7){
            $tdDay.eq(i).css("color","blue");
        }
    }
 
    //calendar 월 이동
    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
        }
    
    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
    }

    
    function getNewInfo(){
        for(var i=0;i<42;i++){
            $tdDay.eq(i).text("");
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawDays();
    }
    
    //날짜 선택 오늘기준으로 전날 체크 불가
    $('#sdate').click(function() {            
         var date = new Date(); 
         var yyyy = date.getFullYear(); 
         var mm = date.getMonth()+1>9 ? date.getMonth()+1 : '0' +date.getMonth()+1;
         var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
         if(mm==1){ mm="01"; }
         var today = yyyy+"-"+mm+"-"+dd;
         $('#sdate').attr('min',today);
      });
      
    $('#edate').click(function() {
    	 var sdate=$('#sdate').val();
        /*   var date = new Date(); 
         var yyyy = date.getFullYear(); 
         var mm = date.getMonth()+1>9 ? date.getMonth()+1 : '0' +date.getMonth()+1; 
         var dd = date.getDate() > 9 ? date.getDate()+1 : '0' + date.getDate()+1; 
         { mm="01"; } 
         var today = yyyy+"-"+mm+"-"+dd;*/
         $('#edate').attr('min',sdate); 
      });
    
    $('#countPlus').click(function() {
    	$('#price').text(Number($('#price').text())+5000);
    });
    $('#countMinus').click(function() {
    	$('#price').text(Number($('#price').text())-5000);
    });
    
    
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<link rel="stylesheet" href="/resources/css/camp/reservation.css">
</body>
</html>