<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart Page</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>

<body>
	<div class="wrap">
		<div class="header-wrap">
			<jsp:include page="/WEB-INF/views/admin/commons/adminHeader.jsp" />
		</div>

		<div class="content-wrap">
			<!-- Navi -->
			<div class="content-navi">
				<jsp:include page="/WEB-INF/views/admin/commons/adminNavi.jsp" />
			</div>

			<!-- Main -->
			<div class="content-main">
				<ul class="todo">
					<li style="background-color: #f3d479; color: #bf372b;"><strong>작업 리스트</strong></li>
					<li><a href="#">신규등록 신청 <span class="count">1</span></a></li>
				</ul>
				<div class="content-list">
					<div id="chart-visitor">
						<h3>방문자 수</h3>
					</div>
					<div id="chart-gender">
						<h3>
							<a href="/getUserGenderRatio.do">회원 성별 비율</a>
						</h3>
						<div id="donutchart" style="width: 100%; height: 350px;"></div>
					</div>
					<div id="client-notice" style="background-color: yellow;"></div>
					<div id="ceo-notice" style="background-color: green;"></div>
					<div id="camp-info" style="background-color: blue;"></div>
					<div id="board" style="background-color: navi;"></div>
				</div>
			</div>

			<!-- Profile -->
			<div class="content-profile">
				<ul class="profile-wrap">
					<li><img alt="Admin Photo" src="/resources/img/admin/main_img4.jpg"></li>
					<li class="profile">
						<table id="profile">
							<tr>
								<th>아이디</th>
								<td>
									<input type="text" name="userId" value="admin" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>
									<input type="text" name="userName" value="홍길동" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>
									<input type="text" name="phone" value="010-1234-5678" readonly="readonly">
								</td>
							</tr>
						</table>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<link rel="stylesheet" href="/resources/css/admin/adminDesignCommon.css">
	<link rel="stylesheet" href="/resources/css/admin/admin.css">

	<style>
h3 {
	color: #fff;
}
</style>

	<script type="text/javascript">
		google.charts.load("current", {
			packages : [ "corechart" ]
		});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
					[ 'UserRatio', 'Number' ], ${genderRatio} ]);

			var options = {
				title : 'User Gender Ratio',
				pieHole : 0.4,
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('donutchart'));
			chart.draw(data, options);
		}
	</script>
</body>
</html>



