<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     
<!DOCTYPE html>
<html lang="ko" style="height:100%;width:100%;overflow:hidden">
<head>
   

    <title>공유문서함</title>

</head>
<body style="height:100%;width:100%;">
  <div style="height:100%;width:100%;">
       
 <c:import url="../../common/navi.jsp"/>



<!--===========================노트 흰색=======================================================================-->
        <section class="whitebox col-md-10 col-xs-11">
       
                <div id="top_line" style="height: 100px; padding-top: 20px;">
              
           
                        <div style=" display: inline-block;">
                       <h5>공유 문서함</h5>
                 
                       <p  id="trash_list">0개</p><!--리스트 갯수-->
                        </div> 
                      <!---============   ==============---->
                      
                      </div>
            <div id="note">
               
               
            </div>
          

<!---->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
 $(document).ready(function(){  
   
  $(".topnav").hover(function() {                    //마우스를 topnav에 오버시
   $(this).parent().find(".subnav").slideDown('normal').show();                   //subnav가 내려옴.
   $(this).parent().hover(function() {  
   }, function(){  
    $(this).parent().find(".subnav").slideUp('fast');                 //subnav에서 마우스 벗어났을 시 원위치시킴  
   });  
  });  
   
 });  
</script>

<!---->





   
          
        
        </section>
      </div>
</body>
</html>