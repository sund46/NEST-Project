<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"></script>
<!DOCTYPE html>
<html lang="ko">


<link
	href="${pageContext.request.contextPath}/resources/css/rotating-card.css"
	rel="stylesheet" />
<link
	href="https://netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"
	rel="stylesheet" />
<style>
	#community_text_div{
		display:inline-block;
	}
	
	.selector img{
		position: absolute; top:0; left: 0;
		width: 100%;
		height: 100%;
	}
</style>




<body style="height:100%;width:100%;">
  <div style="height:100%;width:100%;">

	<!-- Page Wrapper -->
	<div id="wrapper" style="background-color: #f6c23e">

		<c:import url="../board/common/menubar.jsp" />

		<!-- Home 화면 구현부분 ////////////////////////////////////////////////////////////////////////////////////////////////////-->
			<div class="space-50" style="height:150px;text-align: center;"><img src="/nest/resources/images/comlogg.png" 
              style="width:500px;height:130px; "></div>
         <div class="row" style="height: 600px;">  
         
            
            <div class="col-lg-12 col-md-12 col-xs-12" style="text-align:center">
               <div id="community_text_div" class="col-lg-3 col-md-6 col-xs-6">
						<div class="card-container">
							<div class="card">
								<div class="front">
									<div class="cover">
										<img src="/nest/resources/images/rotating_card_thumb.png" />
									</div>
									<div class="user">
										<img class="img-circle"
											src="/nest/resources/images/rotating_card_profile.png" />
									</div>
									<div class="content">
										<div class="main">
											<h3 class="name">곽준서</h3>
											<p class="profession">Duck</p>
											<p class="text-center">"은서야 나가" <br> "대현아 손절하자" <br> "열심히 하세요 화이팅!" </p>
										</div>
										
									</div>
								</div>
								
								<!-- end front panel -->
								<div class="back">
									<div class="header">
										<h5 class="motto">"우리조가 1등입니다. "</h5>
									</div>
									<div class="content">
										<div class="main">
											<h4 class="text-center">Job Description</h4>
											<p class="text-center">Web design, Adobe Photoshop,
												HTML5, CSS3, Corel and many others...</p>

											<div class="stats-container">
												<div class="stats">
													<h4>235</h4>
													<p>Followers</p>
												</div>
												<div class="stats">
													<h4>114</h4>
													<p>Following</p>
												</div>
												<div class="stats">
													<h4>35</h4>
													<p>Projects</p>
												</div>
											</div>

										</div>
									</div>
									
								</div>
								<!-- end back panel -->
							</div>
							<!-- end card -->
						</div>
						<!-- end card-container -->
					</div>
					<!-- end col sm 3 -->
					
					<div id="community_text_div" class="col-lg-3 col-md-6 col-xs-6">
						<div class="card-container">
							<div class="card">
								<div class="front">
									<div class="cover">
										<img src="/nest/resources/images/rotating_card_thumb2.png" />
									</div>
									<div class="user">
										<img class="img-circle"
											src="/nest/resources/images/rotating_card_profile2.png" />
									</div>
									<div class="content">
										<div class="main">
											<h3 class="name">안은서</h3>
											<p class="profession">Rosy</p>
											<p class="text-center">"대현아 화풀어" <br> "은서야 밤길조심해" <br>
																	"대현아 다리떨지마"</p>
										</div>
										
									</div>
								</div>
								
								<!-- end front panel -->
								<div class="back">
									<div class="header">
										<h5 class="motto">"술을 잘먹자"</h5>
									</div>
									<div class="content">
										<div class="main">
											<h4 class="text-center">Job Description</h4>
											<p class="text-center">Web design, Adobe Photoshop,
												HTML5, CSS3, Corel and many others...</p>

											<div class="stats-container">
												<div class="stats">
													<h4>235</h4>
													<p>Followers</p>
												</div>
												<div class="stats">
													<h4>114</h4>
													<p>Following</p>
												</div>
												<div class="stats">
													<h4>35</h4>
													<p>Projects</p>
												</div>
											</div>

										</div>
									</div>
									
								</div>
								<!-- end back panel -->
							</div>
							<!-- end card -->
						</div>
						<!-- end card-container -->
					</div>
					
					<!--         <3번째 ></div> -->
					<div id="community_text_div" class="col-lg-3 col-md-6 col-xs-6">
						<div class="card-container">
							<div class="card">
								<div class="front">
									<div class="cover">
										<img src="/nest/resources/images/rotating_card_thumb3.png" />
									</div>
									<div class="user">
										<img class="img-circle" src="/nest/resources/images/rotating_card_profile3.png" />
									</div>
									<div class="content">
										<div class="main">
											<h3 class="name">전미정</h3>
											<p class="profession">Anna</p>

											<p class="text-center">"은서언니 나가!!" <br> "대현오빠 결별하자 " 
												<br> "해인아 말좀들어라" </p>
										</div>
									</div>
								</div>
								<!-- end front panel -->
								<div class="back">
									<div class="header">
										<h5 class="motto">"아니!!"</h5>
									</div>
									<div class="content">
										<div class="main">
											<h4 class="text-center">Job Description</h4>
											<p class="text-center">Web design, Adobe Photoshop,
												HTML5, CSS3, Corel and many others...</p>

											<div class="stats-container">
												<div class="stats">
													<h4>235</h4>
													<p>Followers</p>
												</div>
												<div class="stats">
													<h4>114</h4>
													<p>Following</p>
												</div>
												<div class="stats">
													<h4>35</h4>
													<p>Projects</p>
												</div>
											</div>

										</div>
									</div>
								</div>
								<!-- end back panel -->
							</div>
							<!-- end card -->
						</div>
						<!-- end card-container -->
					</div>
					<!-- end col-sm-3 -->
				</div>
				<!-- end col-sm-10 -->
			</div>
			<!-- end row -->
			
			<!-- <div class="space-200"></div> -->
		




		<c:import url="../board/common/footer.jsp" />
	</div>
	<!-- End of Content Wrapper -->

	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
</div>
</body>

</html>
