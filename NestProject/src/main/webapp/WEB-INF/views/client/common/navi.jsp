<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<style>
.popupLayer {
	position: relative;
	display: none;
	background-color: #ffffff;
	border: solid 2px #d0d0d0;
	width: 340px;
	height: 80%;
	z-index: 1;
	padding: 10px;
	height: 700px;
	margin-top: 10px;
}
.popupLayer div {
	position: relative;
	top: 5px;
	right: 5px;
}
#selfimg {
	width: 60px;
	height: 60px;
	margin: 20px;
	background: #ababab;
	float: left;
	display: inline-block;
}
#msgname {
	font-weight: 700px;
	font-size: 14px;
	float: left;
	padding-top: 60px;
}
#myself {
	border-bottom: 1px solid #d0d0d0;
	width: 100%;
	margin: 0 auto;
	height: 120px;
	display: block;
}
#count_friend_div {
	width: 80%;
	float: right;
	display: block;
	margin-bottom: 10px;
}
#count_friend_div span {
	float: right;
}
#count_friend {
	font-weight: 600;
	font-size: 18px;
	color: #ababab;
	padding: 0;
	display: inline-block;
	float: left;
	margin-bottom: 10px;
}
#friend {
	border-bottom: 1px solid #d0d0d0;
	width: 100%;
	height: 80px;
	float: left;
}
#friend_img {
	width: 50px;
	height: 50px;
	margin: 10px 10px 10px 20px;
	background: #d0d0d0;
	float: left;
	display: inline-block;
}
#msg_serch {
	width: 100%;
	border-top: 1px solid #d0d0d0;
	margin: 0 auto;
	padding: 5px;
}
#msg_friend_name {
	font-weight: 700px;
	font-size: 14px;
	float: left;
	padding-top: 40px;
}
#msg_parent {
	height: 80%;
	overflow: auto;
}
#friend:last-child {
	border: none;
}
@media ( min-width : 1200px) {
#navlinone1{
display: none;
}
}
</style>

</head>

<div id="left_navi" style="padding: 0%;" class="sidebar-sticky ">

	<div id="usericon">
		<div id="person_img_div" class="rounded-circle"></div>



		<span style="font-size: 16px; color: #fff;">user </span>

		<div id="left_nav_msg_div">
			<a href="#" class="imgSelect"
				onclick="SirenFunction('SirenDiv'); return false;"
				class="blind_view"> <i id="left_nav_msg" class="fas fa-comment"></i>
				<span id="left_nav_msg_count"><b>2</b></span></a>
			<!--  메세지 갯수 필요 -->
		</div>




		<div class="popupLayer">

			<div style="height: 40px;">
				<span id="count_friend">친구&nbsp;&nbsp;20</span> <span
					onClick="closeLayer(this)"
					style="cursor: pointer; font-size: 1.5em; float: right;" title="닫기">X</span>

			</div>

			<div id="msg_serch">
				<input style="width: 100%;" type="text" placeholder="이름으로 검색">
			</div>
			<div id="msg_parent">
				<div id="myself">
					<p style="margin: 0; padding-left: 10px">내 프로필</p>
					<div id="selfimg" class="rounded-circle"></div>
					<span id="msgname">user</span>
				</div>


				<div id="friend">

					<div id="friend_img" class="rounded-circle"></div>
					<span id="msg_friend_name">user</span>
				</div>

				<div id="friend">

					<div id="friend_img" class="rounded-circle"></div>
					<span id="msg_friend_name">user</span>
				</div>

				<div id="friend">

					<div id="friend_img" class="rounded-circle"></div>
					<span id="msg_friend_name">user</span>
				</div>

				<div id="friend">

					<div id="friend_img" class="rounded-circle"></div>
					<span id="msg_friend_name">user</span>
				</div>

				<div id="friend">

					<div id="friend_img" class="rounded-circle"></div>
					<span id="msg_friend_name">user</span>
				</div>

				<div id="friend">

					<div id="friend_img" class="rounded-circle"></div>
					<span id="msg_friend_name">user</span>
				</div>

				<div id="friend">

					<div id="friend_img" class="rounded-circle"></div>
					<span id="msg_friend_name">user</span>
				</div>
			</div>
		</div>
		<!-- //폼 레이어  -->

		<p>
			<br />
		</p>
	</div>


	<button type="button" class="btn" data-toggle="modal" data-target="#myModal"
            		style="width: 100%; border: none; margin-top: 10px; color: darknavy; font-size: 14px;">
			    비즈니스 그룹 요청
			</button>


	<div id="logoutdiv">
		<button id="note_loginbtn" type="button" class="btn-sm">로그아웃</button>

	</div>
	<div id="noticenav">

		<ul id="navul">
		<a href="${pageContext.request.contextPath}/note/newNote.do">
			<li id="newnote" class="navlinone">&nbsp;&nbsp;<i
				class="fas fa-plus-circle "
				style="font-size: 20px; color: #fff; margin-right: 10px;"> </i>새노트
			</li>
		</a>
			<!-- - 모바일에서 메뉴 네비 드롭다운 -->
			<li class="nav-item dropdown"><a id="drop_1"
				style="color: #fff; float: left;" class="nav-link dropdown-toggle"
				data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
				aria-expanded="false"><i id="navli_icon" class="fas fa-cog"></i>노트</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#"><i id="navli_icon"
						class="fas fa-caret-up">
						</i>모든노트</a> 
						<a class="dropdown-item" href="#"><i
						id="navli_icon" class="fas fa-cog"></i>
						노트북</a> <a
						class="dropdown-item" href="#">
						<i id="navli_icon"
						class=" fas fa-plus-circle"></i>새노트</a>
						</div></li>
		</ul>
		
		</div>
		
	<div id="noticenav">

		<ul id="navul">
		
			<!-- - 모바일에서 메뉴 네비 드롭다운 -->
			<li class="nav-item dropdown"><a id="drop_1"
				style="color: #fff; float: left;" class="nav-link dropdown-toggle"
				data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
				aria-expanded="false">설정</a>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#"><i id="navli_icon"
						class="fas fa-cog">
						</i>설정</a> 
						<a class="dropdown-item" href="#"><i
						id="navli_icon" class="fas fa-caret-up "></i>
						업그레이드</a> <a
						class="dropdown-item" href="#">
						<i id="navli_icon"
						class="far fa-question-circle"></i>고객센터</a>
						</div></li>
		</ul>
		
		</div>
		
	<div>


