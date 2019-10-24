<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/df37f96d20.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.0.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/styles.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- jQuery -->
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
<!-- STEP1 아임포트 라이브러리 추가 -->
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<title>업그레이드</title>
</head>
<body>



	<div id="topnavbar">
		<div id="up_logo">
			<img
				src="${pageContext.request.contextPath }/resources/images/nest_logo.png">
		</div>

		<div style="float: right; margin-top: 10px; margin-right: 20px;">
			<button type="button" class="btn btn-outline-secondary">노트로이동</button>
			<button type="button" class="btn btn-outline-secondary">고객센터</button>
		</div>
	</div>

	<div class="container" style="margin-top: 80px">
		<h3 style="text-align: center;">
			<b>여러분에게 맞는 서비스를 선택하여 사용할 수 있습니다.</b>
		</h3>
		<div class="card-deck mb-3 text-center" style="margin-top: 50px">
			<div class="card mb-4 shadow-sm">
				<div class="card-header">
					<h4 class="my-0 font-weight-normal">${map.basic.serviceName}</h4>
				</div>
				<div class="card-body">
					<h1 class="card-title pricing-card-title">
						0 원 <small class="text-muted">/ 월</small>
					</h1>
					<ul class="list-unstyled mt-3 mb-4">
						<br>
						<li>누구나 무료로 이용가능합니다.</li>
						<li>지금 바로 노트를 작성해보세요.</li>
					</ul>
					<input hidden type="text" value="${map.basic.serviceNo}" name="customer_uid">
					<button type="button" class="btn btn-lg btn-block btn-outline-primary">무료 이용 서비스</button>
				</div>
			</div>
			<form id="form2" action="${pageContext.request.contextPath}/payment/insertPremiumPayment.do" method="post">
			<div class="card mb-4 shadow-sm">
				<div class="card-header">
					<h4 class="my-0 font-weight-normal">${map.premium.serviceName}</h4>
				</div>
				<div class="card-body">
					<h1 class="card-title pricing-card-title">
						6,000 원 <small class="text-muted">/ 월</small>
					</h1>
					<ul class="list-unstyled mt-3 mb-4">
						<br>
						<li>모든 자료를 정리하세요.</li>
						<br>
					</ul>
					<input hidden type="text" value="${map.premium.serviceNo}" name="customer_uid">
					<button type="button" onclick="requestPay_premium()" 
							class="btn btn-lg btn-block btn-outline-primary">프리미엄으로 업그레이드</button>
				</div>
			</div>
			</form>
			<form id="form3" action="${pageContext.request.contextPath}/payment/insertBusinessPayment.do" method="post">
			<div class="card mb-4 shadow-sm">
				<div class="card-header">
					<h4 class="my-0 font-weight-normal">${map.business.serviceName}</h4>
				</div>
				<div class="card-body">
					<h1 class="card-title pricing-card-title">
						15,000 원 <small class="text-muted">/ 월</small>
					</h1>
					<ul class="list-unstyled mt-3 mb-4">
						<br>
						<li>사람들과 협업해보세요.</li>
						<li>효율적인 똑똑한 서비스</li>
					</ul>
					<input hidden type="text" value="${map.business.serviceNo}" name="customer_uid">
					<button type="button" onclick="requestPay_business()"
							class="btn btn-lg btn-block btn-outline-primary">비즈니스로 업그레이드</button>
				</div>
			</div>
			</form>
			
		</div>
	</div>
	
	<script>
		// STEP2 가맹점 식별하기
		var IMP = window.IMP; // 생략해도 괜찮습니다.
		IMP.init("imp94672168"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

		// STEP3 결제창 호출코드 추가하기
		function requestPay_premium() {
			// IMP.request_pay(param, callback) 호출
			IMP.request_pay({ // param 결제 요청에 필요한 속성과 값
			    pg: "inicis",
			    pay_method: "card",
			    merchant_uid: "userId"+"_"+new Date(),
			    name: "${map.premium.serviceName}",
			    amount: "100", /* ${map.premium.price} */
			    buyer_email: "gildong@gmail.com",
			    buyer_name: "홍길동",
			    buyer_tel: "010-4242-4242",
			    buyer_addr: "서울특별시 강남구 신사동",
			    buyer_postcode: "01181"
			}, function(rsp) { // callback 
				// STEP4 가맹점 서버에 imp
				if (rsp.success) {
					// 결제 성공 시 로직,
					console.log("결제 성공");
				    
				    $('#form2').submit();
				    
				    alert("결제 성공");
					
				} else {
					// 결제 실패 시 로직,
					console.log("결제 실패" + rsp.error_msg);
				}
			});
		}
		
		function requestPay_business() {
			// IMP.request_pay(param, callback) 호출
			IMP.request_pay({ // param 결제 요청에 필요한 속성과 값
			    pg: "inicis",
			    pay_method: "card",
			    merchant_uid: "userId"+"_"+(new Date().getTime() / 1000),
			    name: "${map.business.serviceName}",
			    amount: "100",
			    buyer_email: "gildong@gmail.com",
			    buyer_name: "홍길동",
			    buyer_tel: "010-4242-4242",
			    buyer_addr: "서울특별시 강남구 신사동",
			    buyer_postcode: "01181"
			}, function(rsp) { // callback 
				// STEP4 가맹점 서버에 imp
				if (rsp.success) {
					// 결제 성공 시 로직,
					console.log("결제 성공");
					
					/* // jQuery로 HTTP 요청
				    jQuery.ajax({
				        // url: "https://www.myservice.com/payments/complete", // 가맹점 서버
				        url: "${pageContext.request.contextPath}/payment/insertBusinessPayment.do", // 가맹점 서버
				        method: "POST",
				        headers: { "Content-Type": "application/json" },
				        data: {
				            imp_uid: rsp.imp_uid, // 거래 고유 번호
				            // merchant_uid: rsp.merchant_uid // 주문번호 
				        }
				    }).done(function (data) {
				      // 가맹점 서버 결제 API 성공시 로직
				    }) */
				    
				    $('#form3').submit();
				    
				    alert("결제 성공");
					
				} else {
					// 결제 실패 시 로직,
					console.log("결제 실패 : " + rsp.error_msg);
					alert("결제 실패");
				}
			
			});
		}
	</script>

	<!-------서비스별 이용혜택-------->

	<!------------------->
	<div id="info_div">
		<div id="basic" style="float: left;">
			<ul id="basic_ul">
				<li id="basic_p">&nbsp;&nbsp;&nbsp;장치 간 동기화
					<p id="basic_pright">
						<b>최대 2대&nbsp;&nbsp;&nbsp;&nbsp;</b>
					</p>
				</li>
				<li id="basic_p">&nbsp;&nbsp;&nbsp;월 업로드 허용량
					<p id="basic_pright">
						<b>60 MB</b>&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
				</li>
				<li id="basic_p">&nbsp;&nbsp;&nbsp;최대 노트 크기
					<p id="basic_pright">
						<b>25 MB&nbsp;&nbsp;&nbsp;&nbsp;</b>
					</p>
				</li>
				<li id="basic_p">&nbsp;&nbsp;&nbsp;고객지원
					<p id="basic_pright">
						<b>온라인 포럼&nbsp;&nbsp;&nbsp;&nbsp;</b>
					</p>
				</li>
				<li id="basic_p">
					<p id="basic_p_gray">&nbsp;&nbsp;&nbsp;오프라인으로 노트북 엑세스</p>
				</li>
				<li id="basic_p">
					<p id="basic_p_gray">&nbsp;&nbsp;&nbsp;Evernote로 이메일 전달</p>
				</li>
				<li id="basic_p">
					<p id="basic_p_gray">&nbsp;&nbsp;&nbsp;Office 문서와 PDF 검색</p>
				</li>
				<li id="basic_p">
					<p id="basic_p_gray">&nbsp;&nbsp;&nbsp;장치 간 동기화</p>
				</li>

			</ul>

		</div>
		<!-------------------------->
		<div id="premium">
			<ul id="basic_ul">
				<li id="basic_p">&nbsp;&nbsp;&nbsp;장치 간 동기화
					<p id="basic_pright">
						<b>최대 2대&nbsp;&nbsp;&nbsp;&nbsp;</b>
					</p>
				</li>
				<li id="basic_p">&nbsp;&nbsp;&nbsp;월 업로드 허용량
					<p id="basic_pright">
						<b>60 MB</b>&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
				</li>
				<li id="basic_p">&nbsp;&nbsp;&nbsp;최대 노트 크기
					<p id="basic_pright">
						<b>25 MB&nbsp;&nbsp;&nbsp;&nbsp;</b>
					</p>
				</li>
				<li id="basic_p">&nbsp;&nbsp;&nbsp;고객지원
					<p id="basic_pright">
						<b>온라인 포럼&nbsp;&nbsp;&nbsp;&nbsp;</b>
					</p>
				</li>
				<li id="basic_p">
					<p id="basic_p_gray">&nbsp;&nbsp;&nbsp;오프라인으로 노트북 엑세스</p>
				</li>
				<li id="basic_p">
					<p id="basic_p_gray">&nbsp;&nbsp;&nbsp;Evernote로 이메일 전달</p>
				</li>
				<li id="basic_p">
					<p id="basic_p_gray">&nbsp;&nbsp;&nbsp;Office 문서와 PDF 검색</p>
				</li>
				<li id="basic_p">
					<p id="basic_p_gray">&nbsp;&nbsp;&nbsp;장치 간 동기화</p>
				</li>

			</ul>

		</div>
		<!---------------------->

		<div id="business" style="float: right;">
			<ul id="basic_ul">
				<li id="basic_p">&nbsp;&nbsp;&nbsp;장치 간 동기화
					<p id="basic_pright">
						<b>최대 2대&nbsp;&nbsp;&nbsp;&nbsp;</b>
					</p>
				</li>
				<li id="basic_p">&nbsp;&nbsp;&nbsp;월 업로드 허용량
					<p id="basic_pright">
						<b>60 MB</b>&nbsp;&nbsp;&nbsp;&nbsp;
					</p>
				</li>
				<li id="basic_p">&nbsp;&nbsp;&nbsp;최대 노트 크기
					<p id="basic_pright">
						<b>25 MB&nbsp;&nbsp;&nbsp;&nbsp;</b>
					</p>
				</li>
				<li id="basic_p">&nbsp;&nbsp;&nbsp;고객지원
					<p id="basic_pright">
						<b>온라인 포럼&nbsp;&nbsp;&nbsp;&nbsp;</b>
					</p>
				</li>
				<li id="basic_p">
					<p id="basic_p_gray">&nbsp;&nbsp;&nbsp;오프라인으로 노트북 엑세스</p>
				</li>
				<li id="basic_p">
					<p id="basic_p_gray">&nbsp;&nbsp;&nbsp;Evernote로 이메일 전달</p>
				</li>
				<li id="basic_p">
					<p id="basic_p_gray">&nbsp;&nbsp;&nbsp;Office 문서와 PDF 검색</p>
				</li>
				<li id="basic_p">
					<p id="basic_p_gray">&nbsp;&nbsp;&nbsp;장치 간 동기화</p>
				</li>

			</ul>

		</div>
	</div>

</body>
</html>