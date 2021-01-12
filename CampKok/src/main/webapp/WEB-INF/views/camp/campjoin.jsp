<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장 등록</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
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
        #wrapper{
            background-color: #ccc;
            border: 1px solid black;
        }
        #wrapper>*{
            width: 80%;
            margin: 0 auto;
        }
        #selectbox{
            width: 1000px;
            height: 300px;
        }
        #selectbox>div{
            float: left;
        }
        p{
            font-size: 20px;
            font-weight: bold;
            height: 20px;
        }
        textarea{
            display: block;
            font-size: 15px;
            outline-color: #848484;
            width: 950px;
            height: 180px;
        }
        #checkbox{
            border: 1px solid #848484;
            background-color: white;
            width: 475px;
            height: 60px;
        }
        #checkbox>p{
            position: relative;
            left: 10px;
            font-size: 18px;
            font-weight: bold;
        }
        #checkbox2{
            width: 475px;
            border: 1px solid #848484;
            background-color: white;
            height: 60px;
        }
        input[type="checkbox"]{
            left: 20px;
            top: 15px;
            position: relative;
            width : 25px;
            height: 25px;
            cursor: pointer;
        }
        label[for="agree"]{
            left: 20px;
            top: 10px;
            font-size: 18px;
            position: relative;
        }
        label[for="disagree"]{
            left: 20px;
            top: 10px;
            font-size: 18px;
            position: relative;
        }
        button[type=submit]{
            position: relative;
            left: 330px;
            width: 300px;
            height: 50px;
            font-size: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
	<body>
    <h1>캠핑장 등록</h1>
    <div id="step"><img src="/resources/img/camp/step1.png"></div>
    <hr style="border:2px solid black">
	<div id="wrapper">
       <form action="campjoin.do" method="post">
            <div id="selectbox">
                <p>서비스 이용약관(필수)</p>
                <textarea rows="10" cols="50">
고객님 캠콕에 방문하여 주셔서 감사합니다.

캠콕중앙 주식회사(이하 ‘캠콕’라 합니다)가 제공하는 캠콕평창, 캠콕제주, 캠콕호텔&리조트 웹사이트에 방문하신 고객님을 환영합니다. 본 약관은 고객님이 이용하시는 캠콕의 웹사이트서비스(이하 ‘캠콕 서비스’라 합니다)의 이용조건 및 절차, 기타 필요한 사항을 설명하며 고객님의 캠콕 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
캠콕 서비스를 이용하시거나 캠콕 서비스 회원으로 가입하실 경우 고객님께서는 본 약관을 확인하거나 동의하여 본 약관이 적용되오니 부디 꼼꼼히 본 약관내용을 확인하여 주시기 바랍니다.

캠콕는 본 약관에서 다음의 용어를 사용하고 있습니다.

“서비스”란 캠콕가 운영하는 웹사이트 등에서 제공하는 인터넷상의 서비스(무선 인터넷서비스 포함)를 말합니다.
“계정”이란 회원이 캠콕 웹사이트에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원별로 별도 관리하기 위해 설정한 회원 식별 단위를 말합니다.
"회원"은 캠콕 웹사이트에 개인 및 법인정보를 제공하여 회원등록을 한 고객님으로서 캠콕 웹사이트의 정보를 지속적으로 제공받으며 캠콕 서비스를 계속적으로 이용할 수 있는 고객님을 말합니다.

회원으로 가입하시면 다양하고 편리한 캠콕 서비스를 이용하실 수 있습니다.

고객님은 본 약관을 읽고 동의하신 후 소정의 가입절차를 통하여 회원가입을 신청하실 수 있으며 캠콕가 고객님의 회원가입 신청을 승낙하면 회원가입절차가 완료됩니다. 회원가입절차가 완료되면 캠콕는 고객님께 캠콕 서비스 이용 계정(이하 ‘계정’이라 합니다)을 무료로 부여해 드립니다. 단, 신규가입회원의 경우 특정 서비스가 일정기간 제한될 수 있습니다.

캠콕는 고객님의 소중한 개인정보를 안전하게 보호하겠습니다.

캠콕는 서비스의 원할한 제공을 위하여 고객님이 동의한 목적과 범위 내에서만 개인정보를 수집, 이용합니다. 또한 수집한 고객님의 개인정보는 개인정보 보호 관련 법령에 따라 안전하게 관리하겠습니다. 캠콕가 고객님의 소중한 개인정보를 안전하게 보호기 위하여 어떠한 노력을 하고 있는지 궁금한 고객님께서는 캠콕의 개인정보 처리방침을 확인하여 주시기 바랍니다.
캠콕는 고객님이 수신 동의를 하지 않는 한 고객님의 개인정보를 서비스관련 이외의 상업적인 목적으로 사용하지 않습니다. 다만 관계법령에 의한 경우 및 수사상의 목적 등의 경우에는 부득이하게 예외로 합니다.

고객님은 언제든지 캠콕 서비스 이용계약을 해지할 수 있습니다.

고객님께서는 언제든지 캠콕 서비스 이용계약 해지를 통하여 회원에서 탈퇴할 수 있으며, 이 경우 캠콕는 고객님의 소중한 개인정보를 회원 탈퇴와 동시에 기술적인 복원이 불가능하도록 폐기합니다.
단, 아래의 경우에는 탈퇴 후에도 일부 정보가 보유될 수 있으며, 해당기간 경과 후에는 즉시 폐기하도록 하겠습니다.
서비스 제공 혼선방지를 위하여
- 보유 항목: 회원서비스 운영에 관한 기록
- 보존 기간: 1년
거래내역이 존재하는 경우
- 보유 항목: 계약 또는 청약철회 등에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록
- 보존 기간: 5년
- 보존 사유: 전자상거래 등에서의 소비자보호에 관한 법률
불만 또는 분쟁처리내역이 존재하는 경우
- 보유 항목: 소비자의 불만 또는 분쟁처리에 관한 기록
- 보존 기간: 3년
- 보존 사유: 전자상거래 등에서의 소비자보호에 관한 법률
미아 보호자를 찾지 못한 경우
- 보유 항목: 미아 정보
- 보존 기간: 10년
- 보존 사유: 실종 아동 등의 보호 및 지원에 관한 법률 시행령
의무 명부 보관
- 보유 항목: 환자 명부
- 보존 기간: 5년
- 보존 사유: 의료법 시행규칙

캠콕 서비스는 연중무휴, 1일 24시간 고객님을 위하여 열려있습니다.

캠콕는 고객님을 위하여 업무상 또는 기술상 특별한 지장이 없는 한 1일 24시간, 365일 캠콕의 서비스를 제공할 수 있도록 항상 노력하고 있습니다.
다만 천재지변 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우, 서비스 시스템의 정비를 위하여 부득이하게 서비스를 제공할 수 없는 경우, 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지하여 서비스를 제공할 수 없는 경우, 기타 중대한 사유로 캠콕가 서비스를 제공할 수 없는 사유가 발생한 경우 등으로 인하여 부득이하게 서비스가 중지될 수 있으니 이점 양해 부탁드립니다.

고객님께 서비스이용에 필요한 정보를 잘 안내하겠습니다.

캠콕는 서비스를 운용함에 있어 각종 정보를 서비스 내 알림 등에 게재하는 방법으로 회원에게 제공하는 것을 원칙으로 합니다. 다만 마케팅 및 광고 활용 동의를 하신 고객님께는, 동의하신 전자메일, 기타 적절한 전자적 수단을 통해 제공해 드립니다.
캠콕의 일부 서비스에는 광고가 포함될 수 있습니다. 캠콕는 서비스의 운영과 관련하여 웹사이트에 광고를 게재할 수 있으며, 마케팅 및 광고 활용 동의를 하신 고객님께는 동의하신 전자메일, 기타 적절한 전자적 수단에 광고가 포함된 정보가 발송 될 수 있습니다.

캠콕 서비스 이용을 위하여 다음의 주의사항 확인을 부탁 드립니다.

고객님의 자유롭고 편리한 캠콕 서비스 이용을 위하여 캠콕는 최선을 다하고 있으며 앞으로도 최선을 다할 것입니다. 다만 고객님과 다른 사람의 권리가 함께 존중되고 보호받기 위하여 다음과 같은 고객님의 협조가 필요합니다.
- 회원 가입시 고객님 본인의 개인정보(이름, 생년월일, 휴대전화번호 등)를 기재하여 주시고 항상 정확하고 최신의 정보로 유지하여 주시기 바랍니다. 타인의 개인정보를 도용하거나 허위의 정보로 회원 가입을 신청한 경우 회원가입의 승인이 거절될 수 있고. 승인이 된 경우라도 이러한 사실이 확인된 경우, 캠콕 서비스 이용이 중지되거나 이용계약이 해지될 수 있으니 반드시 고객님 본인의 개인정보로 회원가입을 하여 주시기 바랍니다.
- 다른 사람의 계정을 무단으로 사용하여서는 아니 되며 고객님의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 사용을 허락해서는 안 됩니다. 또한 다른 사람의 명예를 훼손하거나 모욕하는 행위, 다른 사람의 지적재산권 등의 권리를 침해하는 행위, 다른 사람의 의사에 반하여 광고성 정보 등 일정한 내용을 전송하는 행위 등을 하여서는 아니 됩니다.
- 관계법령에 위배되는 행위, 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위, 선량한 풍속, 기타 사회질서를 해하는 행위 등을 하여서는 아니 됩니다.
고객님은 본 약관의 규정, 이용안내 및 주의사항 등 캠콕가 요청하는 사항을 준수하여 주시기를 바랍니다., 또한 해킹행위 또는 컴퓨터바이러스의 유포행위 등 캠콕의 업무를 방해하거나 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위 등을 하여서는 아니 됩니다.
- 고객님은 캠콕 서비스를 이용하여 얻은 정보를 사전 동의 없이 복사, 복제, 변경, 번역, 출판, 방송 기타의 방법으로 사용하거나 이를 타인에게 제공하는 행위, 캠콕의 사전 동의 없는 영리 취득 행위를 하실 수 없습니다.

부득이하게 고객님의 서비스 이용을 제한할 경우 합리적인 절차로 진행하겠습니다.

캠콕는 서비스의 원활한 관리·감독을 위하여 필요한 경우, 고객님이 게시하는 내용물에 대해 추가, 수정, 삭제할 수 있으며 그 내용을 서비스 내 알림 또는 전자메일, 기타 적절한 전자적 수단을 통해 안내해 드리겠습니다. 만약 긴급을 요한다고 판단되는 경우에는 별도 통지 없이 게시물 내용의 추가, 수정, 삭제가 진행될 수 있습니다.
고객님에게 발송한 이메일이 3회이상 수신불능으로 반송되는 경우, 1년동안 서비스 사용 이력이 없는 고객님의 경우, 캠콕는 서비스 내 알림 또는 전자메일, 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 고객님의 정보를 파기하거나, 그로 인하여 고객님과의 서비스 이용계약 유지에 필요한 필수적인 정보가 부족해질 경우 부득이하게 고객님과의 서비스 이용계약을 해지할 수 있습니다.
고객님이 관계법령, 본 약관의 규정, 이용안내 및 주의사항 등을 준수하지 않을 경우, 캠콕는 고객님의 관련 행위 내용을 확인할 수 있으며, 그 확인 결과에 따라 고객님께 주의를 당부하거나 서비스 이용을 일부 또는 전부, 일시 또는 영구히 정지시키는 등 그 이용을 제한할 수 있습니다.
캠콕는 이용제한을 하고자 하는 경우 그 사유, 일시 및 기간을 정하여 고객님께 안내해 드리며 만약 긴급을 요한다고 판단한 경우에는 그러하지 아니할 수 있습니다. 또한 소정의 기간 이내에 고객님이 이를 해소하지 아니하는 경우 서비스 이용계약을 해지할 수 있으며 해지 시 고객님의 개인정보는 회원탈퇴의 경우와 동일하게 폐기됩니다.

캠콕의 잘못은 캠콕가 책임지겠습니다.

캠콕가 고객님께 무료로 제공하는 서비스와 관련하여 캠콕의 중대한 과실로 인하여 고객님께 손해가 발생한 경우, 캠콕는 관련 법령에 따라 고객님의 손해를 배상하겠습니다.
다만 천재지변 또는 이에 준하는 불가항력, 본 약관에 명시된 사정으로 인하여 캠콕가 서비스를 제공할 수 없는 경우, 이용자들의 고의 또는 과실로 인하여 서비스 이용의 장애가 발생한 경우 등에는 서비스 중지에 관한 책임을 부담하지 않습니다.
고객님의 개인정보(이름, 생년월일, 휴대전화번호 등) 변경에 대한 미통보 및 미수정으로 인하여 발생한 고객님의 손해에 대하여 캠콕는 책임을 부담하지 않습니다. 따라서 항상 정확하고 최신의 정보로 유지하여 주시기를 부탁드립니다.
캠콕는 고객님이 서비스를 이용하여 얻은 정보 등으로 인해 입은 손해, 캠콕가 제공하는 서비스망을 통해 제공하는 정보의 신뢰도나 정확성, 이용자들이 게시 또는 전송한 자료의 내용, 캠콕 서비스에 게재되어 있거나 캠콕 서비스를 통한 광고주의 판촉활동에 고객님이 참여하거나 교신 또는 거래의 결과로써 발생하는 모든 손실 또는 손해에 대해 책임을 부담하지 않습니다.

약관을 항상 게시하며 개정이 필요한 경우 사전 공지 후 개정합니다.

캠콕는 이 약관의 내용을 고객님이 쉽게 확인할 수 있도록 서비스 초기화면에 게시하고 있습니다.
캠콕는 수시로 이 약관을 변경할 수 있으며, 관련 법령을 위배하지 않는 범위에서 변경하겠습니다. 변경되는 약관은 고객님께 서비스 화면이나 기타의 방법으로 고객님에게 공지하고 변경되는 약관에 대한 고객님의 의견을 수렴하겠습니다. 공지일로부터 30일 이후까지 변경되는 약관에 대한 고객님의 의견이 캠콕에 접수되지 않으면 고객님이 약관의 변경에 동의한 것으로 간주되며 변경되는 약관의 효력이 발생하게 됩니다.
이 약관은 한국어로 표기하는 것을 원칙으로 하고, 이 약관에 명시되지 않은 사항이 관계법령에 규정되어 있을 경우에는 그 규정을 따릅니다.
고객님과 캠콕와의 관계에는 대한민국의 법령이 적용됩니다. 그리고 이 약관 또는 캠콕 서비스와 관련하여 고객님과 캠콕 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 ‘민사소송법’에서 정한 절차를 따릅니다.


부칙) (시행일) 이 약관은 2019년 08월 01일부터 시행된다.