<ul style="padding:0;">
		<a href="${pageContext.request.contextPath}/note/note.do?mno=${member.mNo}&trashcan=N">
		<li id="navli">&nbsp;&nbsp;<i id="navli_icon"
			class="fas fa-sticky-note"></i>모든 노트
		</li>
		</a>
		<a href="${pageContext.request.contextPath}/notebook/notebook.do?mno=${member.mNo}">
		<li id="navli">&nbsp;&nbsp;<i id="navli_icon"
			class="far fa-sticky-note"></i>노트북
		</li>
		</a>
		<a href="${pageContext.request.contextPath}/note/nShare.do">
		<li id="navli">&nbsp;&nbsp;<i id="navli_icon"
			class="fas fa-folder"></i>공유 문서함
		</li>
		</a>
		<a href="${pageContext.request.contextPath}/note/tag.do">
		<li id="navli" class="navlinone">&nbsp;&nbsp;<i id="navli_icon"
			class="fas fa-tags"></i>태그
		</li>
		</a>
		<a href="${pageContext.request.contextPath}/note/note.do?mno=${member.mNo}&trashcan=Y">
		<li id="navli" class="navlinone">&nbsp;&nbsp;<i id="navli_icon"
			class="fas fa-trash-alt"></i>휴지통
		</li>
		</a>



		<!-- --아코디언 매뉴 -->
			<li class="sidebar-item showw"><a href="#pages"
				data-toggle="collapse" class="sidebar-link collapsed">
					&nbsp;&nbsp; <i class="fas fa-th-large"
					style="font-size: 20px; color: #fff; margin-right: 10px; padding-top: 10px;"></i><span
					style="color: #fff;" class="align-middle">스페이스</span>
			    </a>
			    
				<ul id="pages" class="sidebar-dropdown list-unstyled collapse ">
					<li style="padding: 10px; height: 40px;" class="sidebar-link"><a
						class="sidebar-link" href="#"
						style="text-decoration: none; color: #fff; display: block;" data-toggle="modal" data-target="#exampleModal">스페이스
							만들기</a></li>
							
					     <c:forEach items="${spaceList}" var="sList">
              				<li style="padding: 10px; height: 40px;" class="sidebar-link">
              				<a class="sidebar-link" style="text-decoration: none; color: #fff; display: block; cursor:pointer;" onclick="goToSpace(${sList.spaceNo});">${sList.spaceName}</a>
							</li>
             			 </c:forEach>	
				</ul>
			</li>
	<!-------------------------------- 스페이스 생성하는 모달 ------------------------------>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content" style="width:650px; height:400px;">
		      <div class="modal-header" style="border:none;">
		        <h5 class="modal-title" id="exampleModalLabel">스페이스 생성</h5>
		        <button type="button" id="xBtn" class="close" data-dismiss="modal" aria-label="Close">
		           <span aria-hidden="true" >&times;</span>
		        </button>
		      </div>
		      
		      <form action="${pageContext.request.contextPath}/space/createSpace.do" method="post">
		        <div class="modal-body">
		      	
		       	  <div class="form-group">
			    	<input type="text" class="form-control" id="spaceName" name="spaceName" placeholder="스페이스 이름을 입력하세요">
			  	  </div>
			  	  
			  	   <div class="form-group">
			    	<input type="text" class="form-control" id="spaceExplain" name="spaceExplain" placeholder="스페이스에 대한 설명을 적어주세요" style="height:60px; margin:0px;">
			  	   </div>
			  	   
			  	   <div class="form-group form-check" >
					  <input type="checkbox" class="form-check-input" id="postSpaceDir" name="postSpaceDir">
				 	  <label class="form-check-label" for="dirPostCheck">스페이스 디렉토리에 게시</label>
				   </div>
 				   
 				   <label>접근 권한 설정 </label>
 				   <select class="form-control form-control-sm" id="rightSet" name="rightSet">
 				   <option value="none">선택</option>
				   <option value="A1">다른 사람들이 접근 권한을 요청해야합니다.</option>
				   <option value="A2">다른 사람들이 보기 권한을 가지고 접근할 수 있습니다.</option>
				   <option value="A3">다른 사람들이 수정 권한을 가지고 접근할 수 있습니다.</option>
				   <option value="A4">다른 사람들이 수정 권한 및 다른 사용자 초대권한을 가지고 접근할 수 있습니다.</option>
				   </select>

		      </div>

		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="cancelCreateSpace();">취소</button>
		        <button type="submit" class="btn btn-primary" onclick="createSpace();">만들기</button>
		      </div>
		    </form>
		      
		    </div>
		  </div>
		</div>
	
		
		<li id="navli">&nbsp;&nbsp;<i id="navli_icon"
			class="fas fa-caret-up"></i>업그레이드
		</li>
		<!---새창 오픈-->
		<!--  <a href="community.html" target="_blank" style="list-style:none; text-decoration: none; color: #fff;"> -->
		<li id="navli" onclick="goToComunity();">&nbsp;&nbsp;<i id="navli_icon"
				class="fas fa-comment"></i>커뮤니티
		</li>


		<li id="navli">&nbsp;&nbsp;<i id="navli_icon" class="fas fa-cog"></i>설정
		</li>
		<li id="navli">&nbsp;&nbsp;<i id="navli_icon"
			class="far fa-question-circle"></i>고객센터
		</li>
		</ul>
	</div>
	</div>
	<!-- ------ 채팅 div 보이기 -->
	<script>
function closeLayer( obj ) {
	$(obj).parent().parent().hide();
}
$(function(){
	/* 클릭 클릭시 클릭을 클릭한 위치 근처에 레이어가 나타난다. */
	$('.imgSelect').click(function(e)
	{
		var sWidth = window.innerWidth;
		var sHeight = window.innerHeight;
		var oWidth = $('.popupLayer').width();
		var oHeight = $('.popupLayer').height();
		// 레이어가 나타날 위치를 셋팅한다.
		var divLeft = e.clientX + 10;
		var divTop = e.clientY + 5;
		// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
		if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
		if( divTop + oHeight > sHeight ) divTop -= oHeight;
		// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
		if( divLeft < 0 ) divLeft = 0;
		if( divTop < 0 ) divTop = 0;
		$('.popupLayer').css({
			"top": divTop,
			"left": divLeft,
			"z-index": 1,
			"position": "absolute"
		}).show();
	});
});

function goToComunity(){
			window.open("${pageContext.request.contextPath}/board/board.do");
		}
		
function goToSpace(spaceNo){
	location.href="${pageContext.request.contextPath}/space/selectOneSpace.do?spaceNo=" + spaceNo;
}
</script>
