<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/styles.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/customer.css">
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
<title>Document</title>

<style>
@media ( min-width : 400px) {
	
	#centerbtn {
		width: 100%;
		height: 180px;
	}
	#footer {
		width: 100%;
		border-top: 1px solid #969696;
		height: 80px;
		margin-top: 50px;
	}
	#site_map {
		text-align: left;
		font-size: 20px;
		font-weight: 500;
		margin: 20px;
	}
	#notice_write_p {
		font-size: 20px;
		font-weight: 500;
	}
	#notice_write_title {
		font-size: 28px;
		font-weight: 700;
	}
	#notice_input {
		height: 60px;
	}
	.notice_long_text {
		height: 90%;
	}
	.container_n {
		width: 100%;
		height: 80%;
	}
	.notice_form {
		height: 100%;
	}
	.notice_write_form {
		height: 75%;
	}
	#exampleFormControlTextarea1 {
		height: 80%;
	}
	#cus_app_logo {
		padding-top: 10px;
		margin: 0 auto;
		height: 80px;
		float: left;
		width: 100%;
	}
	#cus_app_logo img {
		width: 20%;
		padding-left: 20px;
		margin: 0 auto;
	}
	#customer_top_right_btn {
		float: right;
		margin-top: 8px;
		padding-right: 20px;
	}
	#formokbtn {
		margin: 0;
		margin-top: 20px;
	}
	.form-group {
		margin-bottom: none;
		width: 100%;
	}
	#notice_btn_left {
		width: 100%;
		height: 60px;
		background: rgb(255, 119, 0);
		border: none;
	}
	#notice_btn_right {
		width: 100%;
		height: 60px;
		background: #a7a7a7;
		border: none;
		padding-top: 16px;
	}
	html, body {
		width: 100%;
		height: 100%;
		margin: 0;
		padding: 0;
	}
	#customer_top_right_btn button {
		color: #fff;
		border: 1px solid #fff;
	}
	#mainbox {
		position: absolute;
		width: 100%;
		left: 0;
		height: 900px;
		background-image: url(../images/mackbookmain.png);
	}
	#main1box-2 {
		width: 100%;
		margin: 0 auto;
		height: 600px;
	}
	#main12 {
		width: 100%;
		border-bottom: solid 1px #e4e3e7;
	}
	#main11 {
		width: 100%;
		height: 400px;
		display: inline-block;
		margin-top: 40px;
	}
	#main3box {
		float: left;
		padding-left: 50px;
		margin-top: 100px;
	}
	#main1box {
		position: absolute;
		width: 100%;
		left: 0;
	}
	#main1box img {
		width: 100%;
	}
	#mainlastdiv {
		margin: 0 auto;
		display: block;
		padding-top: 100px;
	}
	#intro1 {
		height: 160px;
		position: absolute;
		top: 260px;
		padding-left: 50px;
	}
	#intro2 {
		float: left;
		width: 500px;
		display: inline-block;
		height: 540px;
	}
	#intro2 img {
		width: 100%;
		height: 100%;
	}
	#main10 {
		width: 100%;
		height: 540px;
	}
	#main2box {
		margin-top: 200px;
		width: 460px;
		float: right;
	}
	#intro3 {
		width: 526px;
		height: 260px;
		float: right;
		padding-right: 50px;
	}
	#intro3 img {
		width: 100%;
		height: 100%;
	}
	#mainbox4 {
		margin: 0 auto;
		width: 80%;
	}
	#mainbox4 img {
		width: 100%;
		height: 100%;
	}
	#main4text {
		width: 500px;
		padding: 100px 0px;
		margin: 0 auto;
	}
#indexlast_div2 {
	width: 200px;
	margin: 0 auto;
	padding-top: 70px;
}

#indexlast_div {
	background: #F28B30;
	width: 100%;
	height: 200px;
}

.container__ {
	width: 100%;
}

.container00 {
	width: 100%;
}
#introLogin{
    width: 150px;
    text-align: center;
    
    left: 230px;
    position: absolute;
     top: 200px;
     
    
}#toploginbtn {
   
    float: right;
    width: 130px;
    height: 40px;
    display: inline-block;
    padding-right: 20px;
}
#toploginbtn button{
   margin-top:10px;
    width: 100%;
    height: 100%;
    
}
}