“ 위 서비스 이용약관에 동의하지 않을 권리가 있습니다. 그러나 동의하지 않는 경우 당사가 제공하는 서비스를 제공받을 수 없습니다. ”
                </textarea>
                <div id="checkbox"><p>서비스 이용약관에 동의하시겠습니까?*</p></div>
                <div id="checkbox2">
                    <input type="checkbox" id="agree" name="check"><label for="agree">동의합니다.</label>
                    <input type="checkbox" id="disagree" name="check"><label for="disagree">동의하지 않습니다.</label>
                </div>
            </div>
            <div id="selectbox">
                <p>개인정보 수집 및 이용 동의(필수)</p>
                <textarea rows="10" cols="50" id="">
정보통신망 이용촉진 및 정보보호 등에 관한 법률에 따라 캠콕중앙 주식회사(이하 ‘캠콕’라 합니다) 웹사이트서비스에 회원가입을 신청하시는 고객님께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 아래와 같이 안내해 드리겠습니다.

1. 수집하는 개인정보의 항목 및 수집방법

캠콕는 아래와 같은 항목의 개인정보를 수집하고 있으며, 사상·신념, 정치적 견해, 건강 등 고객님의 사생활을 현저히 침해할 우려가 있는 개인정보는 수집하지 않습니다. 다만, 고객님께서 수집에 동의하시는 경우는 예외로 합니다.

