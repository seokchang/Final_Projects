<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/camp/comment.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- userInfo : no,�̸�,����,������Ʈ 
		          : ȭ�� �Ѿ�ö� ķ���� no�޾ƾ���
	-->
	<div class="inputComment">
	<span>*�Ϲ��̿��ڸ� ��۵���� �����մϴ�.</span>
		<form action="/camp/insertComment.do" method="post" accept-charset="utf-8">
			<ul>
				<li>
					<input type="hidden" name="userId" value="${userInfo.userId }">
					<input type="hidden" name="campNo" value="26">
					<textarea name="revContents"></textarea>
				</li>
				<c:if test="${userInfo.userLevel eq '1'}">
				<li>				
					<input type="submit" value="���"></input>					
				</li>	
				</c:if>		
			</ul>
		</form>	
	</div>
	<div class="commentList">
		<c:forEach items="${commentList }" var="commentList">
			<ul>
				<li>
					<p>${commentList.userId }</p>
					<p>${commentList.revDate }</p>
				</li>
				<li>
					<p class="linkbox">
						<textarea name="noticeCommentContet">${commentList.revContents }</textarea>
						<!-- user01�κ� ���Ǿ��̵�� �ٲ���� -->
						<c:if test="${commentList.userId eq 'user01'}">
							<a href="#" >����</a>
							<a href="#" >����</a>
						</c:if>
						<!-- 1(��)�κ� 2(�����)�ιٲ���� -->
						<c:if test="${userInfo.userLevel eq '1'}">
							<a href="javascript:void(0)" class="recShow">��۴ޱ�</a>
						</c:if>						
					</p>
					<div class="inputComment re">
						<form action="/camp/insertCommentRe.do" method="post" accept-charset="utf-8">
							<ul>
								<li>
									<input type="hidden" name="" value="${userInfo.userId }">
									<input type="hidden" name="" value="${commentList.revNo }">
									<textarea class="form-control" name="noticeCommentContent"></textarea>
								</li>
								<li>
									<button type="submit" class="btn btn-secondary btn-sm btn-black">���</button>
									<button type="button" class="btn btn-secondary btn-sm btn-black recCancel">���</button>
									</li>
							</ul>
						</form>
					</div>		
				</li>
			</ul>
		</c:forEach>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	$(".recShow").click(function(){
		$(this).hide();
		var idx = $(".recShow").index(this);
		$(".recCancel").eq(idx).parents("div").css("display","block");
	});
	
	$(".recCancel").click(function(){			
		var idx = $(".recCancel").index(this);
		$(this).parents(".re").css("display","none");
		$(".recShow").eq(idx).show();
	});
	</script>
</body>
</html>