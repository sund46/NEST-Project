<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.nestCor.nest.services.board.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper" style="background-color: #f6c23e">

		<c:import url="../board/common/menubar.jsp"/>

			<!-- Home 화면 구현부분 ////////////////////////////////////////////////////////////////////////////////////////////////////-->
			<div id="community" style="padding: 10px;">
				<div align="right">
				<a href="${pageContext.request.contextPath}/board/boardForm.do?cate1_code=${cate1_code}&cate2_code=${cate2_code}" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
				<i class="fas fa-download fa-sm text-white-50"></i> 글쓰기</a>
				</div>
				<!---------------------------커뮤니티 헤더 / 인기순,최신순 정렬---------------------------------------------->
				<nav class="navbar navbar-expand-lg navbar-light">
					<p style="font-size: 18px; font-weight: 600; margin: 0;">
						<br>커뮤니티
					</p>
					<button class="navbar-toggler" type="button"
						data-toggle="collapse" data-target="#navbarSupportedContent"
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
						<li class="nav-item dropdown" style="float: right; list-style: none;">
						<a style="text-decoration: none" class="nav-link dropdown-toggle"
							href="#" id="navbarDropdown" role="button"
							data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 제목 </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">제목</a> <a
									class="dropdown-item" href="#">작성자</a>

							</div>
						</li>
						<form class="form-inline my-2 my-lg-0">
							<input class="form-control mr-sm-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success my-2 my-sm-0"
								type="submit">검색</button>
						</form>
					</div>
				</nav>
				<!---------------------------------------------------------------------------------------->

				<!------------------- 커뮤니티 게시판 ----------------------------->
				<div style="height: 800px;">
					<table class="table">
						<colgroup>
							<col width="10%"/>
							<col width="70%"/>
							<col width="10%"/>
							<col width="10%"/>
						</colgroup>
					
						<thead class="thead-dark">
							<tr>
								<th scope="col">게시물번호</th>
                                   <th scope="col-9">제목</th>
                                   <th scope="col-2">작성일</th>
                                   <th scope="col-2">작성자</th><!-- md를 붙이시면 보통 사이즈 뜻입니다. / 좌측 네비 div에 col 1또는 2를 주시고 
								게시판 div에 11 또는 10/ 가로 숫자 합 12를 맞춰주신 후 th col에 각 각 숫자로 크기 주시면 됩니다.
								부트스트랩에 레이아웃 참조하시면 이해하시는데 큰 도움 될거 같아요 -->
							</tr>
						</thead>
						<tbody>
							<!-- ${b.count} 는 없어서 우선 이대로 실행 -->
							<c:forEach items="${list}" var="b">
								<tr id="${b.bno}">	
									<th scope="row">${b.bno} &nbsp;&nbsp;&nbsp;
									<i	class="far fa-thumbs-up"
										style="font-size: 10px; color: #b8b8b8"></i> 
									<span style="color: #b8b8b8">1</span></th>
									<!---좋아요 or 추천 갯수 -->
									<td id="title"> 
										<a href="${pageContext.request.contextPath}/board/boardView.do?bno=${b.bno}"
											style="color: gray;">${b.btitle}</a>
										<a href=# style="text-decoration: none;">&nbsp;&nbsp;[${b.commentcnt}]</a>
									</td>
									<td>${b.bdate}</td>
									<td>${b.bwriter}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:out value="${pageBar}" escapeXml="false"/>
				</div>

				<!------------------------------------------------------->
			</div>

			<c:import url="../board/common/footer.jsp"/>

		</div>
		<!-- End of Content Wrapper -->

		<!-- End of Page Wrapper -->


</body>

</html>
