<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko" style="height:100%;width:100%;">


<body>


    <div style="height:100%;width:100%;">
       
        <c:import url="../common/navi.jsp"/>


        <section class="whitebox col-md-10 col-xs-11">


            <div id="community">

                <!---------------------------커뮤니티 헤더 / 인기순,최신순 정렬(<br>,&nbsp; 지우지마세요)---------------------------------------------->
                <nav class="navbar navbar-expand-lg navbar-light" style="height: 78px;">
                    <p style="font-size: 18px; font-weight: 600; margin:0;"><br>커뮤니티</p>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item ">
                                <a class="nav-link" href="#" style="padding-top: 30px;">&nbsp;인기 <span
                                        class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" style="padding-top: 30px;">최신</a>
                            </li>


                        </ul>
                        <!-----------------------------------제목,작성자 검색시 해당하는 게시물 나와야합니다.--------------------------------->
                        <button style="padding: 10px; margin-top: 30px;" type="button" class="btn btn-light">목록으로
                            돌아가기</button>
                    </div>
                </nav>
                <!---------------------------------------------------------------------------------------->





                <!------------------- 커뮤니티 게시판 ----------------------------->
                <div class="com_container ">
                    <div id="com_title">
                        <h3 style="padding-top:10px;">유용한 정보 공유합니다 ! </h3>
                        <p class="com_title_text"><i class="fas fa-paw"
                                style="font-size: 20px;"></i>&nbsp;&nbsp;닉네임이다.&nbsp;&nbsp;</p>
                        <!--닉네임-->
                        <p class="com_title_text" style="border-left: #e0e0e0 solid 1px;">&nbsp;&nbsp;00월/00일</p>
                        <!-- 작성일 -->

                        <p class="com_title_text cmtright" style="border-left: #e0e0e0 solid 1px;">
                            &nbsp;&nbsp;댓글&nbsp;10&nbsp;</p>
                        <p class="com_title_text cmtright" style="border-left: #e0e0e0 solid 1px;">
                            &nbsp;&nbsp;추천수&nbsp;10&nbsp;&nbsp;</p>
                        <p class="com_title_text cmtright">&nbsp;&nbsp;조회수&nbsp;10 &nbsp;</p>
                    </div>
                    <!------------------------------------------------------------------------->

                    <div style="height: 400px; padding: 30px;">
                        유용한 정보 공유합니다.<br> 피피티 템플릿, 무료 아이콘 사이트 입니다.
                        <br><br><br><br><br><br><br><br><br><br>
                    </div>
                    <div id="commaintext" style="margin: 0 auto; width: 248px; padding: 40px 0px;">
                        <button id="upbtn" type="button" class="btn btn-link">
                            <i id="upicon" class="fas fa-caret-up"></i>
                            <span style="color: darkgrey">21</span>
                        </button>
                        <!----좋아요 누를때 숫자 올라가야합니다.---->

                        <button id="downbtn" type="button" class="btn btn-link">
                            <i id="downicon" class="fas fa-caret-down" style="margin-right: 10px;"></i>
                            <!-- 비추/싫어요 숫자 올라가야합니다.-->
                            <span style="color: darkgrey">21</span>
                        </button>
                    </div>
                    <div id="comment">
                        <ul id="commentul">
                            <li style="border-bottom: solid 1px #b8b8b8; padding-bottom: 20px;">
                                <form style="width: 100%; margin: 0 auto;">
                                    <div class="input-group mb-3">

                                        <input type="text" class="form-control" aria-label="Recipient's username"
                                            aria-describedby="button-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-secondary" type="button"
                                                id="button-addon2">확인</button>
                                        </div>

                                    </div>
                                </form>
                            </li>


				<!-- 작성시간, 작성일, 닉네임, 추천수 조회수 댓글 수 필요합니다. 이 기준으로 인기 , 최신 게시물 리스트 정렬입니다. -->
                            <li class="commentli">
                                <div style="margin-bottom: 10px;">
                                    <i class="fas fa-paw" style="font-size: 20px;"></i>&nbsp;&nbsp;관리자였으면&nbsp;&nbsp;
                                    <sapn id="commentli_time">&nbsp;&nbsp;0000/00/00 &nbsp;&nbsp;&nbsp; 00시 00분</span>
                                </div>
                                <p>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ감사합니다 </p>
                                <div style="padding-top:20px;">
                                    <a href="#" id="commentp"
                                        onclick="SirenFunction('SirenDiv'); return false;">답글달기</a>
                                </div>

                            </li>


                            <li class="singo_view " id="SirenDiv" style="display:none;">
                                <div style="margin-bottom: 10px;">
                                    <i class="fas fa-paw" style="font-size: 20px;"></i>&nbsp;&nbsp;관리자였으면&nbsp;&nbsp;
                                    <sapn id="commentli_time">&nbsp;&nbsp;0000/00/00 &nbsp;&nbsp;&nbsp; 00시 00분</span>
                                </div>
                                <p>ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ감사합니다 </p>
                                <div style="padding-top:20px;">
                                    <a href="#" id="commentp"
                                        onclick="SirenFunction('SirenDiv'); return false;">답글달기</a>
                                </div>

                            </li>


                        </ul>
                        <script>
                            function SirenFunction(idMyDiv) {
                                var objDiv = document.getElementById(idMyDiv);
                                if (objDiv.style.display == "block") {

                                }
                                else { objDiv.style.display = "block"; }
                            }
                        </script>
                    </div>
                </div>




		</div>

        </section>

    </div>
    

</body>

</html>