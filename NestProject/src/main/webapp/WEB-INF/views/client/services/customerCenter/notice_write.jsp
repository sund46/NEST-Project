<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

 <c:import url="../../common/customer_head.jsp"/>
<body style="overflow: auto;">



 <c:import url="../../common/customer_top_line.jsp"/>
    
    <div class="container0">
  <div id="centerbtn">
        <p id="site_map">고객센터 &nbsp; > &nbsp; 1:1 문의<p>
                <!--사이트 맵-->
                <h4 id="notice_write_title" style="text-align: center; margin-top: 50px;">1:1문의</h4>
    </div>
    </div>
    
    
    
    
    
<!-- 1:1 문의 글 작성  -->
    
    <div class="container_n">
    <form class="notice_form">
    <!-- 제목 -->
  <div class="form-group row" style="margin: 0;">
    <div class="form-group">
      <label id="notice_write_p" for="inputEmail4"  class="col-sm-2 col-form-label">제목</label>
      <input id="notice_input" type="text" class="form-control" id="inputEmail4">
    </div>
  </div>
    <!-- 체크 -->

    <div class="form-row align-items-center" style="border-bottom: solid 1px #d2d2d2;">
      <span id="notice_write_p" style="padding:20px 15px;">문의 유형 선택 </span>
      
        <div class="col-auto my-1">
      <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
      <select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
        <option selected>선택해주세요</option>
        <option value="1">결제/환불</option>
        <option value="2">가입/탈퇴</option>
        <option value="3">서비스</option>
        <option value="4">커뮤니티</option>
        <option value="5">기타</option>
      </select>
    </div>
      </div>
      


  <!-- 글 내용-->
 <div class="form-group notice_write_form">
    <label id="notice_write_p" for="exampleFormControlTextarea1" class="col-sm-2 col-form-label">내용</label>
    <textarea class="form-control notice_long_text" id="exampleFormControlTextarea1" ></textarea>
  <div id="formokbtn" class="form-group" >
  <div style="margin: 0 auto; width: 61%; margin-top: 50px">
    <div style="display: inline-block; width: 50%;">
      <button id="notice_btn_left" type="submit" class="btn btn-primary">확인</button>
    </div>
    <div style="display: inline-block;  width: 50%; float: right; " >
    <!-- 취소 했을 경우 이전 페이지 (고객센터 메인으로 이동) -->
      <a  id="notice_btn_right" class="btn btn-primary" href="#" role="button">취소</a>
    </div>
  </div>
  </div>
  </div>

  <!-- 버튼  -->
  
</form>
   </div> 

   
        <div id="footer" class="container_">


            <p id="text"><br>ⓒ 2019 Nest Corporation All rights reserved</p>
        </div>

   </body>
   </html>
   
    
    
    
    
    
    
    
    
    
    
    