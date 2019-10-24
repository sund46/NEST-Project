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
.ManageUsers-TabBar {
	display: flex;
	margin-top: 12px;
	position: relative;
}

.ManageUsers-Tab {
	box-sizing: border-box;
	flex-grow: 1;
	flex-basis: 0;
	padding-bottom: 8px;
	cursor: pointer;
	-o-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	-webkit-user-select: none;
	user-select: none;
	min-height: 35px;
	border-bottom: 2px solid #ebebeb;
	background-color: #ffffff;
	outline: none;
	font-family: helvetica, arial, sans-serif, -apple-system,
		BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen', 'Ubuntu',
		'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue', sans-serif;
	font-style: normal;
	font-weight: 500;
	font-size: 10px;
	color: #ababab;
	text-transform: uppercase;
	vertical-align: middle;
	text-align: center;
}

.ManageUsers-Tab.selected {
	padding-bottom: 7px;
	border-color: #e7722e ;
	border-width: 3px;
	text-decoration: none;
	color: #e7722e ;
}

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
		<c:import url="../common/setting_sidebar.jsp" />

		<div class="main-panel" id="main-panel">
			<!-- Navbar -->
			<c:import url="../common/setting_navbar.jsp" />
			<!-- End Navbar -->

			<div class="panel-header panel-header-sm"></div>
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card" style="height: 550px;">
							<div class="card-header">
								<h4 class="card-title">사용자 관리</h4>
							</div>
							<div class="card-body">
								<div class="ManageUsers-TabBar tab">
									<div class="ManageUsers-Tab" data-tab="tab1">요청 </div>
									<div class="ManageUsers-Tab selected" data-tab="tab2">사용자 </div>
									<div class="ManageUsers-Tab" data-tab="tab3">관리자</div>
								</div>

								<div id="tab1" class="tabcontent">
									<!-- <p>tab1 content</p> -->
									<div class="table-responsive" style="width:100%; height:390px; overflow:auto">
										<table class="table table-striped">
											<thead class="text-primary">
												<tr style="color: #e7722e">
													<th class="text-center"></th>
													<th class="text-center">사용자명</th>
													<th class="text-center">이메일</th>
													<th class="text-center">초대 수락 여부</th>
													<th class="text-center"></th>
												</tr>
											</thead>
											<tbody>
												<form action="${ pageContext.request.contextPath }/business/approvalStatusY.do" method="post">
												<c:forEach items="${ memberApprovalStatusN }" var="mN">
												<tr>
													<td class="text-center"></td>
													<td class="text-center">${ mN.userName }</td>
													<td class="text-center">${ mN.userId }</td>
													<td class="text-center">
														<input hidden type="text" value="${mN.mNo}" name="mNo">
														${ mN.invitation }
													</td>
													<td class="text-center">
														<c:if test="${ mN.invitation eq 'Y' }">
														<button class="btn btn-primary btn-block"
																type="submit" style="font-size: 13px;">승인</button>
														</c:if>
														<c:if test="${ mN.invitation eq 'N' }">
														<button class="btn btn-primary btn-block"
																type="button" style="font-size: 13px; background:#e7722e"
																onclick="location.href='${ pageContext.request.contextPath }/business/deleteBM.do?mNo=${mN.mNo}'">초대 취소</button>
														</c:if>
													</td>
												</tr>
												</c:forEach>
												</form>
												</tbody>
										</table>
									</div>
								</div>

								<div id="tab2" class="tabcontent selected">
									<!-- <p>tab2 content</p> -->
									<div class="table-responsive" style="width:100%; height:390px; overflow:auto">
										<table class="table table-striped">
											<thead class="text-primary">
												<tr style="color: #e7722e">
													<th class="text-center"></th>
													<th class="text-center">사용자명</th>
													<th class="text-center">이메일</th>
													<th class="text-center">관리자 여부</th>
													<th class="text-center">가입일</th>
													<th class="text-center">설정</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${ memberApprovalStatusY }" var="mY">
												<tr>
													<td class="text-center"></td> 
													<td class="text-center">${ mY.userName }</td>
													<td class="text-center">${ mY.userId }</td>
													<td class="text-center">
														<a  data-toggle="dropdown" style="color: black; cursor: pointer;" href="">
														${ mY.admin }
														</a>
													</td>
													<td class="text-center">${ mY.spaceEnrollDate }</td>
													<td class="text-center">
														<button class="btn btn-primary btn-block"
																type="button" style="font-size: 13px; background:#e7722e" 
																onclick="location.href='${pageContext.request.contextPath}/business/bmAdminY.do?mNo=${ mY.mNo }'">관리자 권한 부여</button>
													</td>
												</tr>
												</c:forEach>
												</tbody>
										</table>
									</div>
								</div>
								
								

								<div id="tab3" class="tabcontent">
									<!-- <p>tab3 content</p> -->
									<div class="table-responsive" style="width:100%; height:390px; overflow:auto">
										<table class="table table-striped">
											<thead class="text-primary">
												<tr style="color: #e7722e">
													<th class="text-center"></th>
													<th class="text-center">사용자명</th>
													<th class="text-center">이메일</th>
													<th class="text-center">관리자 여부</th>
													<th class="text-center">가입일</th>
													<th class="text-center">설정</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${ activeListN }" var="a">
												<tr>
													<td class="text-center"></td>
													<td class="text-center">${ a.userName }</td>
													<td class="text-center">${ a.userId }</td>
													<td class="text-center">${ a.admin }</td>
													<td class="text-center">${ a.spaceEnrollDate }</td>
													<td class="text-center">
														<button class="btn btn-primary btn-block"
																type="button" style="font-size: 13px; background:#e7722e"
																onclick="location.href='${pageContext.request.contextPath}/business/bmAdminN.do?mNo=${ a.mNo }'">관리자 권한 취소</button>
													</td>
												</tr>
												</c:forEach>
												</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>
					</div>

					<script>
						$(function() {
							$('div.tab div').click(function() {
								var activeTab = $(this).attr('data-tab');
								$('div.tab div').removeClass('selected');
								$('.tabcontent').removeClass('selected');
								$(this).addClass('selected');
								$('#' + activeTab).addClass('selected');
							})
						});
					</script>

				</div>
			</div>
			<footer class="footer">
				<div class="container-fluid">
					<nav>
						<ul>
							<li><a href="https://www.creative-tim.com"> Creative Tim
							</a></li>
							<li><a href="http://presentation.creative-tim.com">
									About Us </a></li>
							<li><a href="http://blog.creative-tim.com"> Blog </a></li>
						</ul>
					</nav>
					<div class="copyright" id="copyright">
						&copy;
						<script>
							document.getElementById('copyright').appendChild(
									document.createTextNode(new Date()
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
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
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