@media ( min-width : 1200px) {
	
	#centerbtn {
		width: 1200px;
		margin: 0 auto;
		padding-top: 60px;
		height: 300px;
	}
	#footer {
		width: 1200px;
		margin: 0 auto;
		border-top: 1px solid #969696;
		height: 100px;
		margin-top: 50px;
	}
	#site_map {
		text-align: left;
		font-size: 10px;
	}
	.notice_long_text {
		height: 700px;
		overflow: auto;
	}
	
	#cus_app_logo {
		width: 100%;
	}
	#cus_app_logo img {
		width: 10%;
		margin: 0 auto;
		float: left;
	}
	.form-group {
		margin-bottom: 1rem;
	}
	#notice_btn_left {
		width: 100%;
		height: 46px;
		background: rgb(255, 119, 0);
		border: none;
	}
	#notice_btn_right {
		width: 100%;
		height: 46px;
		background: #a7a7a7;
		border: none;
	}
	#notice_write_p {
		font-size: 14px;
	}
	#formokbtn {
		margin-top: 50px;
	}
	#customer_top_right_btn {
		float: right;
		margin: 0;
	}
	#customer_top_right_btn button {
		color: #fff;
		border: 1px solid #fff;
	}
	#main1box-2 {
		width: 1200px;
		margin: 0 auto;
		height: 900px;
	}
	#main1box {
		position: absolute;
		width: 100%;
		left: 0;
		height: 900px;
	}
	#main10 {
		width: 1200px;
		margin: 0 auto;
		height: 800px;
		padding-top: 100px;
	}
	#main11 {
		margin: 0 auto;
		width: 1200px;
		height: 700px;
		padding-top: 100px;
	}
	#main12 {
		margin: 0 auto;
		width: 1200px;
		height: 1000px;
	}
	#mainlastdiv {
		width: 1200px;
		margin: 0 auto;
		display: block;
		padding-top: 100px;
	}
	#intro1 {
		height: 160px;
		position: absolute;
		top: 260px;
		padding-left: 50px;
	}
	#intro2 {
		background-image: url(../images/mainnot.jpg);
		float: left;
		width: 626px;
		height: 626px;
		position: absolute;
	}
	#intro3 {
		background-image: url(../images/imessage.png);
		width: 626px;
		height: 360px;
		float: right;
	}
	#mainbox4 {
		background-image: url(../images/mainoffice.png);
		margin: 0 auto;
		width: 800px;
		height: 600px;
	}
	#main4text {
		width: 500px;
		padding-top: 100px;
		margin: 0 auto;
	}
	#indexlast_div2 {
		width: 200px;
		margin: 0 auto;
		padding-top: 130px;
	}
	#indexlast_div {
		background: #F28B30;
		width: 100%;
		height: 300px;
	}
	.container__ {
		width: 1200px;
		margin: 0 auto;
		
	}
	.container00 {
		width: 1200px;
		margin: 0 auto;
		height: 100%;
	}
	#toploginbtn {
   
    float: right;
    width: 130px;
}
#index_	btn{
 width: 100px;
 height: 40px;
}#introLogin{
    width: 150px;
    text-align: center;
    
    left: 230px;
    position: absolute;
     top: 200px;
    
}
}
<!--
-->
</style>
</head>
<body>
	<header>

		<div class="container00">
			<div id="cus_app_logo">

				<img
					src="${pageContext.request.contextPath}/resources/images/nest_wlogo.png">


				<div id="toploginbtn">
					<button  id="index_loginbtn" type="button" class="btn btn-light" style="margin-top:0px;">
						<p>login</p>
					</button>

				</div>

			</div>
		</div>

	</header>
	<div class="container__">

		<div>
			<div id="main1box">
				<img
					src="${pageContext.request.contextPath}/resources/images/mackbookmain.png">
			</div>
			<div id="main1box-2">
				<div id="intro1">

					<h3>"더 빠르게, 더 편하게 "</h3>
					<br>
					<p>
						언제 어디서나 노트를 작성할 수 있습니다.<br> 편리한 사용으로 사람들과 아이디어를 빠르게 공유하고<br>
						피드백 확인까지 개인과 팀워크를 고려한 서비스입니다.
					</p>




					<div id="introJOin">
						<button style="width: 150px;" type="button"
							class="btn btn-secondary"
							onclick="location.href='${pageContext.request.contextPath}/member/memberEnroll.do'">간편
							가입하기 ></button>
					</div>
					<div id="introLogin">
						<button style="width: 150px;" type="button"
							class="btn btn-secondary"
							onclick="location.href='${pageContext.request.contextPath}/member/loginView.do'">로그인</button>
					</div>

				</div>

			</div>
		</div>


		<div id="main10">
			<div id="intro2">
				<img
					src="${pageContext.request.contextPath}/resources/images/mainnot.jpg">

			</div>

			<div id="main2box">
				<h3>클라우드</h3>
				<p>
					자료공유를 위한 스페이스를 만들어보세요. <br> 멤버를 초대하고 서로의 노트를 공유할 수 있습니다.<br>
					
				</p>
			</div>
		</div>





		<div id="main11">


			<div id="main3box">
				<h3>채팅으로 소통이 가능합니다.</h3>
				<p>
					스페이스 구성원들과 실시간으로 대화할 수 있습니다. <br> NEST의 채팅 서비스로 프라이버시를 보호 받고,<br>
					팀원들과 소통해보세요.
				</p>

			</div>
			<div id="intro3">
				<img
					src="${pageContext.request.contextPath}/resources/images/imessage.png">
			</div>
		</div>


		<div id="main12">
			<div>
				<div id="mainbox4">
					<img
						src="${pageContext.request.contextPath}/resources/images/mainoffice.png">
				</div>

				<div id="main4text">
					<h3>커뮤니티를 제공합니다.</h3>
					<p>
						관심사에 맞는 공간에서 소통하고 정보를 공유하세요! 
					
					</p>


				</div>

			</div>
		</div>

			</div>
		<div id="indexlast_div">

			<div id="indexlast_div2">
				<button type="button" class="btn btn-light"
					style="color: #454545; width: 260px; height: 50px;"
					onclick="location.href='${pageContext.request.contextPath}/member/loginView.do'">
					바로 시작하기</button>
			</div>
			<!-- ${pageContext.request.contextPath}/ -->
		</div>

</body>

</html>