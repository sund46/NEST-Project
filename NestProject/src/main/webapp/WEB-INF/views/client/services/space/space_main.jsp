<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<c:import url="../common/menubar.jsp"/>
		
			<div style="width:100%; height:100%">
			<!--===========================노트 흰색=====================================================================-->
		

			<div id="top_line">

				<div style="display: inline-block;"> 
					<h5>${spaceContentsMap.spaceName}</h5>
					<p>${spaceContentsMap.spaceExplain}</p>

				</div>
				
				<div style="float: right; display: inline-block;">
				<div id="top_line_margin" style="display: inline-block;">
					<i class="fas fa-users" style="font-size: 30px; color: #a8a8a8;"></i>
					<span style="color: #afafaf">10 members</span>
					<div id="top_membericon" class="rounded-circle">
					  <img src="${pageContext.request.contextPath}/resources/images/person1.png" class="rounded-circle" style="background: #fff; width: 100%; height: 100%;">
					</div>
					<div id="top_membericon" class="rounded-circle">
					  <img src="${pageContext.request.contextPath}/resources/images/person2.png" class="rounded-circle" style="background: #fff; width: 100%; height: 100%;">
					</div>
					<div id="top_membericon" class="rounded-circle">
					  <img src="${pageContext.request.contextPath}/resources/images/person3.png" class="rounded-circle" style="background: #fff; width: 100%; height: 100%;">
					</div>
					<div id="top_membericon" class="rounded-circle">
					  <img src="${pageContext.request.contextPath}/resources/images/person4.png" class="rounded-circle" style="background: #fff; width: 100%; height: 100%;">
					</div>
					<div id="top_membericon" class="rounded-circle">
					  <img src="${pageContext.request.contextPath}/resources/images/person5.png" class="rounded-circle" style="background: #fff; width: 100%; height: 100%;">
					</div>



					<!---->
					<div id="top_membericon" class="rounded-circle" >
						<p
							style="color: #fff; margin: 0; text-align:center; padding: 2px;">5</p>
					</div>
					</div>
				
			</div>
			<!---=============================----------->
				<div style="padding: 20px">
				<!--left_div-->
				<div id="space_left">
					<!--title-->
					<h5 style="display:inline-block;  padding: 0px 20px 4px 10px;">새로운 소식</h5>
					
					 <div id="space-left-Container" style="background: background: rgb(248,248,248);">	
					 	<div id="space-left-Container-div">
							<c:forEach var="noteList" items="${spaceContentsMap.noteList}" varStatus="i">
									<div class="card border-secondary mb-3" style="width:300px; height:250px; display:inline-block; margin-top:15px; margin-right:10px;">
										  <div class="card-header">${noteList.nwriter}</div>
										  <div class="card-body text-secondary">
										    <h5 class="card-title" style="cursor:pointer;" onclick="callNoteDetail('${noteList.spaceno}','${noteList.nno}')">${noteList.ntitle}</h5>
										    <p class="card-text">${noteList.ncontent}</p>
										  </div>
									</div>
							</c:forEach>					
						 </div>
					</div>
			    </div>
						
<!------right_div-------->
		
  <div id="space_right" style="margin-top:10px;">
    <div id="space_right_btn">
      <h5 style="display:inline-block;  padding: 0px 20px 4px 10px; ">고정된 노트</h5>

      <!-- --******************-  -->
      <button onclick="space_edit();" id="space_edit_id">편집</button>
      <button onclick="space_add();" id="space_add_id">확인</button>
      <button onclick="space_cencel();" id="space_cencel_id">취소</button>
      
    </div>
    
   

    <!---**********************-->
    <!--추가시 div 생성-->
    <div id="space_right_first_div2" style="margin-top:0px;">
       
      <c:forEach var="noteList" items="${spaceContentsMap.noteList}">
      	
      	  <c:if test="${noteList.fixed eq 'Y'}">
	      <div id="space_r_list" class="col-lg-4 col-md-4 col-xs-4">
	        <i class="far fa-list-alt"></i> <span id="space_r_list_title" style="cursor:pointer;" onclick="callNoteDetail('${noteList.spaceno}','${noteList.nno}')">${noteList.ntitle}</span>
	        
	      </div>
	      </c:if>
      </c:forEach>
      <!---글자수 자르기, ... 붙이기-->
      
      <script>

        /* document.getElementById("space_r_list_title").innerHTML=space_r_list_title.substring(0,6)+'...'; */
       

      </script>
    </div>
