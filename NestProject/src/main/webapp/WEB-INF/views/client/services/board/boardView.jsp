<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nestCor.nest.services.boardComment.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper" style="background-color: #f6c23e">

		<c:import url="../board/common/menubar.jsp" />

		<!-- View 화면 구현부분 ////////////////////////////////////////////////////////////////////////////////////////////////////-->
		<div id="community" style="padding: 10px;">
			<!---------------------------커뮤니티 헤더 / 인기순,최신순 정렬(<br>,&nbsp; 지우지마세요)---------------------------------------------->
			<nav class="navbar navbar-expand-lg navbar-light"
				style="height: 78px;">
				<p style="font-size: 18px; font-weight: 600; margin: 0;">
					<br>커뮤니티
				</p>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item "><a class="nav-link" href="#"
							style="padding-top: 30px;">&nbsp;인기 <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#"
							style="padding-top: 30px;">최신</a></li>
					</ul>
					<!-----------------------------------제목,작성자 검색시 해당하는 게시물 나와야합니다.--------------------------------->
					<button style="padding: 10px; margin-top: 30px;" type="button"
						class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/board/boardUpdateView.do?bno=${bno}&mNo=${member.mNo}'">수정하기</button>
					<button style="padding: 10px; margin-top: 30px;" type="button"
					class="btn btn-light" onclick="location.href='${pageContext.request.contextPath}/board/boardDelete.do?bno=${bno}&mNo=${member.mNo}'">삭제하기</button>
				</div>
			</nav>
			<!---------------------------------------------------------------------------------------->

			<!------------------- 커뮤니티 게시판 ----------------------------->
			<div class="com_container" style="height:100%;">
				<div id="com_title">
				
					
					<h3 style="padding-top: 10px;">${board.btitle}</h3>
					<p class="com_title_text">
						<i class="fas fa-paw" style="font-size: 20px;"></i>&nbsp;&nbsp;${board.bwriter}&nbsp;&nbsp;
					</p>
					<!--닉네임-->
					<p class="com_title_text" style="border-left: #e0e0e0 solid 1px;">&nbsp;&nbsp;${board.bdate}</p>
					<!-- 작성일 -->

					<p class="com_title_text cmtright"
						style="border-left: #e0e0e0 solid 1px;">
						&nbsp;&nbsp;댓글&nbsp;${totalCommentContents}&nbsp;</p>
					<p class="com_title_text cmtright">&nbsp;&nbsp;조회수&nbsp;${board.bcount}
						&nbsp;</p>
				</div>
				<!------------------------------------------------------------------------->

				<div style="padding: 30px;">
					${board.bcontent}
				</div>
				<div id="commaintext"
					style="margin: 0 auto; width: 248px; padding: 40px 0px;">
					<button id="upbtn" type="button" class="btn btn-link">
						<i id="upicon" class="fas fa-caret-up"></i> <span
							style="color: darkgrey">21</span>
					</button>
					<!----좋아요 누를때 숫자 올라가야합니다.---->

					<button id="downbtn" type="button" class="btn btn-link">
						<i id="downicon" class="fas fa-caret-down"
							style="margin-right: 10px;"></i>
						<!-- 비추/싫어요 숫자 올라가야합니다.-->
						<span style="color: darkgrey">4</span>
					</button>
				</div>
				<div id="comment">
					<ul id="commentul">
						<li
							style="border-bottom: solid 1px #b8b8b8; padding-bottom: 20px;">
							<form style="width: 100%; margin: 0 auto;">
								<div class="input-group mb-3">
									<input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" id="mno" name="mno" value= ${member.mNo } hidden>
									<input type="text" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2" id="ccontent" name="ccontent">
									<div class="input-group-append">
										<button class="btn btn-outline-secondary" type="button" id="button-addon2">확인</button>
									</div>

								</div>
							</form>
						</li>

						<c:forEach items="${clist}" var="bc">
							<li id="${bc.bno}" class="commentli">
								<div style="margin-bottom: 10px;">
									<i class="fas fa-paw" style="font-size: 20px;"></i>&nbsp;&nbsp;${bc.bcnickname}&nbsp;&nbsp;
									<span id="commentli_time">&nbsp;&nbsp;${bc.bcdate}
									</span>
									<span>
									<button style="padding: 5px; margin-top: 30px; margin:auto; float: right;" type="button" class="btn btn-light" 
									onclick="location.href='${pageContext.request.contextPath}/boardComment/boardCommentDelete.do?bno=${bno}&cno=${bc.cno}'">삭제하기</button>
									</span>
								</div>
								<p>${bc.ccontent}</p>
								<div style="padding-top: 20px;">
									<a href="#" id="commentp"
										onclick="SirenFunction('SirenDiv'); return false;">답글달기</a>
										
								</div>
							</li>
						</c:forEach>
					</ul>
					<script>
						function SirenFunction(idMyDiv) {
							var objDiv = document.getElementById(idMyDiv);
							if (objDiv.style.display == "block") {

							} else {
								objDiv.style.display = "block";
							}
						}
					</script>
				</div>
			</div>
		</div>
		<c:import url="../board/common/footer.jsp" />
	</div>
	<!-- End of Content Wrapper -->

	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>


	<script type="text/javascript">
	 document.getElementById("button-addon2").addEventListener("click", function() {
	    	if(ccontent.value==""||ccontent.value.length==0){
				alert("댓글을 입력해 주세요");
				return false;
			}else{
				location.href='${pageContext.request.contextPath}/boardComment/insertBoardComment.do?bno=${bno}&mno=${member.mNo}&ccontent='+ccontent.value;
			}}, false);
	</script>
</body>

</html>