① 캠콕는 다음과 같은 개인정보를 수집하며 고객님이 필수 제공에 해당하는 정보를 제공하지 않는 경우 서비스 제공이 불가능합니다.

구분	필수/선택	수집항목
개인회원 입회신청(콘도/골프)	필수	이름, 생년월일, 성별, 주소, 연락처(휴대폰번호), 이메일, 사진
선택	회사명, 부서/직위
법인회원 입회신청(콘도/골프)	필수	법인명, 사업자등록번호, 주소, 담당자 성명, 전화번호, 이용자 이름, 생년월일, 성별, 주소, 연락처, 이메일, 사진
선택	담당자의 부서, 직위, 휴대폰번호, 이메일
온라인회원 웹사이트가입 회원	필수	이름, 아이디, 비밀번호, 생년월일, 연락처(휴대폰번호), 이메일
온라인회원 웹사이트가입 회원(중앙그룹 계열사 임직원)	필수	사원번호, 소속회사, 소속부서, 이름, 주소, 생년월일, 아이디, 비밀번호, 연락처(휴대폰번호), 이메일
콘도/골프회원 웹사이트가입 회원	필수	회원번호, 고객유형, 이름, 아이디, 비밀번호, 생년월일, 연락처(휴대폰번호), 이메일, 주소
스키장 시즌권 회원	필수	이름, 생년월일, 연락처(휴대폰번호), 주소, 웹사이트 아이디, 신장, 사진, 키
워터파크 연간이용권 회원	필수	이름, 생년월일, 주소, 연락처(휴대폰번호), 사진
온라인 결제 서비스이용 회원
(콘도/골프/스키/워터파크 공통)	필수	카드사, 카드번호, 승인번호, 연락처(휴대폰번호)
오프라인 결제 서비스이용 회원
(콘도/골프/스키/워터파크 공통)	필수	카드사, 카드번호, 승인번호
고객 상담 이용 회원	필수	이름, 생년월일, 회원권번호, 연락처(휴대폰번호)
고객 상담 이용 비회원	필수	이름, 생년월일, 연락처(휴대폰번호)
미아 당사자 및 보호자	필수	이름, 연령, 성별, 연락처(휴대폰번호)
부상사고 발생 당사자	필수	이름, 연령, 신장, 체중, 주소, 직업, 연락처(휴대폰번호)
분실/습득물 수령 당사자	필수	이름, 연락처(휴대폰번호), 주소
② 웹사이트 서비스 이용과정이나 업무처리 과정에서 아래와 같은 정보들이 자동 생성되어 수집될 수 있습니다.
- IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
③ 부가 서비스 및 맞춤식 서비스 이용 또는 설문조사나 이벤트 응모과정에서 해당 서비스의 이용자에 한해서 필요한 개인정보가 수집될 수 있습니다. 이때 기입하신 정보는 해당 서비스 제공이나 사전에 밝힌 목적 이외의 다른 어떠한 목적으로도 사용되지 않습니다.