<!-------->
    <div id="space_right_first_div" class="col-lg-12 col-md-12 col-xs-12">
      <table id="space_add_div" class="table col-lg-12 col-md-12 col-xs-12">

        <thead>
          <tr>
			<th scope="col-md-1"></th>
            <th scope="col-md-9">제목</th>
            <th scope="col-md-2">작성자</th>
            
          </tr>
        </thead>
        <tbody>
		  
		  
		
		<c:forEach var="noteList" items="${spaceContentsMap.noteList}" varStatus="status">
          <tr>
           
            <td scope="row"><input type="checkbox" id="check_note${status.index}" value="${noteList.nno}"></td>
            <td><i class="fas fa-book" style="font-size: 20px; margin-right: 10px;"></i>${noteList.ntitle }</td>
            <td>${noteList.nwriter }</td>
           <c:if test="${noteList.fixed eq 'Y'}">
           	   <script>
           	   	$('#check_note${status.index}').attr('checked',true);
           	   </script>
           </c:if>
          </tr>
        </c:forEach>
       
        </tbody>
      </table>
    </div>
   
    <!-- -- -->


  </div>

	<!--=================하단 노트목록 ======================================-->
<div id="space_note_table" class="col-lg-12 col-md-12 col-xs-12">
                <p style="display: inline-block; margin-top: 50px; ;font-weight: 500;"><i class="fas fa-heart" style="margin-right: 10px;"></i>함께쓰는 공유 노트</p>
                <!--새노트-->
                    <div style="float: right; margin-top: 50px; cursor: pointer;">
                            <i class="fas fa-plus-circle" style="font-size: 10px; color: #F28B30; margin-right: 10px;"> </i>새노트
                          </div>
                        
                <table class="table">

                    <thead>
                        <tr>
                            <th scope="col-md-6">제목</th>
                            <th scope="col-md-2">만든 사람</th>
                            <th scope="col-md-2">수정한 날짜</th>
                            <th scope="col-md-2">공유 대상</th>
                        </tr>
                    </thead>
                    <tbody>
                    <!-- 노트북 뿌리는 부분 -->
                    <c:forEach var="noteBookList" items="${spaceContentsMap.noteBookList}">
                         <tr>
				            <td scope="row"><i class="fas fa-caret-down" style="font-size: 20px; margin-right: 10px;"></i>
				              <i class="fas fa-sticky-note" style="font-size: 20px; color: #b8b8b8; margin-right: 4px;"></i>
				              <span style="cursor:pointer" onclick="callNoteBookDetail('${noteBookList.nbno}','${noteBookList.nbtitle}','${noteBookList.mno}')">${noteBookList.nbtitle}</span>
				            </td>
				            <td>홍길동</td>
				            <td>8월 14일</td>
				            <td>${noteBookList.nbtype}</td>
           				 </tr>
						</c:forEach>
					<!-- 노트 뿌리는 부분 -->
					<c:forEach var="noteList" items="${spaceContentsMap.noteList}" varStatus="i">
                        <tr>
    						<td style="padding-left: 38px;"><i class="fas fa-book" style="font-size: 20px; margin-right: 10px;"></i><span style="cursor:pointer" onclick="callNoteDetail('${noteList.spaceno}','${noteList.nno}')">${noteList.ntitle}</span></td>
                            <td>${noteList.nwriter}</td>
                            <td></td>
                            <td>${noteList.sharescope}</td>
                        </tr>
                    </c:forEach>
                  
                  
						
					
                    </tbody>
                </table>


            </div>
            </div>

	</div>
	</div>
</body>

