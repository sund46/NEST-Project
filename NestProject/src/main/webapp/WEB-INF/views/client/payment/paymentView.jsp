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

<!-- jQuery -->
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
<!-- 아임포트 라이브러리 추가 -->
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- jQuery -->
<!-- node.js -->
<script src="${pageContext.request.contextPath }/resources/js/node.js"></script>
</head>

<body class="user-profile">
	<div class="wrapper ">
	
		<!-- Sidebar -->
    <c:import url="../common/setting_sidebar.jsp"/>
    
    <div class="main-panel" id="main-panel">
      <!-- Navbar -->
      <c:import url="../common/setting_navbar.jsp"/>
      <!-- End Navbar -->
			<div class="panel-header panel-header-sm"></div>
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h5 class="title">Edit Profile</h5>
							</div>
							<div class="card-body">
								<form
									action="https://www.myservice.com/subscription/issue-billing"
									method="post">
									<div>
										<label for="card_number">카드 번호 XXXX-XXXX-XXXX-XXXX</label> <input
											id="card_number" type="text" name="card_number">
									</div>
									<div>
										<label for="expiry">카드 유효기간 YYYY-MM</label> <input id="expiry"
											type="text" name="expiry">
									</div>
									<div>
										<label for="birth">생년월일 YYMMDD</label> <input id="birth"
											type="text" name="birth">
									</div>
									<div>
										<label for="pwd_2digit">카드 비밀번호 앞 두자리 XX</label> <input
											id="pwd_2digit" type="text" name="pwd_2digit">
									</div>
									<!-- <input hidden type="text" value="userId" name="customer_uid"> 
									<input type="submit" value="결제하기"> -->
									<button type="button" onclick="requestPay();">결제하기</button>
								</form>
							</div>
						</div>
					</div>

					<script>
					var IMP = window.IMP; // 생략해도 괜찮습니다.
					IMP.init("imp94672168"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

						function requestPay() {
							var cardNumber = $('#card_number').text();
							var expiry = $('#expiry').text();
							var birth = $('#birth').text();
							var cardPwd = $('#pwd_2digit').text();
							// IMP.request_pay(param, callback) 호출
							IMP.request_pay({ // param 결제 요청에 필요한 속성과 값
							    /* pg: "inicis",
							    pay_method: "card",
							    merchant_uid: "ORD20180131-0000011",
							    name: "노르웨이 회전 의자",
							    amount: 64900,
							    buyer_email: "gildong@gmail.com",
							    buyer_name: "홍길동",
							    buyer_tel: "010-4242-4242",
							    buyer_addr: "서울특별시 강남구 신사동",
							    buyer_postcode: "01181" */
							    
							    customer_uid : "userId"+"_"+cardNumber,
							    checking_amount : 0,
							    card_number : cardNumber,
							    expiry : expiry,
							    birth : birth,
							    customer_uid : cardPwd,
							    pg: "inicis",
							    merchant_uid : "userId"+"_"+(new Date().getTime() / 1000), // 가맹점 주문번호(동일한 주문번호로 중복결제 불가)
								schedule_at : 1564364700,// 결제요청 예약시각 UNIX timestamp
								amount : 100// 결제금액
							    
							}, function(rsp) { // callback 
								// STEP4 가맹점 서버에 imp
								if (rsp.success) {
									// 결제 성공 시 로직,
									console.log("결제 성공");
									
									// jQuery로 HTTP 요청
								    jQuery.ajax({
								        url: "https://api.iamport.kr/subscribe/payments/schedule", // 가맹점 서버
								        method: "POST",
								        headers: { "Content-Type": "application/json" },
								        data: {
								        	customer_uid: "userId"+"_"+cardNumber, // 카드(빌링키)와 1:1로 대응하는 값
								        }
								    }).done(function (data) {
								      // 가맹점 서버 결제 API 성공시 로직
								    })
									
								} else {
									// 결제 실패 시 로직,
									console.log("결제 실패" + rsp.error_msg);
								}
							});
						} 
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