2) 캠콕는 다음과 같은 방법으로 고객님의 개인정보를 수집합니다.

① 홈페이지, 서비스 신청 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
② 서비스 이용 또는 업무처리과정에서 생성되거나 제휴사로부터의 제공
2. 개인정보의 수집 및 이용 목적

캠콕는 다음과 같은 목적 및 기타 계약의 체결 및 이행, 사고조사·분쟁해결·민원처리 및 법령상 의무이행 등의 목적을 위해 개인정보를 수집·이용하며, 수집된 개인정보는 해당 서비스 제공이나 고객님에게 사전에 밝힌 목적 이외에는 어떠한 목적에도 이용되지 않습니다. 이용 목적이 변경될 시에는 사전동의를 구하고 처리합니다.

1) 회원관리
회원제 서비스 제공 및 제한적 본인확인제 시행에 따른 본인 식별·인증, 회원자격 유지·관리, 서비스 부정이용 방지와 비인가 사용방지, 가입의사 확인, 가입 및 가입횟수 제한, 명의 개서, 만 14세 미만 아동의 개인정보 처리시 법정대리인의 동의여부 확인, 민원처리

2) 서비스제공에 관한 계약의 체결 및 이행
온라인 서비스(실시간 예약 및 조회, 할인쿠폰 등) 및 유용한 컨텐츠 제공, 종류별 맞춤서비스 제공, 상품구매 및 이용료 결제, 배송, 인터넷 · ARS 예약서비스

