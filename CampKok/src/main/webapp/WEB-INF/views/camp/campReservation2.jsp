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
    	<h4>ķ���� ����</h4>
    	<table>
    		<tr>
    			<th>ȸ����</th>
    			<th>��������</th>
    		</tr>
    		<tr>
    			<th>ķ�����</th>
    			<th>${campInfo.campName }</th>
    		</tr>
    		<tr>
    			<th>���̸�</th>
    			<th>${campRoomInfo.roomName }</th>
    		</tr>
    		<tr>
    			<th>�����ο�</th>
    			<th>${campRoomInfo.roomMember }</th>
    		</tr>
    		<tr>
    			<th>��,��ǽð�</th>
    			<th>15:00 / 11:00(����)</th>
    		</tr> 		
    	</table> 
    	<hr>
		<h4>���� ����</h4>
		<form action="/camp/campRes.do">  			
			<input type="hidden" name="userNo" value="2"> <!-- �α��μ���������� -->			
			<input type="hidden" name="campNo" value="${campInfo.campNo }">
			<input type="hidden" name="campRoomNo" value="${campRoomInfo.roomNo }">
			<table>			
				<tr>
					<th>��¥����</th>
					<th>�Խ� : <input type="date" name="resInDate" id="sdate" min=""></th>
					<th>��� : <input type="date" name="resOutDate" id="edate" min=""></th>
				</tr>
				<tr>
					<th>�ο���</th>
					<th><input type=text name=amount value=2>
						<input type=button value="+" id="countPlus" onClick="javascript:this.form.amount.value++;">
						<input type=button value="-" id="countMinus"onClick="javascript:this.form.amount.value--;">
						<br><span style="font-size:10px;">*�����ο� �ʰ��� 1�δ� 5,000���� �߰������ �߻��մϴ�.</span>
						
					</th>
				</tr>
				<tr>
					<th>���</th>
					<th><input type="text" name="resMemo" placeholder="�Ⱦ� ��Ź����� :)"></th>
				</tr>
			</table>
			<input type="submit" value="�����ϱ�">
		</form>
		<hr>
    	<h4>���� ����</h4>
    	<table>
    		<tr>
    			<th>�����ݾ�</th>
    			<th id="price">${campRoomInfo.roomPrice }</th>
    		</tr>
    		<tr>
    			<th>����Ʈ ��뿩��</th>
    			<th>test</th>
    		</tr>
    		<tr>
    			<th><br><input type="button" value="�����ϱ�"></th>
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
    
    //calendar �׸���
    function drawCalendar(){
        var setTableHTML = "";
        setTableHTML+='<table class="calendar">';
        setTableHTML+='<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
        for(var i=0;i<6;i++){
            setTableHTML+='<tr height="100">';
            for(var j=0;j<7;j++){
            	//����� room Ķ���� ǥ��
            	if(i==4 && j==5){
            		 setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap; border:1px solid #d9bd6a;">';
                     setTableHTML+='    <div class="cal-day"></div>';
                     setTableHTML+='    <div class="cal-schedule"><span id="test">room1����Ϸ�</span><br><span id="test">room3������</span></div>';
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
 
    //��¥ �ʱ�ȭ
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
    
    //calendar ��¥ǥ��
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
 
    //calendar �� �̵�
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
    
    //��¥ ���� ���ñ������� ���� üũ �Ұ�
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