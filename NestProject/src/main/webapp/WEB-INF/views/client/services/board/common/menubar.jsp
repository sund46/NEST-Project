<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"></script>
<script src="https://cdn.tiny.cloud/1/thfe5r10bknp9pbzrorb1rah5doyys51i6hsjncezu0tpruv/tinymce/5/tinymce.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/ko_KR.js"></script>
<!-- Custom fonts for this template-->
<link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">

<style>
@font-face { font-family: 'Godo'; font-style: normal; font-weight: 400; src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff') format('woff'); } @font-face { font-family: 'Godo'; font-style: normal; font-weight: 700; src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoB.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoB.woff') format('woff'); } .godo * { font-family: 'Godo', sans-serif; }
      * {font-family: 'Godo';}
</style>

</head>


<body id="page-top">

	<!-- Sidebar -->
	<ul
		class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" style="background:#3B332E;"
		id="accordionSidebar">

		<!-- Sidebar - 메인로고 부분 -->
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/board/board.do?mNo=${member.mNo}">
			<div class="sidebar-brand-text mx-3">
				<img src="/nest/resources/images/nest_wlogo.png" id="center-image" alt="스프링로고" style="width: 150px; height: auto;">
			</div>
		</a>

		<!-- Divider -->
		<hr class="sidebar-divider my-0">

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading" style=" font-size:14px;color:#e7722e;">카테고리</div>

		<!-- Nav Item - 연예/방송 카테고리 -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseBoardcast"
			aria-expanded="true" aria-controls="collapseBoardcast"> <i
				class="fas fa-fw fa-folder"></i> <span style=" font-size:16px;">연예/방송</span>
		</a>
			<div id="collapseBoardcast" class="collapse"
				aria-labelledby="headingTwo" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded" >
					<h6 class="collapse-header" style=" font-size:16px;color:#e7722e;">연예</h6>
					<div style="padding:6px;">
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c1&cate2_code=c11">가수</a> 
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c1&cate2_code=c12">배우</a> 
					</div>
					<h6 class="collapse-header" style=" font-size:16px;color:#e7722e;">방송</h6>
					<div style="padding:6px;">
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c1&cate2_code=c13">사회/시사</a> 
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c1&cate2_code=c14">다큐멘터리</a> 
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c1&cate2_code=c15">예능 프로그램</a>
					</div>
					<hr class="sidebar-divider" color='lightgray'>
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c1&cate2_code=c16" >기타</a>
				</div>
			</div></li>

		<!-- Nav Item - 스포츠 -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseSport"
			aria-expanded="true" aria-controls="collapseSport"> <i
				class="fas fa-fw fa-folder"></i> <span style=" font-size:16px;">스포츠</span>
		</a>
			<div id="collapseSport" class="collapse"
				aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header"style=" font-size:16px;color:#e7722e;">스포츠</h6>
					<div style="padding:6px;">
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c2&cate2_code=c21">축구</a>
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c2&cate2_code=c22">야구</a> 
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c2&cate2_code=c23">농구</a> 
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c2&cate2_code=c24">골프</a>
					</div>
					<hr class="sidebar-divider" color ='lightgray'>
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c2&cate2_code=c25">기타</a>
				</div>
			</div></li>

		<!-- Nav Item - 교육/금융/IT -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseEdu"
			aria-expanded="true" aria-controls="collapseEdu"> <i
				class="fas fa-fw fa-folder"></i> <span style=" font-size:16px;">교육/금융/IT</span>
		</a>
			<div id="collapseEdu" class="collapse"
				aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header"  style=" font-size:16px;color:#e7722e;">교육</h6>
					<div style="padding:6px;">
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c3&cate2_code=c31">자격증</a> 
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c3&cate2_code=c32">공무원</a>
					</div>
					<h6 class="collapse-header"  style=" font-size:16px;color:#e7722e;">금융</h6>
					<div style="padding:6px;">
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c3&cate2_code=c33">주식</a> 
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c3&cate2_code=c34">부동산</a>
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c3&cate2_code=c35">비트코인</a>
					</div>
					<h6 class="collapse-header"  style=" font-size:16px;color:#e7722e;">IT</h6>
					<div style="padding:6px;">
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c3&cate2_code=c36">프로그래밍</a>
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c3&cate2_code=c37">컴퓨터 부품</a>
					</div>
					<hr class="sidebar-divider" color ='lightgray'>
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c3&cate2_code=c38">기타</a>

				</div>
			</div></li>

		<!-- Nav Item - 여행/음식/생물 -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseTrv"
			aria-expanded="true" aria-controls="collapseTrv"> <i
				class="fas fa-fw fa-folder"></i> <span style=" font-size:16px;">여행/음식</span>
		</a>
			<div id="collapseTrv" class="collapse"
				aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header"  style=" font-size:16px;color:#e7722e;">여행</h6>
					<div style="padding:6px;">
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c4&cate2_code=c41">여행</a> 
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c4&cate2_code=c42">워킹홀리데이</a>
					</div>
					<h6 class="collapse-header"  style=" font-size:16px;color:#e7722e;">음식</h6>
					<div style="padding:6px;">
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c4&cate2_code=c43">외식</a> 
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c4&cate2_code=c44">요리</a>
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c4&cate2_code=c45">디저트</a> 
					</div>
					<hr class="sidebar-divider" color ='lightgray'>
					<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c4&cate2_code=c46">기타</a>
				</div>
			</div></li>

		<!-- Nav Item - 취미/생활 카테고리 -->
		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseHobby"
			aria-expanded="true" aria-controls="collapseHobby"> <i
				class="fas fa-fw fa-folder"></i> <span style=" font-size:16px;">취미/생활</span>
		</a>
		<div id="collapseHobby" class="collapse"
			aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header" style=" font-size:16px;color:#e7722e;">취미</h6>
				<div style="padding:6px;">
				<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c5&cate2_code=c51">영화</a> 
				<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c5&cate2_code=c52">콘서트</a> 
				<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c5&cate2_code=c53">낚시</a>
				</div>
				<h6 class="collapse-header" style=" font-size:16px;color:#e7722e;">생활 </h6>
				<div style="padding:6px;">
				<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c5&cate2_code=c54">쇼핑</a> 
				<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c5&cate2_code=c55">데이트</a>
				</div>
				<hr class="sidebar-divider" color ='lightgray'>
				<a class="collapse-item" href="${pageContext.request.contextPath}/board/boardList.do?cate1_code=c5&cate2_code=c56">기타</a>

			</div>
		</div></li>


		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading" style=" font-size:14px;color:#e7722e;">기타</div>

		<!-- Nav Item - Tables -->
		<li class="nav-item"><a class="nav-link" href=""> <i
				class="fas fa-fw fa-cog"></i> <span style=" font-size:16px;">설정</span></a></li>

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>

	</ul>
	<!-- End of Sidebar -->

	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content" style="flex:0;">

			<!-- Topbar -->
			<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				<!-- Sidebar Toggle (Topbar) -->
				<button id="sidebarToggleTop"
					class="btn btn-link d-md-none rounded-circle mr-3">
					<i class="fa fa-bars"></i>
				</button>

				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">

					<!-- Nav Item - Search Dropdown (Visible Only XS) -->
					<li class="nav-item dropdown no-arrow d-sm-none"><a
						class="nav-link dropdown-toggle" href="#" id="searchDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
					</a> <!-- Dropdown - Messages -->
						<div
							class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
							aria-labelledby="searchDropdown">
							<form class="form-inline mr-auto w-100 navbar-search">
								<div class="input-group">
									<input type="text"
										class="form-control bg-light border-0 small"
										placeholder="Search for..." aria-label="Search"
										aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button class="btn btn-primary" type="button">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</form>
						</div></li>

					<!-- Nav Item - Alerts -->
					<li class="nav-item dropdown no-arrow mx-1"><a
						class="nav-link dropdown-toggle" href="#" id="alertsDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
							<span class="badge badge-danger badge-counter">3+</span>
					</a> <!-- Dropdown - Alerts -->
						<div
							class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="alertsDropdown">
							<h6 class="dropdown-header">Alerts Center</h6>
							<a class="dropdown-item d-flex align-items-center" href="#">
								<div class="mr-3">
									<div class="icon-circle bg-primary">
										<i class="fas fa-file-alt text-white"></i>
									</div>
								</div>
								<div>
									<div class="small text-gray-500">December 12, 2019</div>
									<span class="font-weight-bold">새로운 알림이 있습니다</span>
								</div>
							</a> <a class="dropdown-item d-flex align-items-center" href="#">
								<div class="mr-3">
									<div class="icon-circle bg-success">
										<i class="fas fa-donate text-white"></i>
									</div>
								</div>
								<div>
									<div class="small text-gray-500">December 7, 2019</div>
									새로운 알림이 있습니다
								</div>
							</a> <a class="dropdown-item d-flex align-items-center" href="#">
								<div class="mr-3">
									<div class="icon-circle bg-warning">
										<i class="fas fa-exclamation-triangle text-white"></i>
									</div>
								</div>
								<div>
									<div class="small text-gray-500">December 2, 2019</div>
									새로운 알림이 있습니다
								</div>
							</a> <a class="dropdown-item text-center small text-gray-500"
								href="#">Show All Alerts</a>
						</div></li>

					<!-- Nav Item - Messages -->
					<li class="nav-item dropdown no-arrow mx-1"><a
						class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
							<!-- Counter - Messages --> 
						<span class="badge badge-danger badge-counter">7</span>
					</a> <!-- Dropdown - Messages -->
						<div
							class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="messagesDropdown">
							<h6 class="dropdown-header">Message Center</h6>
							<a class="dropdown-item d-flex align-items-center" href="#">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle"
										src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
									<div class="status-indicator bg-success"></div>
								</div>
								<div class="font-weight-bold">
									<div class="text-truncate">Hi there! I am wondering if
										you can help me with a problem I've been having.</div>
									<div class="small text-gray-500">Emily Fowler · 58m</div>
								</div>
							</a> <a class="dropdown-item d-flex align-items-center" href="#">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle"
										src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
									<div class="status-indicator"></div>
								</div>
								<div>
									<div class="text-truncate">I have the photos that you
										ordered last month, how would you like them sent to you?</div>
									<div class="small text-gray-500">Jae Chun · 1d</div>
								</div>
							</a> <a class="dropdown-item d-flex align-items-center" href="#">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle"
										src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
									<div class="status-indicator bg-warning"></div>
								</div>
								<div>
									<div class="text-truncate">Last month's report looks
										great, I am very happy with the progress so far, keep up the
										good work!</div>
									<div class="small text-gray-500">Morgan Alvarez · 2d</div>
								</div>
							</a> <a class="dropdown-item d-flex align-items-center" href="#">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle"
										src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
									<div class="status-indicator bg-success"></div>
								</div>
								<div>
									<div class="text-truncate">Am I a good boy? The reason I
										ask is because someone told me that people say this to all
										dogs, even if they aren't good...</div>
									<div class="small text-gray-500">Chicken the Dog · 2w</div>
								</div>
							</a> <a class="dropdown-item text-center small text-gray-500"
								href="#">Read More Messages</a>
						</div></li>

					<div class="topbar-divider d-none d-sm-block"></div>

					<!-- Nav Item - User Information -->
					<!-- 현재 로그인한 아이디를 보여주기 위함-->
					<li class="nav-item dropdown no-arrow"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <span
							class="mr-2 d-none d-lg-inline text-gray-600 small">NEST</span>
							<img class="img-profile rounded-circle"
							src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
					</a> <!-- Dropdown - User Information -->
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="userDropdown">
							<a class="dropdown-item" href="#"> <i
								class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 프로필
							</a> <a class="dropdown-item" href="#"> <i
								class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> 정보수정
							</a> <a class="dropdown-item" href="#"> <i
								class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 활동기록
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#" data-toggle="modal"
								data-target="#logoutModal"> <i
								class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								로그아웃
							</a>
						</div>
					</li>

				</ul>

			</nav>
			<!-- End of Topbar -->
		</div>
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top">
		 <i class="fas fa-angle-up"></i>
		</a>
		
		<!-- Logout Modal-->
		<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까??</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">로그아웃을 하시면 글을 작성하시거나 댓글을 남기실 수 없습니다.</div>
					<div class="modal-footer">
						<a class="btn btn-primary" href="login.html">로그아웃</a>
						<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Bootstrap core JavaScript-->
		<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
		<!-- Custom scripts for all pages-->
		<script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
			
</body>

</html>
			