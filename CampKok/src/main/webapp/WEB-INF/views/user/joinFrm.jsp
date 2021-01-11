<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/user/joinFrm.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="header-img">
        <div>
            <p>일반회원가입</p>
            <p>캠콕의 다양한 서비스를 편리하게 이용하실 수 있습니다.</p>
        </div>
    </div>
    <div class="join-content">
        <div class="page-title">
            | SIGN UP
        </div>
        <div class="join-naeyong">
            <form action="/join.do" method="post">
                <table class="jointbl">
                    <tr>
                        <td><label>아이디</label></td>
                        <td><input type="text" name="userId" placeholder="5~20자의 영문 소문자, 숫자와 특수기호'_','-'만 사용 가능합니다."></td>
                    </tr>
                    <tr style="display: none;" id="chkId">
                        <td></td>
                        <td style="padding: 0px; padding-left: 10px; padding-bottom: 5px;"><span id="chkIdMsg"></span></td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td><input type="password" name="userPw"><span>
                                <!--8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.-->
                            </span></td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td><input type="text" name="userName"></td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td><input type="text" name="phone" placeholder="ex) 010-0000-0000"></td>
                    </tr>
                    <tr>
                        <td>생년월일</td>
                        <td><input type="text" name="birth"></td>
                        
                        <!-- 
                        <td>
                            <select>
                                <option selected>년도</option>
                                <option>1921</option>
                                <option>1922</option>
                                <option>1923</option>
                                <option>1924</option>
                                <option>1925</option>
                                <option>1926</option>
                                <option>1927</option>
                                <option>1928</option>
                                <option>1929</option>
                                <option>1930</option>
                                <option>1931</option>
                                <option>1932</option>
                                <option>1933</option>
                                <option>1934</option>
                                <option>1935</option>
                                <option>1936</option>
                                <option>1937</option>
                                <option>1938</option>
                                <option>1939</option>
                                <option>1940</option>
                                <option>1941</option>
                                <option>1942</option>
                                <option>1943</option>
                                <option>1944</option>
                                <option>1945</option>
                                <option>1946</option>
                                <option>1947</option>
                                <option>1948</option>
                                <option>1949</option>
                                <option>1950</option>
                                <option>1951</option>
                                <option>1952</option>
                                <option>1953</option>
                                <option>1954</option>
                                <option>1955</option>
                                <option>1956</option>
                                <option>1957</option>
                                <option>1958</option>
                                <option>1959</option>
                                <option>1960</option>
                                <option>1961</option>
                                <option>1962</option>
                                <option>1963</option>
                                <option>1964</option>
                                <option>1965</option>
                                <option>1966</option>
                                <option>1967</option>
                                <option>1968</option>
                                <option>1969</option>
                                <option>1970</option>
                                <option>1971</option>
                                <option>1972</option>
                                <option>1973</option>
                                <option>1974</option>
                                <option>1975</option>
                                <option>1976</option>
                                <option>1977</option>
                                <option>1978</option>
                                <option>1979</option>
                                <option>1980</option>
                                <option>1981</option>
                                <option>1982</option>
                                <option>1983</option>
                                <option>1984</option>
                                <option>1985</option>
                                <option>1986</option>
                                <option>1987</option>
                                <option>1988</option>
                                <option>1989</option>
                                <option>1990</option>
                                <option>1991</option>
                                <option>1992</option>
                                <option>1993</option>
                                <option>1994</option>
                                <option>1995</option>
                                <option>1996</option>
                                <option>1997</option>
                                <option>1998</option>
                                <option>1999</option>
                                <option>2000</option>
                                <option>2001</option>
                                <option>2002</option>
                                <option>2003</option>
                                <option>2004</option>
                                <option>2005</option>
                                <option>2006</option>
                                <option>2007</option>
                            </select>
                            <select>
                                <option selected>월</option>
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                            </select>
                            <select>
                                <option selected>일</option>
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                                <option>25</option>
                                <option>26</option>
                                <option>27</option>
                                <option>28</option>
                                <option>29</option>
                                <option>30</option>
                                <option>31</option>
                            </select>
                        </td>
                         -->
                    </tr>
                    <tr>
                        <td>성별</td>
                        <td>
                            <input type="radio" name="gender" value="남" id="m"><label for="m">남자</label>
                            <input type="radio" name="gender" value="여" id="f"><label for="f">여자</label>
                        </td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td><input type="text" name="addr"></td>
                    </tr>
                </table>

                <div>
                    <p><input type="checkbox" class="chk" id="chk_all"><b> 약관전체동의</b></p>
                    <p><input type="checkbox" class="chk" name="chk"> 이용약관에 동의합니다. (필수)</p>
                    <p><input type="checkbox" class="chk" name="chk"> 개인정보 처리방침에 동의합니다. (필수)</p>
                </div>

                <button type="submit">가입하기</button>
            </form>
        </div>
    </div>
    
    <script>
		$("[name=userId]").keyup(function(){
			var userId = $(this).val();
			$.ajax({
				url : "/checkId.do",
				data : {userId:userId},
				success : function(data){
					if(data == 0){
						$("#chkId").css('display','block');
						$("#chkIdMsg").html("멋진 아이디네요!");
					}else{
						$("#chkId").css('display','block');
						$("#chkIdMsg").html("이미 사용중인 아이디 입니다.");
						// $("#chkIdMsg").html("5~20자의 영문 소문자, 숫자와 특수기호'_','-'만 사용 가능합니다.");
					}
				}
			});
		});
	</script>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>