3) 마케팅 및 광고에의 활용
신규 서비스 상품 개발과 이벤트 행사에 따른 홍보 및 맞춤서비스, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속 빈도 파악, 회원의 이용성향 분석, 기타 홍보물 발송

3. 개인정보의 보유 및 이용기간

1) 고객님이 캠콕가 제공하는 서비스를 이용하는 동안 캠콕는 고객님의 개인정보를 계속 보유 및 이용하며 “2. 개인정보의 수집 및 이용 목적”에서 규정한 수집 및 이용목적이
완전히 달성되거나 고객님이 동의를 철회하는 경우, 회원탈퇴하는 경우에는 캠콕는 원칙적으로 고객님의 개인정보를 지체없이 파기하고 있습니다.

2) 다만 아래와 같이 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 다른 목적으로 절대 이용하지 않고 안전하게 보관하며
해당 기간 경과 후 지체 없이 재생이 불가능한 방법으로 파기합니다.
서비스 제공 혼선방지를 위하여
- 보유 항목: 회원서비스 운영에 관한 기록
- 보존 기간: 1년
거래내역이 존재하는 경우
- 보유 항목: 계약 또는 청약철회 등에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록
- 보존 기간: 5년
- 보존 사유: 전자상거래 등에서의 소비자보호에 관한 법률
불만 또는 분쟁처리내역이 존재하는 경우
- 보유 항목: 소비자의 불만 또는 분쟁처리에 관한 기록
- 보존 기간: 3년
- 보존 사유: 전자상거래 등에서의 소비자보호에 관한 법률
미아 보호자를 찾지 못한 경우
- 보유 항목: 미아 정보
- 보존 기간: 10년
- 보존 사유: 실종 아동 등의 보호 및 지원에 관한 법률 시행령
의무 명부 보관
- 보유 항목: 의무 기록
- 보존 기간: 5년
- 보존 사유: 의료법 시행규칙

