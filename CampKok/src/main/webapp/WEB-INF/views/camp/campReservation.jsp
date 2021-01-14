<!-- ***********************************************
					諺廃 超鍵希 ばばばばばばばばばば
 *********************************************** -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<!DOCTYPE html>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%-- <%@ page contentType="text/html; charset=utf-8"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
Calendar cal = Calendar.getInstance();
String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);
if(strYear != null)
{
  year = Integer.parseInt(strYear);
  month = Integer.parseInt(strMonth);
}else{
}

//鰍亀/杉 実特
cal.set(year, month, 1);
int startDay = cal.getMinimum(java.util.Calendar.DATE);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
int newLine = 0;

//神潅 劾促 煽舌.
Calendar todayCal = Calendar.getInstance();
SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
%>

<html>

<head>
<meta charset="EUC-KR">
<title>跳芭舌 森鉦</title>
<link rel="stylesheet" href="/resources/css/camp/reservation.css">

<script type="text/javaScript" language="javascript"></script>
<style TYPE="text/css">
body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
}

td {
	font-family: "妓崇";
	font-size: 9pt;
	color: #595959;
}

th {
	font-family: "妓崇";
	font-size: 9pt;
	color: #000000;
}

select {
	font-family: "妓崇";
	font-size: 9pt;
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

A:link {
	font-size: 9pt;
	font-family: "妓崇";
	color: #000000;
	text-decoration: none;
}

A:visited {
	font-size: 9pt;
	font-family: "妓崇";
	color: #000000;
	text-decoration: none;
}

A:active {
	font-size: 9pt;
	font-family: "妓崇";
	color: red;
	text-decoration: none;
}

A:hover {
	font-size: 9pt;
	font-family: "妓崇";
	color: red;
	text-decoration: none;
}
</style>
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<body>
	
	<!-- <div class="re-wrap">
		<h3>跳芭舌 森鉦</h3>
	<div class="reservation">	
	</div>
	</div> -->
	<form name="calendarFrm" id="calendarFrm" action="" method="post">
	<DIV id="content" style="width: 712px;">
		<table width="100%" border="0" cellspacing="1" cellpadding="1">
			<tr>

				<td align="right"><input type="button"
					onclick="javascript:location.href='<c:url value='/CalendarExam2.jsp' />'"
					value="神潅" /></td>
			</tr>
		</table>

		<!--劾促 革搾惟戚芝  -->

		<table width="100%" border="0" cellspacing="1" cellpadding="1"
			id="KOO" bgcolor="#F3F9D7" style="border: 1px solid #CED99C">



			<tr>
				<td height="60">



					<table width="100%" border="0" cellspacing="0" cellpadding="0">

						<tr>

							<td height="10"></td>

						</tr>



						<tr>

							<td align="center"><a
								href="<c:url value='/CalendarExam2.jsp' />?year=<%=year-1%>&amp;month=<%=month%>"
								target="_self"> <b>&lt;&lt;</b>
								<!-- 戚穿背 -->

							</a> <%if(month > 0 ){ %> <a
								href="<c:url value='/CalendarExam2.jsp' />?year=<%=year%>&amp;month=<%=month-1%>"
								target="_self"> <b>&lt;</b>
								<!-- 戚穿含 -->

							</a> <%} else {%> <b>&lt;</b> <%} %> &nbsp;&nbsp; <%=year%>鰍 <%=month+1%>杉

								&nbsp;&nbsp; <%if(month < 11 ){ %> <a
								href="<c:url value='/WEB-INF/views/camp/campReservation.jsp' />?year=<%=year%>&amp;month=<%=month+1%>"
								target="_self"> <!-- 陥製含 -->
									<b>&gt;</b>

							</a> <%}else{%> <b>&gt;</b> <%} %> <a
								href="<c:url value='/WEB-INF/views/camp/campReservation.jsp' />?year=<%=year+1%>&amp;month=<%=month%>"
								target="_self"> <!-- 陥製背 -->
									<b>&gt;&gt;</b>

							</a></td>

						</tr>

					</table>



				</td>

			</tr>

		</table>

		<br>

		<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">

			<THEAD>

				<TR bgcolor="#CECECE">

					<TD width='100px'>

						<DIV align="center">
							<font color="red">析</font>
						</DIV>

					</TD>

					<TD width='100px'>

						<DIV align="center">杉</DIV>

					</TD>

					<TD width='100px'>

						<DIV align="center">鉢</DIV>

					</TD>

					<TD width='100px'>

						<DIV align="center">呪</DIV>

					</TD>

					<TD width='100px'>

						<DIV align="center">鯉</DIV>

					</TD>

					<TD width='100px'>

						<DIV align="center">榎</DIV>

					</TD>

					<TD width='100px'>

						<DIV align="center">
							<font color="#529dbc">塘</font>
						</DIV>

					</TD>

				</TR>

			</THEAD>

			<TBODY>

				<TR>

					<%

 

//坦製 朔因空 妊獣

for(int index = 1; index < start ; index++ )

{

  out.println("<TD >&nbsp;</TD>");

  newLine++;

}

 

for(int index = 1; index <= endDay; index++)

{

       String color = "";

 

       if(newLine == 0){          color = "RED";

       }else if(newLine == 6){    color = "#529dbc";

       }else{                     color = "BLACK"; };

 

       String sUseDate = Integer.toString(year); 

       sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);

       sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);

 

       int iUseDate = Integer.parseInt(sUseDate);

      

      

       String backColor = "#EFEFEF";

       if(iUseDate == intToday ) {

             backColor = "#c9c9c9";

       }

       out.println("<TD valign='top' align='left' height='92px' bgcolor='"+backColor+"' nowrap>");

       %>

					<font color='<%=color%>'> <%=index %>

					</font>



					<%

      

       out.println("<BR>");

       out.println(iUseDate);

       out.println("<BR>");

      

      

       //奄管 薦暗 

       out.println("</TD>");

       newLine++;

 

       if(newLine == 7)

       {

         out.println("</TR>");

         if(index <= endDay)

         {

           out.println("<TR>");

         }

         newLine=0;

       }

}

//原走厳 因空 LOOP

while(newLine > 0 && newLine < 7)

{

  out.println("<TD>&nbsp;</TD>");

  newLine++;

}

%>

				</TR>



			</TBODY>

		</TABLE>

	</DIV>

	</form>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>