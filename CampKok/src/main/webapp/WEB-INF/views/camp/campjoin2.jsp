<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 등록</title>
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
        #ceoid,#campaddr,#campaddr2,#campaddr3,#campname,#campsite,#camptel{
            width: 300px;
            height: 30px;
        }
        .thema,.campfac,.campctg{
            border-spacing: 0px;
            border: 1px solid #848484;
            text-align: center;
            width: 700px;
        }
        .themaname>td,.facname>td,.ctgname>td{
            width: 100px;
            border: 1px solid #848484;
            height: 30px;
            background-color: #ccc;
        }
        .themacheck>td,.faccheck>td,.ctgcheck>td{
            border: 1px solid #848484;
            height: 30px;
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
    <div id="step"><img src="/resources/img/camp/step2.png"></div>
    <hr style="border:2px solid black">
    <div class="join">
        <form action="campjoin2.do" method="post" class="jointable">
            <table>
                <tr>
                    <td style="width: 300px"><label for="ceoid">*아이디</label></td>
                    <td><input type="text" id="ceoid" name="ceoid" placeholder="영문 6자 이상" required>
                    <td id="idchk"></td>
                </tr>
                <tr>
                    <td style="width: 300px"><label for="campaddr">*캠핑장 주소</label></td>
                    <td><input type="text" id="campaddr" name="campaddr" readonly>&nbsp;<button style="width: 100px; height: 35px; font-size: 15px;">검색</button></td>
                </tr>
                <tr>
                    <td style="width: 300px"><label for="campaddr2"></label></td>
                    <td><input type="text" id="campaddr2" name="campaddr2" readonly></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="width: 300px"><label for="campaddr3"></label></td>
                    <td><input type="text" id="campaddr3" name="campaddr3" readonly></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="width: 300px">*캠핑장 이름<label for="campname"></label></td>
                    <td><input type="text" id="campname" name="campname" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="width: 300px">웹사이트<label for="campsite"></label></td>
                    <td><input type="text" id="campsite" name="campsite"></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="width: 300px">*전화번호<label for="camptel"></label></td>
                    <td><input type="text" id="camptel" name="camptel"></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="width: 300px">*테마선택 (중복선택가능)<label for="camptheme"></label></td>
                    <td>
                        <table class="thema">
                            <tr class="themaname">
                                <td>산</td><td>바다</td><td>계곡</td><td>강</td><td>저수지</td><td>섬</td><td>유원지</td>
                            </tr>
                            <tr class="themacheck">
                                <td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td>
                            </tr>
                        </table>
                        기타 : <input type="text" style="width: 500px; height: 25px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 300px">*시설선택 (중복선택가능)<label for="camptheme"></label></td>
                    <td>
                        <table class="campfac">
                            <tr class="facname">
                                <td>전기</td><td>샤워실</td><td>수세식</td><td>화로대</td><td>와이파이</td><td>동계가능</td><td>파쇄석</td>
                            </tr>
                            <tr class="faccheck">
                                <td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td>
                            </tr>
                            <tr class="facname">
                                <td>파쇄석</td><td>잔디</td><td>온수</td><td>난로대여</td><td>물놀이가능</td><td>애견가능</td><td>매점</td>
                            </tr>
                            <tr class="faccheck">
                                <td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td>
                            </tr>
                            <tr class="facname">
                                <td>썰매장</td><td>방방이</td><td>놀이터</td><td>낚시</td>
                            </tr>
                            <tr class="faccheck">
                                <td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td>
                            </tr>
                        </table>
                        기타 : <input type="text" style="width: 500px; height: 25px;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 300px">*카테고리선택 <br>(중복선택가능)<label for="camptheme"></label></td>
                    <td>
                        <table class="campctg">
                            <tr class="ctgname">
                                <td>데크</td><td>카라반</td><td>글램핑</td><td>팬션/민박</td>
                            </tr>
                            <tr class="ctgcheck">
                                <td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td><td><input type="checkbox"></td>
                            </tr>
                        </table>
                        기타 : <input type="text" style="width: 500px; height: 25px;">
                    </td>
                </tr>
            </table>
            <br><br>
            <div class="button">
                    <button type="submit" style="font-size: 18px;">다음페이지로</button>
                    <button type="reset" style="font-size: 18px;">취소</button>
            </div>
            <br><br>
        </form>
    </div>
</body>
</html>