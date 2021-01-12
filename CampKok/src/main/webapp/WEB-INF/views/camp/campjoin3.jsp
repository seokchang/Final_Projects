<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
         body{
            width: 60%;
            margin: 0 auto;
        }
        h1{
            text-align: center;
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
        .campimage,.rentimage,.campenvimage{
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
<h1>캠핑장 등록</h1>
    <div id="step"><img src="step2.png"></div>
    <hr style="border:2px solid black">
    <div class="join">
        <form action="campjoin3.do" method="post" class="jointable">
            <table>
                <tr>
                    <td style="width: 200px" name="campimg">캠핑장 이미지</td>
                    <td>
                        <table>
                            <tr>
                                <td class="campimage">캠핑장 이미지</td>
                                <td class="campimage">캠핑장 이미지</td>
                                <td class="campimage">캠핑장 이미지</td>
                            </tr>
                            <tr>
                                <td><input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple></td>
                                <td><input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple></td>
                                <td><input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <br><br>
                <tr>
                    <td style="width: 200px" name="rentimg">대여품 이미지</td>
                    <td>
                        <table>
                            <tr>
                                <td class="rentimage">대여품 이미지</td>
                                <td class="rentimage">대여품 이미지</td>
                                <td class="rentimage">대여품 이미지</td>
                            </tr>
                            <tr>
                                <td><input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple></td>
                                <td><input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple></td>
                                <td><input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px" name="rentname">대여품 이름</td>
                    <td>
                        <table>
                            <tr>
                                <td><input type="text" style="width: 245px; height: 30px;" id="rentname" class="rentname" placeholder="ex:숯불"></td>
                                <td><input type="text" style="width: 245px; height: 30px;" id="rentname" class="rentname"></td>
                                <td><input type="text" style="width: 245px; height: 30px;" id="rentname" class="rentname"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px" name="rentprice">대여품 가격</td>
                    <td>
                        <table>
                            <tr>
                                <td><input type="text" style="width: 245px; height: 30px;" id="rentprice" class="rentprice" placeholder="ex:5,000원"></td>
                                <td><input type="text" style="width: 245px; height: 30px;" id="rentprice" class="rentprice"></td>
                                <td><input type="text" style="width: 245px; height: 30px;" id="rentprice" class="rentprice"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px" name="rentcontents">대여품 내용</td>
                    <td>
                        <table>
                            <tr>
                                <td><input type="text" style="width: 245px; height: 30px;" id="rentcontents" class="rentcontents" placeholder="숯불 10개"></td>
                                <td><input type="text" style="width: 245px; height: 30px;" id="rentcontents" class="rentcontents"></td>
                                <td><input type="text" style="width: 245px; height: 30px;" id="rentcontents" class="rentcontents"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px" name="campenvimg">주변관광지</td>
                    <td>
                        <table>
                            <tr>
                                <td class="campenvimage">주변관광지 이미지</td>
                                <td class="campenvimage">주변관광지 이미지</td>
                                <td class="campenvimage">주변관광지 이미지</td>
                            </tr>
                            <tr>
                                <td><input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple></td>
                                <td><input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple></td>
                                <td><input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px" name="envname">관광지 이름</td>
                    <td>
                        <table>
                            <tr>
                                <td><input type="text" style="width: 245px; height: 30px;" id="envname" class="envname" placeholder="ex:00폭포"></td>
                                <td><input type="text" style="width: 245px; height: 30px;" id="envname" class="envname"></td>
                                <td><input type="text" style="width: 245px; height: 30px;" id="envname" class="envname"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px" name="envaddr">관광지 주소</td>
                    <td>
                        <table>
                            <tr>
                                <td><input type="text" style="width: 245px; height: 30px;" id="envaddr" class="envaddr" placeholder="강원시 정선군 여량면"></td>
                                <td><input type="text" style="width: 245px; height: 30px;" id="envaddr" class="envaddr"></td>
                                <td><input type="text" style="width: 245px; height: 30px;" id="envaddr" class="envaddr"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 200px" name="envtel">관광지 전화번호</td>
                    <td>
                        <table>
                            <tr>
                                <td><input type="text" style="width: 245px; height: 30px;" id="envtel" class="envtel" placeholder="000-000-0000"></td>
                                <td><input type="text" style="width: 245px; height: 30px;" id="envtel" class="envtel"></td>
                                <td><input type="text" style="width: 245px; height: 30px;" id="envtel" class="envtel"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br><br>
            <div class="button">
                    <button type="submit" style="font-size: 18px;">회원가입</button>
                    <button type="reset" style="font-size: 18px;">취소</button>
            </div>
        </form>
    </div>
</body>
</html>