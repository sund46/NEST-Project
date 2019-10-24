<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
 

<title>자주찾는 질문</title>




<body>


   <c:import url="../common/customer_navi.jsp"/>
    <!----------->
    <div id="centerbtn">
        <p style="text-align: left; font-size: 12px;">고객센터 &nbsp; > &nbsp; 자주찾는 질문<p>
                <!--사이트 맵-->
                <h4 style="text-align: center; margin-top: 50px;">자주찾는 질문</h4>
                <p style="text-align: center; font-size: 14px;">문의하시기 전에 자주하는 질문을 이용하시면 고객님의 궁금증을 빠르게 해결하실 수 있습니다.</p>


    </div>
    <div class="container_" style="height: 440px;">
        <p
            style="font-size: 16px; background:  #343a40; color:#fff; height: 50px; line-height: 50px; padding-left: 20px;">
            <i class="fas fa-star" style="color: #fff;"></i>
            <b>BEST 질문</b>
        </p>
        <ul id="cus_ul">

            <li>비밀번호 변경 방법</li>
            <li>계정의 사용자 닉네임 변경 방법</li>
            <li>Nest 서비스 등급 비교</li>
            <li>Nest 서비스 기능 안내</li>
            <li>Nest 서비스 요금제</li>
            <li>Nest 서비스 결제하는 방법</li>
            <li>Nest 서비스 취소하는 방법</li>
            <li>Nest 비밀번호 변경 방법</li>

        </ul>
    </div>


    <!------footer-->
    <footer>
        <div id="footer" class="container_">


            <p id="text"><br>ⓒ 2019 Nest Corporation All rights reserved</p>
        </div>

    </footer>
</body>

</html>