<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/img/main/tent.png" rel="shortcut icon" type="image/x-icon">
<title>캠핑장등록</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
        .wrapper{
            width: 60%;
            margin: 0 auto;
            background-color : white;
        }
        h1{
            text-align: center;
        }
        h2{
        	text-align : center;
        }
        #step{
            height: 200px;
            text-align: center;
        }
        .join{
            width: 100%;
        }
        .jointable{
            margin: 0 auto;
            width: 80%;
        }
        .campimage1,.rentimage,.campenvimage,.camproom{
        	width : 100px;
            height: 100px;
            background-color: #ccc;
            border: 1px solid #848484;
            text-align: center;
        }
        .button{
            text-align: center;
            width: 1000px;
        }
        .button>button{
            width: 300px;
            height: 30px;
        }
        .button{
            margin: 0 auto;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<br><br>
<div class="wrapper" >
<br>
<h1>캠핑장 등록</h1>
<br>
    <div id="step"><img src="/resources/img/camp/step3.png"></div>
    <hr style="border:2px solid black">
    <div class="join">
        <form action="campjoin6.do" method="post" class="jointable" enctype="multipart/form-data">
        <input type="hidden" id="campNo" name="campNo" value="${campNo }" />
        	<br>
            <h2>캠핑장 룸 등록</h2>
            <br>
            <table>
            	<tr>
                    <td style="width: 200px" id="camproomimg">캠핑장 룸 이미지</td>
                    <td>
                        <table>
                            <tr>
                                <td class="camproom" id="image_container">캠핑장 룸 이미지</td>
                            </tr>
                            <tr>
                                <td><input type="file" name="roomimage" accept="image/*" onchange="setThumbnail(event);" multiple></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px" id="roomname">방 이름</td>
                    <td>
                        <table>
                            <tr>
                                <td><input type="text" style="width: 245px; height: 30px;" name="roomName" class="roomname"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px" id="roomaddr">최대 인원 수 </td>
                    <td>
                        <table>
                            <tr>
                                <td><input type="text" style="width: 245px; height: 30px;" name="rooMember" class="roomember" placeholder="ex:4"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px" id="roomPrice">가격</td>
                    <td>
                        <table>
                            <tr>
                                <td><input type="text" style="width: 245px; height: 30px;" name="roomPrice" class="roomprice" placeholder="ex:50000"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br><br>
            <div class="button">
                    <button type="submit" style="font-size: 18px;">다음페이지</button>
                    <button type="reset" style="font-size: 18px;">취소</button>
            </div>
            <br><br>
        </form>
    </div>
</div>
</body>
<script> 
	function setThumbnail(event) { 
		var reader = new FileReader(); 
		reader.onload = function(event) { 
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			document.querySelector("td#image_container").append(img); 
		}; 
		reader.readAsDataURL(event.target.files[0]);
	} 
</script>

</html>