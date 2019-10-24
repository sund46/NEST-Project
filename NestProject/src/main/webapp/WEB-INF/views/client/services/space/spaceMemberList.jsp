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
</head>
<body>

	<div class="wrapper ">
		<!-- Sidebar -->
		<c:import url="../../common/setting_sidebar.jsp" />

		<div class="main-panel" id="main-panel">
			<!-- Navbar -->
			<%-- <c:import url="../../common/setting_navbar.jsp" /> --%>
			<!-- End Navbar -->
			
			
			<div class="fold" style="margin-top:10px; color: grey;">
			   <c:forEach items="${ spaceMemberList }" var="sm">
			   ${ sm.userName }  &nbsp;
			   <a style="color: grey;" data-toggle="dropdown" href="#">
			   		${sm.mRightSet } 권한
			   </a>
			   &nbsp; ${ sm.enrollDate }
			   <a href="${pageContext.request.contextPath}/space/deleteSpaceMember.do?mNo=${ sm.mNo }">
			   <i style="color: red;" class="now-ui-icons ui-1_simple-remove"></i>
			   </a> </br>
			   </c:forEach>
			   
			   <!-- <div class="dropdown-menu">
			      <a class="dropdown-item" href="#">보기 권한</a>
			      <a class="dropdown-item" href="#">수정 권한</a>
			      <a class="dropdown-item" href="#">수정 및 초대 권한</a>
			    </div> -->
			</div>
			
			
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