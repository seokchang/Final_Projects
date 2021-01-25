<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/img/main/tent.png" rel="shortcut icon" type="image/x-icon">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="/resources/css/camp/comment3.css"> -->
<style>
.whole{
	width:1500px;
	height:100%;
	margin:0 auto;
}
	.wrap{
		width : 400px;
		height : 600px;
		display: inline-block;
		margin-left:65px;
		margin-top:30px;
		border:5px solid #5a7356;
	}
	.head{
		/* border:1px solid red; */
		width : 100%;
		height : 150px;
	}
	.contents{
		/* border:1px solid red; */
		width : 100%;
		height : 450px;
	}
	.comment{
		width:80%;
		height:95%;
		margin:0 auto;
		/* border:1px solid black; */
	}
	.headL{
		/* border:1px solid black; */
		width:145px;
		height:100%;
		float:left;
	}
	.headR{
		/* border:1px solid black; */
		width:250px;
		height:100%;
		float:right;
	}
	li{
		list-style:none;
	}
	#review{
		border:3px solid #5a7356;
		border-radius: 1em;
		border-top-left-radius: 1em;
		border-top-right-radius: 1em;
		border-bottom-left-radius: 1em;
		border-bottom-right-radius: 1em;
		width:315px;
		height:425px;
		resize:none;
	}
	textarea:focus{
		outline:none;
	}
	#aa{
		color:red;
		margin-left:150px;
	}
	.inputComment{
		background-color: #5a7356;
	}
	.inputComment>form{
			margin: 0 auto;
	}
	.inputComment>form>ul{
		display: flex;
		justify-content: space-around;
		padding: 10px;
		margin-left:250px;
	}
	.inputComment textarea{
		height:100px;
		margin-left:100px;
		width:85%;	
		resize: none;
	}	
	.inputComment>form>ul>li:first-child{
		list-style:none;
		width: 70%;		
	}
	.inputComment>form>ul>li:last-child{
		list-style:none;
		width: 30%;		
	}
	.page-title {
		font-size: 40px;
		margin-left:150px;
		font-weight: bold;
		color: #f3d479;
	}
	#btn{
		margin-top:60px;
		width:100px;
		height:50px;
		font-weight: bold;
		font-size: 20px;
		color:#405944;
		background-color:#f3d479;
		border:4px solid #f3d479;
		border-radius: 1em;
		border-top-left-radius: 1em;
		border-top-right-radius: 1em;
		border-bottom-left-radius: 1em;
		border-bottom-right-radius: 1em;
		outline:0;
		cursor:pointer;
	}
	#back{
		width:100px;
		height:100px;
		font-weight: bold;
		font-size: 20px;
		color:#405944;
		background-color:#f3d479;
		border:4px solid #f3d479;
		border-radius: 1em;
		border-top-left-radius: 1em;
		border-top-right-radius: 1em;
		border-bottom-left-radius: 1em;
		border-bottom-right-radius: 1em;
		outline:0;
		cursor:pointer;
	}
	.star-wrap{
		margin-left: 100px;
		margin-bottom: 5px;
	}
	
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="inputComment">
	<span id="aa">*일반이용자만 댓글등록이 가능합니다.</span>
		<div class="page-title">
            | Review
        </div>
		<form action="/camp/insertComment.do" method="post" accept-charset="utf-8">
			<ul>
				<li>
					<input type="hidden" name="userId" value="${sessionScope.user.userId }">
					<input type="hidden" id="campNo" name="campNo" value="${campNo }">
										<div class="star-wrap">
						 <img class="star" src="/resources/img/camp/star-off2.png" style="width: 30px; height: 30px;"> 
						 <img class="star" src="/resources/img/camp/star-off2.png" style="width: 30px; height: 30px;"> 
						 <img class="star" src="/resources/img/camp/star-off2.png" style="width: 30px; height: 30px;"> 
						 <img class="star" src="/resources/img/camp/star-off2.png" style="width: 30px; height: 30px;"> 
						 <img class="star" src="/resources/img/camp/star-off2.png" style="width: 30px; height: 30px;"> 
						<!--  <span id="result"></span>  -->
						 <input type="hidden" name="revStar">
					</div>
					<textarea name="revContents"></textarea>
				</li>
				<%-- <c:if test="${userInfo.userLevel eq '1'}"> --%>
				<li>				
					<input type="submit" value="등록" id="btn">
					<input type="button" value="뒤로가기" id="btn" onclick="history.back(-1);">			
				</li>	
				<%-- </c:if>		 --%>
			</ul>
		</form>	
</div>




<div class="whole">
<c:forEach items="${commentList }" var="commentList">
	<div class="wrap">
		<div class="head">
			<div class="headL">
				<img src="/resources/img/camp/people.png" style="width:90%; height:90%;" align="right">
			</div>
			<div class="headR">
				<ul>
					<li style="font-size:40px; color:#405944">${commentList.userId }</li>
					<li style="color:#405944">${commentList.revDate }</li>
					<c:forEach begin="1" end="${commentList.revStar }">
									<img src="/resources/img/customer/star-on.png">
								</c:forEach>
					<c:if test="${commentList.userId eq sessionScope.user.userId }">
							<li><a href="/camp/commentDelete.do?revNo=${commentList.revNo }&campNo=${campNo }" style="font-weight:1000; color:#f2542f">삭제</a></li>
					</c:if>
					<!-- <li style="font-weight:1000; color:#f2542f">삭제</li> -->
				</ul>
			</div>
		</div>
		<div class="contents">
			<div class="comment">
				<textarea style="font-size:20px;" id="review"readonly>${commentList.revContents }</textarea>
			</div>
		</div>
	</div>
</c:forEach>	
	
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />



<script>
        $(function() {
            $(".star").mouseover(function() {
                var over = $(".star").index(this);
                $(".star").each(function(idx, item){
                   if(idx<=over)
                        $(item).attr("src","/resources/img/customer/star-on2.png");

                    else
                        $(item).attr("src","/resources/img/camp/star-off2.png"); 
                });

            });


            $(".star").click(function() {
                var click = $(".star").index(this);
                $("#result").html((click+1));
                $("[name=revStar]").val((click+1));
            });
        });
    </script>







</body>
</html>