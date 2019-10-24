<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath }/resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Now UI Dashboard by Creative Tim
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport'
  />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
    crossorigin="anonymous">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath }/resources/assets/css/now-ui-dashboard.css?v=1.3.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath }/resources/assets/demo/demo.css" rel="stylesheet" />

  <style>
    .InfoBadge {
      width: 144px;
      vertical-align: top;
      text-align: center;
      display: inline-block;
    }

    .circle-btn {
      width: 75px;
      height: 75px;
      background: white;
      padding: 10px 16px;
      border-radius: 37px;
      border: 2px solid #e7722e ;
      font-size: 24px;
      line-height: 1.33;
    }

    .circle-btn-name{
      padding-top: 15px;
    }

    .total{
      vertical-align: top;
      text-align: center;
      display: inline-block;
    }

    .total-data{
      font-size: 23px; 
      font-weight: 400; 
      margin-left: 10px;
    }

    .UserBadge{
      vertical-align: top;
      text-align: center;
      display: inline-block;
    }

    .InfoBadge .circle-btn:hover{
      background: #e7722e ;
      border: 2px solid #e7722e ;
    }
  </style>
</head>

<body class="">
  <div class="wrapper ">
  
  <!-- Sidebar -->
  <%-- <c:import url="../services/common/menubar.jsp"/> --%>
    <c:import url="../common/setting_sidebar.jsp"/>
    
    <div class="main-panel" id="main-panel">
      <!-- Navbar -->
      <c:import url="../common/setting_navbar.jsp"/>
      <!-- End Navbar -->
      <div class="panel-header panel-header-sm">
      </div>
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h4 class="card-title"> 사용자 요약</h4>
              </div>
              <div class="card-body">
                <div class="InfoBadge">
                  <button type="button" class="btn circle-btn">
                    <a style="color: black;"
                       href="${pageContext.request.contextPath}/member/memberManage.do">${ totalBusinessMember }</a>
                  </button>
                  <div class="circle-btn-name">사용자</div>
                </div>
                <div class="InfoBadge">
                  <button type="button" class="btn circle-btn">
                    <a style="color: black;"
                        href="${pageContext.request.contextPath}/member/memberManage.do">${ totalApprovalN }</a>
                  </button>
                  <div class="circle-btn-name">승인 보류</div>
                </div>
                <div class="InfoBadge">
                  <button type="button" class="btn circle-btn">
                    <a style="color: black;">${ maximumMember }</a>
                  </button>
                  <div class="circle-btn-name">남은 사용자 수</div>
                </div>
                <div class="InfoBadge">
                  <button type="button" class="btn circle-btn">
                    <a style="color: black;"
                        href="${pageContext.request.contextPath}/member/memberManage.do">${ totalBusinessAdmin }</a>
                  </button>
                  <div class="circle-btn-name">관리자</div>
                </div>

                <br><br><br>
                <hr>
                <br>
                <div class="total" style="margin-left: 30px;">
                  <i class="now-ui-icons design_app" style="font-size: 15px;"></i>
                  <a class="total-data">${ totalSpace }</a>
                  <div>비즈니스의 전체 스페이스</div>
                </div>
                <div class="total" style="margin-left: 60px;">
                  <i class="now-ui-icons files_single-copy-04" style="font-size: 15px;"></i>
                  <a class="total-data">${ countNoteBook }</a>
                  <div>비즈니스의 전체 노트북</div>
                </div>
                <div class="total" style="margin-left: 60px;">
                  <i class="now-ui-icons files_paper" style="font-size: 15px;"></i>
                  <a class="total-data">${ countNote }</a>
                  <div>비즈니스의 전체 노트</div>
                </div>

                <br><br><br>
                <hr>
                <br>
                
                <h7 style="margin-left: 2%;">최근에 가입</h7><br><br>
                  <!-- <div class="UserBadge" style="margin-left: 60px;">
                    <i class="now-ui-icons users_circle-08" style="font-size: 40px;"></i>
                    <div>
                      <a class="">가입일</a><br>
                      <a class="">사용자명</a>
                    </div>
                  </div> -->
                  <c:forEach items="${ businessMemberList }" var="m">
                  <div class="UserBadge" style="margin-left: 60px;">
                    <i class="now-ui-icons users_circle-08" style="font-size: 40px;"></i>
                    <div>
                      <a class="">${ m.spaceEnrollDate }</a><br>
                      <a class="">${ m.userName }</a>
                    </div>
                  </div>
                  </c:forEach>
                  <br><br>
                <h7 style="margin-left: 2%;">관리자</h7><br><br>
                <c:forEach items="${ businessAdmin }" var="bA">
                <div class="UserBadge" style="margin-left: 60px;">
                  <i class="now-ui-icons users_circle-08" style="font-size: 40px;"></i>
                  <div>
                    <a class="">${ bA.spaceEnrollDate }</a><br>
                    <a class="">${ bA.userName }</a>
                  </div>
                </div>
                </c:forEach>

              </div>
            </div>
          </div>
        </div>
      </div>
          
      <footer class="footer">
        <div class="container-fluid">
          <nav>
            <ul>
              <li>
                <a href="https://www.creative-tim.com">
                  Creative Tim
                </a>
              </li>
              <li>
                <a href="http://presentation.creative-tim.com">
                  About Us
                </a>
              </li>
              <li>
                <a href="http://blog.creative-tim.com">
                  Blog
                </a>
              </li>
            </ul>
          </nav>
          <div class="copyright" id="copyright">
            &copy;
            <script>
              document.getElementById('copyright').appendChild(document.createTextNode(new Date().getFullYear()))
            </script>, Designed by
            <a href="https://www.invisionapp.com" target="_blank">Invision</a>. Coded by
            <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>.
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath }/resources/assets/js/core/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/core/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="${pageContext.request.contextPath }/resources/assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="${pageContext.request.contextPath }/resources/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${pageContext.request.contextPath }/resources/assets/js/now-ui-dashboard.min.js?v=1.3.0" type="text/javascript"></script>
  <!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
  <script src="${pageContext.request.contextPath }/resources/assets/demo/demo.js"></script>
</body>

</html>