3) 고객님의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 개인정보 파기의 절차 및 방법은 다음과 같습니다.
① 파기절차
캠콕는 파기 사유가 발생한 개인정보를 선정하고, 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.
② 파기방법
캠콕는 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 파기하며, 종이 문서에 기록ㆍ저장된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.

“ 위 개인정보 수집 및 이용에 동의하지 않을 권리가 있습니다. 그러나 동의하지 않는 경우 당사가 제공하는 서비스를 제공받을 수 없습니다. ”
                </textarea>
                <div id="checkbox"><p>개인정보 수집 및 이용에 동의하시겠습니까?*</p></div>
                <div id="checkbox2">
                    <input type="checkbox" id="agree2" name="check2"><label for="agree">동의합니다.</label>
                    <input type="checkbox" id="disagree2" name="check2"><label for="disagree">동의하지 않습니다.</label>
                </div>
            </div>
            <div id="selectbox">
                <p>개인정보 제3자 제공 동의(필수)</p>
                <textarea rows="10" cols="50" id="">
캠콕는 원칙적으로 고객님의 개인정보를 “2. 개인정보의 수집 및 이용 목적”에서 명시한 범위 내에서만 사용하며, 고객님의 동의가 있거나 법률에 특별한 규정이 있는 경우에만 제3자에게 제공합니다. 캠콕가 고객님의 동의를 받아 제3자에게 제공하고 있는 개인정보는 다음과 같습니다.

제공받는자	제공받는 자의 개인정보 이용목적	제공하는 개인정보항목	보유 및 이용기간	비고
(사)한국휴양콘도미니엄경영협회	콘도 회원증 발급 및 회원명부 관리	이름, 생년월일, 성별, 회원번호, 소유 회원권 정보	동의한 날로부터 수집∙이용 목적이 달성되거나 동의 철회 시(또는 회원 탈퇴 시)까지	콘도 정회원에 한함
(사)한국골프장경영협회	골프 회원증 발급	이름, 소유 회원권 정보	골프 정회원에 한함
세무서, 국세청	관련법률에 따른 신고	관련법률에 따른 신고	콘도 및 골프 정회원에 한함
“ 위 개인정보 제3자 제공에 동의하지 않을 권리가 있습니다. 그러나 동의하지 않는 경우 당사가 제공하는 서비스를 제공받을 수 없습니다. ”
                </textarea>
                <div id="checkbox"><p>개인정보 제3자 제공에 동의하시겠습니까?*</p></div>
                <div id="checkbox2">
                    <input type="checkbox" id="agree3" name="check3"><label for="agree">동의합니다.</label>
                    <input type="checkbox" id="disagree3" name="check3"><label for="disagree">동의하지 않습니다.</label>
                </div>
            </div>
            <div id="selectbox">
                <p>개인정보 처리 및 취급 위탁이용 동의(필수)</p>
                <textarea rows="10" cols="50" id="">
① 캠콕는 다음과 같은 개인정보를 수집하며 고객님이 필수 제공에 해당하는 정보를 제공하지 않는 경우 서비스 제공이 불가능합니다.

