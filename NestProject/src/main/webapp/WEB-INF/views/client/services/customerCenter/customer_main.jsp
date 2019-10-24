<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
 
<title>고객센터</title>

<body>
<c:import url="../common/customer_navi.jsp"/>
    <header style="height: 60px; ">
            <div class="container_">
                <div style="width: 120px; display: inline-block;     padding-top: 10px;">
                <img style="width: 100%;" src="${pageContext.request.contextPath}/resources/images/nest_wlogo.png">      
                </div>
                <div id="customer_top_right_btn">
                <button  type="button" class="btn btn-outline">노트로이동</button>
                <button type="button" class="btn btn-outline">고객센터</button>
                </div>
            </div>
           
           
    </header>
    <!-----검색창-->
    <div style="width: 100%; background: #ffb672; height: 100px;">
    <div class="container_" style="padding-top:30px;">
                <form style=" margin: 0 auto; width: 70%;">
                                <div class="input-group mb-3">
                                    
                                    <input type="text" class="form-control"
                                        aria-label="Recipient's username" aria-describedby="button-addon2" >
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary" type="button"
                                            id="button-addon2" style="background: #fff; color: #F28B30; border:lightgray 1px solid;">검색</button>
                                    </div>
                                
                                </div>
                                </form>
    </div>
</div>
    <!----------->
    <div id="centerbtn" style="height: 710px;">
                <h4 style="text-align: center; margin-top: 66px;"><b>고객센터</b></h4> 
        <p style="text-align: center;font-size: 14px;">고객을 최우선으로 생각하는 네스트입니다.<br>
                고객센터를 이용하시면 1:1문의, 자주찾는 질문을 통해 가장 신속하고 정확한 답변을 받으실 수 있습니다.

            </p>




    <!------------->
    <div id="center1">
            <h6>자주 찾는 질문</h6>
    </div>


    <!---------->
    <div id="center2">
        <h6>1:1 문의하기</h6>
    </div>


    <!---------->
    <div id="center3">
                <h6>공지사항</h6>
    </div>
    </div>
    <!---------------------->
    







    <footer>
        <div id="footer" class="container_">
        
  
    <p id="text"><br>ⓒ 2019 Nest Corporation All rights reserved</p>
            </div>
      
    </footer>

    
</body>
</html>