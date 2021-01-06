<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <style>
        .content {
            background-color: #405944;
            margin: 0 auto;
            border-radius: 10px;
            width: 1200px;
            height: 800px;
        }

        .mypage-menu {
            position: relative;
            width: 20%;
            height: 100%;
            background-color: #5a7356;
            border-top-left-radius: 10px;
            border-bottom-left-radius: 10px;
            float: left;
            font-family: 'Do Hyeon', sans-serif;
        }

        img {
            display: block;
            margin: 0 auto;
            margin-top: 10px;
        }

        h1 {
            text-align: center;
            color: #eba13d;
            margin: 0;
            letter-spacing: 3px;
        }

        .menu {
            line-height: 40px;
            font-size: 20px;
            margin-top: 40px;
            margin-left: 30px;
            color: #f3d479;
            letter-spacing: 1px;
        }

        .menu a {
            text-decoration-line: none;
            color: #f3d479;
        }

        .mypage-main {
            width: 80%;
            height: 100%;
            float: right;
        }

        .mypage-content {
            margin: 3%;
            width: 94%;
            height: 93%;
            background-color: #f2f2f2;
            border-radius: 10px;
        }

        .info {
            text-align: center;
            line-height: 50px;
            font-size: 18px;
        }

        .info form {
            display: block;
            margin: 0 auto;
        }

        .info table {
            border-collapse: collapse;
            width: 80%;
            border-color: darkgray;
            margin: auto;
            border: 1px solid darkgray;
        }

        .info table input {
            width: 80%;
            height: 40px;
            border-radius: 5px;
            border: 1px solid darkgray;
            float: left;
            margin-left: 5px;
            box-shadow: 0px 0.5px 1.5px darkgray inset;
            font-size: 18px;
        }

        .info input:focus {
            outline: none;
        }

        .info th {
            background-color: gainsboro;
        }

        .info td {
            background-color: white;
            text-align: left;
        }

        .info input[type="submit"] {
            width: 90px;
            height: 45px;
            border-radius: 5px;
            font-size: 17px;
            font-weight: bold;
            background-color: #f3d479;
            border: none;
        }
    </style>
</head>

<body>
    <div class="content">
        <!--����-->
        <div class="mypage-menu">
            <img src="/resources/img/customer/tent.png" width="60%">
            <h1>MY PAGE</h1>
            <ul class="menu">
                <li><a href="#">ȸ�� ����</a></li>
                <li><a href="#">���� Ȯ��</a></li>
                <li><a href="#">�̿� ����</a></li>
                <li><a href="#">���� ����</a></li>
                <li><a href="#">����Ʈ ����</a></li>
            </ul>
        </div>
        <!--������-->
        <div class="mypage-main">
            <div class="mypage-content">
                <br><br>
                <div class="info">
                    <h2>ȸ�� ���� ����</h2>
                    <form action="/update.do" method="post">
                        <table border="1">
                            <tr>
                                <th>���̵�</th>
                                <td style="padding-left: 5px;">${u.userId}</td>
                            </tr>
                            <tr>
                                <th>��й�ȣ</th>
                                <td><input type="password" placeholder="��й�ȣ�� �Է����ּ���"></td>
                            </tr>
                            <tr>
                                <th>�̸�</th>
                                <td style="padding-left: 5px;">${u.userName}</td>
                            </tr>
                            <tr>
                                <th>�������</th>
                                <td style="padding-left: 5px;">${u.userBirth }</td>
                            </tr>
                            <tr>
                                <th>��ȭ��ȣ</th>
                                <td><input type="text" name="userPhone" value="${u.userPhone }"></td>
                            </tr>
                            <tr>
                                <th>�ּ�</th>
                                <td><input type="text" name="userAddr" value="${u.userAddr}"></td>
                            </tr>
                        </table>
                        <br>
                        <input type="submit" value="����">
                    </form>
                </div>
            </div>
        </div>


    </div>
</body>

</html>