<script>

	
	var find=true;
	var i;
	var obj;
	$(function(){ // 처음 페이지 열 때
		$('.noteCheck').eq(0).prop('checked',true);
		i=$('.noteCheck').eq(0).val();
		obj=$('.noteCheck').eq(0);
		console.log(i+"/"+obj);
		check($('.noteCheck').eq(0).prop('checked'),obj);
	});
	
	$('.noteCheck').click(function(){ // 노트 선택 시 
		i = $(this).val();
		console.log(i);
		
		var checked = $(this).prop('checked');
		obj = $(this);
		console.log(checked);
		
		check(checked,obj);
		
	});
	
	function check(checked,obj){
		if(checked){
			$('.noteCheck').prop('checked', false);
			obj.prop('checked', true);
			
			$.ajax({
				url:'${pageContext.request.contextPath}/note/noteDetail.do',
				data:{nno:i},
				dataType:'json',
				success:function(data){
					$('#ntitle').val(data.ntitle);
					if(find) $('#ncontent').html(data.ncontent);
					else tinyMCE.activeEditor.setContent(data.ncontent);
					find=false;
				},error : function(request,status,error){
    			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    			}
			});
		}
	}
	
	
	function deleteOneNote(){
		location.href="${pageContext.request.contextPath}"
            +"/note/goBackTrash.do?nno="+i+"&trashcan=Y";
	}
	
	function deleteAllNote(){
		location.href="${pageContext.request.contextPath}"
            +"/note/goAllTrash.do?mno=1&trashcan=Y";
	}
	function saveNote(){
		var ntitle = $('#ntitle').val();
		var ncontent = tinyMCE.activeEditor.getContent();
		$.ajax({
			url:'${pageContext.request.contextPath}/note/saveNote.do',
			type: 'POST',
			data:{nno:i,ntitle:ntitle,ncontent:ncontent},
			dataType:'json',
			success:function(data){
				if(data){
					alert("저장성공");
					console.log(obj.parent().children(1).text().trim());
					obj.parent().children(1).text(ntitle);
				}else{
					alert("저장실패");}				
				
			},error : function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
function goTrash(){
		
		$.ajax({
			url:'${pageContext.request.contextPath}/notebook/trashGo.do',
			type: 'POST',
			data:{nno:i,trashcan:"Y"},
			dataType:'json',
			success:function(data){
				if(data){
					//alert("삭제성공");
					obj.parent().remove();
					$('.noteCheck').eq(0).prop('checked',true);
					check($('.noteCheck').eq(0).prop('checked'),$('.noteCheck').eq(0));
				}else{
					alert("삭제실패");}				
				
			},error : function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
$(document).ready(function () {

    $(".topnav").hover(function () {                    //마우스를 topnav에 오버시
        $(this).parent().find(".subnav").slideDown('normal').show();                   //subnav가 내려옴.
        $(this).parent().hover(function () {
        }, function () {
            $(this).parent().find(".subnav").slideUp('fast');                 //subnav에서 마우스 벗어났을 시 원위치시킴  
        });
    });

});  





      //편집 누르면 편집 버튼이 사라지고 추가, 삭제 btn show.
    function space_edit(){
      

      $("#space_add_id").show();
      $("#space_delete_id").show();
      
      

      $("#space_right_first_div").show();
      $("#space_edit_id").hide();
      $("#space_cencel_id").show();
      
      $("#space_right_first_div2").hide();
      }
      
      //취소 버튼 클릭시 편집 버튼 있는 초기 div show
      function space_cencel(){
      

      $("#space_add_id").hide();
      $("#space_delete_id").hide();
      


      $("#space_right_first_div").hide();
      $("#space_edit_id").show();
      $("#space_cencel_id").hide();
      $("#space_right_first_div2").show();
      }
      
      function space_add(){      
        
        $('input:checkbox').each(function(){
          
          if($(this).prop('checked')){
        	  var nno = $(this).val();
        	
        	  $.ajax({
        		 url : "${pageContext.request.contextPath}/space/noteFix.do?nno="+nno,
        		 type : 'get',
        		 success : function(){
    
        		 }
        	  });
          }else{
			var nno = $(this).val();  
			console.log(nno);
        	  $.ajax({
        		 url : "${pageContext.request.contextPath}/space/noteNotFix.do?nno="+nno,
        		 type : 'get',
        		 success : function(){
    
        		 }
        	  });
          }
          
        });
		
        $.ajax({
        	url : "${pageContext.request.contextPath}/space/selectFixedNoteList.do",
        	type : "get",
        	resultType : 'json',
        	success : function(data){
        		$('#space_right_first_div2').children().remove();
        		
        		data.forEach(function(value){
        			$('#space_right_first_div2').append("<div id='space_r_list' class='col-lg-4 col-md-4 col-xs-4'><i class='far fa-list-alt'></i> <span id='space_r_list_title' style='cursor:pointer;'>"+value.ntitle+"</span></div>");
        		});
     
        		
        	}
        	
        	
        	
        	
        });
       
        $("#space_add_id").hide();
        $("#space_delete_id").hide();
        $("#space_right_first_div").hide();
        $("#space_cencel_id").hide();

     
        $("#space_edit_id").show();
        $("#space_r_list").show();
        $("#space_right_first_div2").show();
     
        } // 노트고정 편집끝
    
        //삭제 시 
        function space_delete() {
            var checkedCount = 0;
        $('input:checkbox').each(function(){
          $(this).prop('checked') && checkedCount ++;
        });

        if(checkedCount > 0){
                var space_delete_confirm = confirm("정말 삭제하시겠어요?");
                if (space_delete_confirm == true) {
                  //document.write(close);

                  $('input:checkbox').each(function(){
                      if($(this).prop('checked')){
                        $(this).parent().parent().remove();
                      }
                    
                  });
                    $("#space_add_id").hide();
                  $("#space_delete_id").hide();
                  $("#space_right_first_div").hide();

                  $("#space_edit_id").show();
                  $("#space_rlist").show();
                  $("#space_cencel_id").hide();
                  $("#space_right_first_div2").show();

                } else if (space_delete_confirm == false) {
                  //document.write(close);

                }
              }
               
            }
         
        function callNoteDetail(spaceno,nno){
        	
        	
        	location.href ="${pageContext.request.contextPath}/space/spaceNoteDetail.do?spaceno="+spaceno+"&nno="+nno;
        }

        function callNoteBookDetail(nbno,nbtitle,mno){

        	location.href ="${pageContext.request.contextPath}/notebook/goNotebook.do?nbno="+nbno+"&mno="+mno+"&nbtitle="+nbtitle;
        }
	</script>

</html>