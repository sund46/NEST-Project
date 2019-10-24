<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
/* .modal-backdrop.show {
    opacity: .5;
    z-index: 2 !important;
    
} */
@font-face {
	font-family: 'Godo';
	font-style: normal;
	font-weight: 400;
	src:
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff2')
		format('woff2'),
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff')
		format('woff');
}

@font-face {
	font-family: 'Godo';
	font-style: normal;
	font-weight: 700;
	src:
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoB.woff2')
		format('woff2'),
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoB.woff')
		format('woff');
}

.godo * {
	font-family: 'Godo', sans-serif;
}

* {
	font-family: 'Godo';
}
</style>
<div class="sidebar" style="background: #3b332e">
	<!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
    -->
	<div class="logo"
		style="text-align: center; height: 4.375rem; padding-top: 15px;">
		<div class="sidebar-brand-text mx-3">
			<img src="/nest/resources/images/nest_wlogo.png" id="center-image"
				alt="스프링로고" style="width: 150px; height: auto;">
		</div>
	</div>
	<div class="sidebar-wrapper" id="sidebar-wrapper">
		<a class="btn" data-toggle="modal" data-target="#myModal_bizNameUpdate"
			style="width: 100%; border: none; margin-top: 20px; font-size: 17px; color: #fff; margin-bottom: 0; background: #3b332e;
			">
			${ bizName } </a>

		

		<ul class="nav">
			<li class="active " style="background: #3b332e;"><a
				href="${pageContext.request.contextPath}/member/memberSummary.do"
				style="background: #e7722e"> <i
					class="now-ui-icons users_single-02"></i>
					<p style="font-size: 14px;">사용자</p>
			</a>
				<ul class="btn-primary" style="background: #3b332e;">
					<a
						href="${pageContext.request.contextPath}/member/memberSummary.do">
						<p
							style="color: #FFFFFF; font-size: 12px; padding-left: 14%; margin-top: 10px;">요약</p>
					</a>
				</ul>
				<ul class="btn-primary" style="background: #3b332e;">
					<a href="${pageContext.request.contextPath}/member/memberInvite.do">
						<p style="color: #FFFFFF; font-size: 12px; padding-left: 14%;">사용자
							추가</p>
					</a>
				</ul>
				<ul class="btn-primary" style="background: #3b332e;">
					<a href="${pageContext.request.contextPath}/member/memberManage.do">
						<p style="color: #FFFFFF; font-size: 12px; padding-left: 14%;">사용자
							관리</p>
					</a>
				</ul></li>
			<li class="active " style="background: #3b332e;"><a
				href="./dashboard.html" style="background: #e7722e"> <i
					class="now-ui-icons design_app"></i>
					<p style="font-size: 14px;">콘텐츠</p>
			</a>
				<ul class="btn-primary" style="background: #3b332e;">
					<a href="${pageContext.request.contextPath}/space/spaceManage.do">
						<p
							style="color: #FFFFFF; font-size: 12px; padding-left: 14%; margin-top: 10px;">스페이스</p>
					</a>
				</ul>
				<ul class="btn-primary" style="background: #3b332e;">
					<a href="#">
						<p style="color: #FFFFFF; font-size: 12px; padding-left: 14%;">노트북</p>
					</a>
				</ul>
				<ul class="btn-primary" style="background: #3b332e;">
					<a href="#">
						<p style="color: #FFFFFF; font-size: 12px; padding-left: 14%;">노트</p>
					</a>
				</ul>
				<ul class="btn-primary" style="background: #3b332e;">
					<a href="#">
						<p style="color: #FFFFFF; font-size: 12px; padding-left: 14%;">태그</p>
					</a>
				</ul>
				<ul class="btn-primary" style="background: #3b332e;">
					<a href="#">
						<p style="color: #FFFFFF; font-size: 12px; padding-left: 14%;">휴지통</p>
					</a>
				</ul></li>
		</ul>
	</div>
</div>

<!-- The Modal -->
			<form method="post"
				action="${pageContext.request.contextPath}/business/updateBizName.do">
				<div class="modal" id="myModal_bizNameUpdate">
					<div class="modal-dialog">
						<div class="modal-content" style="height: 300px;">

							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">비즈니스명 변경</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<!-- Modal body -->
							<div class="modal-body">
								<label class="col-md-3 col-form-label">Business is </label>
								<div class="col-md-11">
									<div class="form-group">
										<input type="text" class="form-control" name="bizName"
											id="setBizName">
									</div>
								</div>
							</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="submit" class="btn btn-info">변경</button>
							</div>

						</div>
					</div>
				</div>
			</form>