위탁업체명	위탁업무	보유 및 이용기간
나이스신용평가정보㈜	실명확인, 개인식별	이미 보유 개인정보로 별도 저장 안함
빌포스트㈜	DM발송 대행	동의 철회 또는 목적 달성 시 파기
또봄 디자인커뮤니케이션	DM발송 대행	동의 철회 또는 목적 달성 시 파기
조인스중앙㈜	시스템 운영 및 서비스 운영	회원탈퇴 시 혹은 위탁계약 종료 시까지
㈜아워홈	고객관리 및 시설정비 관리 업무용	동의 철회 또는 업무수행기간
캠콕평창㈜	고객관리 및 시설정비 관리 업무용	동의 철회 또는 업무수행기간
캠콕중앙제주㈜	고객관리 및 시설정비 관리 업무용	동의 철회 또는 업무수행기간
㈜중앙점프	고객관리 및 시설정비 관리 업무용	동의 철회 또는 업무수행기간
㈜바로네트웍스	SMS/LMS/MMS발송, 고객상담, 외부채널 판매대행 등	목적 달성 시 파기
㈜여행창조	SMS/LMS/MMS발송, 고객상담, 외부채널 판매대행 등	목적 달성 시 파기
㈜플레이스엠	SMS/LMS/MMS발송, 고객상담, 외부채널 판매대행 등	목적 달성 시 파기
㈜비지에프네트웍스	SMS/LMS/MMS발송	목적 달성 시 파기
㈜케이지모빌리언스	휴대폰번호를 통한 본인인증 서비스	목적 달성 시 파기
㈜비플랜	스키장시즌권 소유자 확인 서비스	목적 달성 시 파기
㈜센트럴라인	분양 상품 안내 및 이용 안내	목적 달성 시 파기

② 캠콕는 위탁계약 체결시 위탁업무 수행목적 외 개인정보 처리금지, 기술적·관리적·물리적 보호조치, 재위탁 제한, 수탁자에 대한 관리·감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.

③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 변경된 사항을 공지사항이나 개인정보처리방침을 통해 공개하도록 하겠습니다.
“ 위 개인정보 처리 및 취급 위탁이용에 동의하지 않을 권리가 있습니다. 그러나 동의하지 않는 경우 당사가 제공하는 서비스를 제공받을 수 없습니다. ”
                </textarea>
                <div id="checkbox"><p>개인정보 처리 및 취급 위탁에 동의하시겠습니까?*</p></div>
                <div id="checkbox2">
                    <input type="checkbox" id="agree4" name="check4"><label for="agree">동의합니다.</label>
                    <input type="checkbox" id="disagree4" name="check4"><label for="disagree">동의하지 않습니다.</label>
                </div>
            </div>
            <br><br><br>
            <button type="submit" id="submit-1" disabled="">가입하기</button>
            <br><br><br>
	    </form>
	</div>
<script>
	jQuery(document).ready(function(){
	    $('input[type="checkbox"][name="check"]').click(function(){          
	
	        if ($(this).prop('checked')) {
	            $('input[type="checkbox"][name="check"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
	    });
	});
	jQuery(document).ready(function(){
	    $('input[type="checkbox"][name="check2"]').click(function(){          
	
	        if ($(this).prop('checked')) {
	            $('input[type="checkbox"][name="check2"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
	    });
	});
	jQuery(document).ready(function(){
	    $('input[type="checkbox"][name="check3"]').click(function(){          
	
	        if ($(this).prop('checked')) {
	            $('input[type="checkbox"][name="check3"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
	    });
	});
	jQuery(document).ready(function(){
	    $('input[type="checkbox"][name="check4"]').click(function(){          
	
	        if ($(this).prop('checked')) {
	            $('input[type="checkbox"][name="check4"]').prop('checked', false);
	            $(this).prop('checked', true);
	        }
	    });
	});
	$("input[type=checkbox]").click(function(){
		var submit1 = document.getElementById('submit-1');
		var check = $("#agree:checked").length;
		var check2 = $("#agree2:checked").length;
		var check3 = $("#agree3:checked").length;
		var check4 = $("#agree4:checked").length;
		console.log(check);
		console.log(check2);
		console.log(check3);
		console.log(check4);
		if(check>0 && check2>0 && check3>0 && check4>0){
			submit1.disabled = false;
		}else{
			submit1.disabled = true;
		}
	})
</script>
</body>
</html>