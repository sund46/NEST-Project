<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath }/resources/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath }/resources/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Now UI Dashboard by Creative Tim</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/assets/css/now-ui-dashboard.css?v=1.3.0"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link
	href="${pageContext.request.contextPath }/resources/assets/demo/demo.css"
	rel="stylesheet" />

<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>

<style>
.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
/* Float the list items side by side */
.tab div {
	float: left;
}
/* Style the links inside the list items */
.tab div {
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}
/* Style the tab content */
.tabcontent {
	display: none;
	background-color: white;
	padding: 6px 12px;
	color: black;
}

div.tab div.selected {
	background-color: white;
	color: black;
}

.tabcontent.selected {
	display: block;
}

/* th font-size */
thead.text-primary tr th {
	font-size: 17px;
}
</style>

</head>

<body class="">
	<div class="wrapper ">
		<!-- Sidebar -->
		<c:import url="../../common/setting_sidebar.jsp" />

		<div class="main-panel" id="main-panel">
			<!-- Navbar -->
			<c:import url="../../common/setting_navbar.jsp" />
			<!-- End Navbar -->

			<div class="panel-header panel-header-sm"></div>
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card" style="height: 550px;">
							<div class="card-header">
								<h4 class="card-title">스페이스 관리</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive"style="width:100%; height:450px; overflow:auto">
									<table class="table table-striped">
										<thead class="text-primary">
											<tr style="color: #e7722e">
												<th class="text-center"></th>
												<th>스페이스명</th>
												<th>권한</th>
												<th>회원 수</th>
												<th>스페이스 설정</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${ selectBusinessSpaceList }" var="bs">
												<tr>
													<td class="text-center"><input hidden type="text"
														value="${ bs.spaceNo }" name="spaceNo"></td>
													<td>
														<%-- <a class="view" style="color: black;"
														href="${pageContext.request.contextPath}/space/spaceMemberList.do?spaceNo=${ bs.spaceNo }">
														${ bs.spaceName }
														<a hidden value="${ bs.spaceNo }"></a>
														</div>
														<div class="fold" style="display: none; margin-top:10px; color: grey;">
								                           		<c:forEach items="${ spaceMemberList }" var="sm">
								                           		${ sm.userName } </br>
								                           		</c:forEach>
								                        </a> --%>
														<a class="view" style="color: black; cursor: pointer;">
														${ bs.spaceName }
														</a>
														<div class="table-row smList" style="display: none; margin-top: 10px;"></div>
														<%-- <a hidden value="${ bs.spaceNo }"></a>
														</div>
														<div class="fold" style="display: none; margin-top:10px; color: grey;">
								                           		<c:forEach items="${ spaceMemberList }" var="sm">
								                           		${ sm.userName } </br>
								                           		</c:forEach> --%>
								                        
													</td>
														<td style="width: 25%">
														<div class="dropdown">
															<a  data-toggle="dropdown" style="color: black; cursor: pointer;" href="">
															<c:if test="${ bs.rightSet eq 'R1' }">
															접근 권한
															</c:if>
															<c:if test="${ bs.rightSet eq 'R2' }">
															보기 권한
															</c:if>
															<c:if test="${ bs.rightSet eq 'R3' }">
															수정 권한
															</c:if>
															<c:if test="${ bs.rightSet eq 'R4' }">
															수정 및 다른사용자 권한
															</c:if>
															</a>
															
															<div class="dropdown-menu">
														      <a class="dropdown-item" href="${pageContext.request.contextPath}/space/updateRightSetR1.do?spaceNo=${ bs.spaceNo }">접근 권한</a>
														      <a class="dropdown-item" href="${pageContext.request.contextPath}/space/updateRightSetR2.do?spaceNo=${ bs.spaceNo }">보기 권한</a>
														      <a class="dropdown-item" href="${pageContext.request.contextPath}/space/updateRightSetR3.do?spaceNo=${ bs.spaceNo }">수정 권한</a>
														      <a class="dropdown-item" href="${pageContext.request.contextPath}/space/updateRightSetR4.do?spaceNo=${ bs.spaceNo }">수정 및 초대 권한</a>
														    </div>
														</div>
														</td>
													<td>회원 수</td>
													<td style="width: 30%">
													<c:if test="${ bs.rightSet eq 'R4' }">
														<button class="btn btn-info" data-toggle="modal"
															data-target="#myModal">회원초대</button>
														<!-- <button class="btn">모두 삭제</button> -->
														</c:if>
														<button type="button" class="btn btn-success"
															onclick="location.href='${pageContext.request.contextPath}/space/insertSpaceMember.do?spaceNo=${ bs.spaceNo }'">가입</button>
														<button type="button" class="btn"
															onclick="location.href='${pageContext.request.contextPath}/space/deleteSpace.do?spaceNo=${ bs.spaceNo }'">삭제</button>
													</td>
												</tr>
												
												<!-- The Modal -->
									<form method="post"
										action="${pageContext.request.contextPath}/space/insertSpaceMemberAdd.do?spaceNo=${ bs.spaceNo }">
										<div class="modal" id="myModal">
											<div class="modal-dialog">
												<div class="modal-content">

													<!-- Modal Header -->
													<div class="modal-header">
														<h4 class="modal-title">스페이스 회원 추가</h4>
														<button type="button" class="close" data-dismiss="modal">&times;</button>
													</div>

													<!-- Modal body -->
													<div class="modal-body">
														<label class="col-md-3 col-form-label">회원 아이디
														</label>
														<div class="col-md-11">
															<div class="form-group">
																<input type="email" class="form-control" id="userId" name="userId">
															</div>
														</div>
													</div>

													<!-- Modal footer -->
													<div class="modal-footer">
														<button type="submit" class="btn btn-info">추가</button>
													</div>
													
													</div>
										    </div>
										  </div>
										  </form>
										  
										  <script>  
						                      $(".view").click(function(){
						                           if($(this).next().css("display") == "none") {
						                              $(this).next().show('10000');
						                              $(this).next().show();
						                              
						                              $.ajax({
								                    		 url : "${pageContext.request.contextPath}/space/spaceMemberList.do",
								                    		 data : {spaceNo : ${bs.spaceNo}},
								                    		 dataType : "json",
								                    		 success : function(data){
								                    			 $('.smList').children().remove();
							                                	 $('.smList').html("");
								                                 data.forEach(function(value){
								                                	console.log(value);
								                                	 $('.smList').append(
													              			   value.userName +"&nbsp;"
													            			   +value.enrollDate
													            			   +"<a href='${pageContext.request.contextPath}/space/deleteSpaceMember.do?mNo="+value.mNo+"'>"
													            			   +"<i style='color: red;' class='now-ui-icons ui-1_simple-remove'></i>"
													            			   +"</a> </br>");
								                                	
								                                	 
								                                	 
								                                 });
								                                 
								                    			
													            			   /* +"<a style='color: grey;' data-toggle='dropdown' href='#'>"
													            			   + value.mRightSet +"권한</a>&nbsp;"  */
											            		
											            			   /* '<c:forEach items="${ spaceMemberList }" var="sm">
																	   ${ sm.userName }  &nbsp;
																	   <a style="color: grey;" data-toggle="dropdown" href="#">
																	   		${sm.mRightSet } 권한
																	   </a>
																	   &nbsp; ${ sm.enrollDate }
																	   <a href="${pageContext.request.contextPath}/space/deleteSpaceMember.do?mNo=${ sm.mNo }">
																	   <i style="color: red;" class="now-ui-icons ui-1_simple-remove"></i>
																	   </a> </br>
																	   </c:forEach>' */
								                    					
								                    			 
								                    			 
								                    		 }
								                    	 });
						                              
						                           } else {
						                              $(this).next().hide();
						                           }
						                        });
						                      
						                      $(function(){
						                    	 
						                      });
					                     </script>
										  
											</c:forEach>
										</tbody>
									</table>

												</div>
											</div>
										</div>
								</div>

							</div>
						</div>

						<footer class="footer">
							<div class="container-fluid">
								<nav>
									<ul>
										<li><a href="https://www.creative-tim.com"> Creative
												Tim </a></li>
										<li><a href="http://presentation.creative-tim.com">
												About Us </a></li>
										<li><a href="http://blog.creative-tim.com"> Blog </a></li>
									</ul>
								</nav>
								<div class="copyright" id="copyright">
									&copy;
									<script>
										document
												.getElementById('copyright')
												.appendChild(
														document
																.createTextNode(new Date()
																		.getFullYear()))
									</script>
									, Designed by <a href="https://www.invisionapp.com"
										target="_blank">Invision</a>. Coded by <a
										href="https://www.creative-tim.com" target="_blank">Creative
										Tim</a>.
								</div>
							</div>
						</footer>
					</div>
				</div>
				<!--   Core JS Files   -->
				<script
					src="${pageContext.request.contextPath }/resources/assets/js/core/jquery.min.js"></script>
				<script
					src="${pageContext.request.contextPath }/resources/assets/js/core/popper.min.js"></script>
				<script
					src="${pageContext.request.contextPath }/resources/assets/js/core/bootstrap.min.js"></script>
				<script
					src="${pageContext.request.contextPath }/resources/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
				<!--  Google Maps Plugin    -->
				<script
					src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
				<!-- Chart JS -->
				<script
					src="${pageContext.request.contextPath }/resources/assets/js/plugins/chartjs.min.js"></script>
				<!--  Notifications Plugin    -->
				<script
					src="${pageContext.request.contextPath }/resources/assets/js/plugins/bootstrap-notify.js"></script>
				<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
				<script
					src="${pageContext.request.contextPath }/resources/assets/js/now-ui-dashboard.min.js?v=1.3.0"
					type="text/javascript"></script>
				<!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
				<script
					src="${pageContext.request.contextPath }/resources/assets/demo/demo.js"></script>
</body>

</html>