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
		<div class="w" style="padding:15px;height: 800px;">
					<div style="padding:10px 0">
						<h4>노트북 목록</h4>
					</div>
					<table class="table">
						<colgroup>
							<col width="50%"/>
							<col width="30%"/>
							<col width="10%"/>
							<col width="10%"/>
						</colgroup>
						
						<style>
							.table .thead-dark th{background-color:#edededbd;border-top:2px solid #858796;border-bottom:#e3e6f0;color:#8587968a;font-weight:500;}
							@font-face { font-family: 'LotteMartHappy'; font-style: normal; font-weight: 400; src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyMedium.woff') format('woff'); } @font-face { font-family: 'LotteMartHappy'; font-style: normal; font-weight: 700; src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyBold.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartHappy/LotteMartHappyBold.woff') format('woff'); } .lottemarthappy * { font-family: 'LotteMartHappy', sans-serif; }
							th{
								font-family : 'LotteMartHappy';
								font-size : 15px;
							}
						</style>
						<thead class="thead-dark">
							<tr>
								<th>제목</th>
                                <th>작성일</th>
                                <th>작성자</th>
                                <th>작업</th>
                                <!-- md를 붙이시면 보통 사이즈 뜻입니다. / 좌측 네비 div에 col 1또는 2를 주시고 
								게시판 div에 11 또는 10/ 가로 숫자 합 12를 맞춰주신 후 th col에 각 각 숫자로 크기 주시면 됩니다.
								부트스트랩에 레이아웃 참조하시면 이해하시는데 큰 도움 될거 같아요 -->
							</tr>
						</thead>
						<tbody class="notebooklist">
							<!-- ${b.count} 는 없어서 우선 이대로 실행 -->
							<c:forEach items="${list}" var="notebook">
							
								<tr class="noteBook">	
									<input class="nbno" type="hidden" value="${notebook.nbno}" />
									<!---좋아요 or 추천 갯수 -->
									<td > 
										<a class="nbtitle" href="${pageContext.request.contextPath}/notebook/goNotebook.do?nbno=${notebook.nbno}&nbtitle=${notebook.nbtitle}&mno=${member.mNo}" style="color: gray;">${notebook.nbtitle}</a>
									</td>
									<td>19/08/14</td>
									<td>${member.userName}</td>
									<td>
										<a
											class="nav-link do" href="#" id="userDropdown"
											role="button" data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false" style="padding:0;"> 
											<i class="fas fa-ellipsis-h" style="color:#858796;"></i>
										</a>
									
										<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
											<a class="dropdown-item" onclick="gochangeTitle()" style="cursor:pointer;"> 노트북 이름바꾸기</a>
											<a class="dropdown-item" onclick="deleteNoteBook()" style="cursor:pointer;"> 노트북 삭제</a>
										</div>
									</td>
									
								</tr>
								
							</c:forEach>
						</tbody>
					</table>
					<c:out value="${pageBar}" escapeXml="false"/>
				</div>
				<!--이름바꾸기 Modal -->
			  <div class="modal fade" id="myModal" role="dialog" >
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content" style="height:269px;transform: translate(-50%, 90%);">
			        <div class="modal-header" style="text-align:left">
			          <h4 class="modal-title">노트북 이름바꾸기</h4>
			          <button type="button" class="close" data-dismiss="modal">×</button>
			        </div>
			        <div class="modal-body">
			          
			          <div class="form-group" >
				    	<input type="text" class="form-control" id="nbtitle" name="spaceName" 
				    	placeholder="이름"  style="height:45px; margin-top:8px;">
				  	  </div>
			          
			        </div>
			        <div class="modal-footer">
			          <button type="submit" class="btn btn-primary" onclick="changeTitle();">만들기</button>
			        </div>
			      </div>
			      
			    </div>
			  </div>
			
			<!-- 노트생성 Modal -->
			  <div class="modal fade" id="myModal2" role="dialog" >
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content" style="height:269px;transform: translate(-50%, 90%);">
			        <div class="modal-header" style="text-align:left">
			          <h4 class="modal-title">새 노트북 만들기</h4>
			          <button type="button" class="close" data-dismiss="modal">×</button>
			        </div>
			        <div class="modal-body">
			          
			          <div class="form-group" >
				    	<input type="text" class="form-control" id="newNbtitle" name="spaceName" 
				    	placeholder="이름"  style="height:45px; margin-top:8px;">
				  	  </div>
			          
			        </div>
			        <div class="modal-footer">
			          <button type="submit" class="btn btn-primary" onclick="insertNotebook()">만들기</button>
			        </div>
			      </div>
			      
			    </div>
			  </div>
			
		
		
	</div>
		<!-- End of Content Wrapper -->

		<!-- End of Page Wrapper -->

 	 <script>
 		$('.noteBook').mouseenter(function(){
 			$('.noteBook').css("background","#fff");
 			$(this).css("background","#ebebeb");
 		});
 		$('.noteBook').mouseleave(function(){
 			$('.noteBook').css("background","#fff");
 		});
 		
 	 
 	 	var nbno;
 	 	var index;
 	 	$('.do').click(function(){
 	 		index = $('.do').index(this);
 	 		nbno = $('.nbno').eq(index).val();
 	 		console.log(index+"/"+nbno);
 	 	});
 	 
 		 function deleteNoteBook(){
	      
	      $.ajax({
	         url:'${pageContext.request.contextPath}/notebook/deleteNoteBook.do',
	         type: 'POST',
	         data:{nbno:nbno},
	         dataType:'json',
	         success:function(data){
	            alert("삭제성공");
	            $('.nbno').eq(index).parent().remove();
	         },error : function(request,status,error){
	             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	         }
	      });
	        
	   }
 		 
 		function changeTitle(){
 				var nbtitle=$('#nbtitle').val();
 		      $.ajax({
 		         url:'${pageContext.request.contextPath}/notebook/changeTitle.do',
 		         type: 'POST',
 		         data:{nbno:nbno, nbtitle:nbtitle},
 		         dataType:'json',
 		         success:function(data){
 		           $("#myModal").modal("hide");
 		            $('.nbtitle').eq(index).text(nbtitle);
 		            
 		         },error : function(request,status,error){
 		             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 		         }
 		      });
 		        
 		   }
 		function insertNotebook(){
				var nbtitle=$('#newNbtitle').val();
				location.href="${pageContext.request.contextPath}/notebook/insertNotebook.do?nbtitle="+nbtitle+"&mno=${member.mNo}";
		      
		        
		   }
 		function gochangeTitle(){
				$("#myModal").modal();
		      
		   }
  
      
	  </script>
</body>

</html>
