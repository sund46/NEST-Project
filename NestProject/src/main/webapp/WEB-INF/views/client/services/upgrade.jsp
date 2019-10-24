<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <script src="https://kit.fontawesome.com/df37f96d20.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.0.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <title>업그레이드</title>
</head>
<body>
    
        
  
 <div id="topnavbar" >
                     <div id="up_logo">
                    <img src="/resources/images/nest_logo.png"></div>
                     
                     <div style="float: right; margin-top: 10px; margin-right: 20px;">
                <button  type="button" class="btn btn-outline-secondary">노트로이동</button>
                <button type="button" class="btn btn-outline-secondary">고객센터</button>
    </div>
</div>      

<div class="container" style="margin-top: 80px">
    <h3 style="text-align: center;"><b>여러분에게 맞는 서비스를 선택하여 사용할 수 있습니다.</b></h3>
  
        <div class="card-deck mb-3 text-center" style="margin-top: 50px">
          <div class="card mb-4 shadow-sm">
            <div class="card-header">
              <h4 class="my-0 font-weight-normal">Basic</h4>
            </div>
            <div class="card-body">
              <h1 class="card-title pricing-card-title">0 원 <small class="text-muted">/ 월</small></h1>
              <ul class="list-unstyled mt-3 mb-4">
                    <br>
                <li>누구나 무료로 이용가능합니다.</li>
                <li>지금 바로 노트를 작성해보세요.</li>
              </ul>
              <button type="button" class="btn btn-lg btn-block btn-outline-primary">무료 이용 서비스</button>
            </div>
          </div>
          <div class="card mb-4 shadow-sm">
            <div class="card-header">
              <h4 class="my-0 font-weight-normal">Premium</h4>
            </div>
            <div class="card-body">
              <h1 class="card-title pricing-card-title">6,000 원 <small class="text-muted">/ 월</small></h1>
              <ul class="list-unstyled mt-3 mb-4">
                <br>
                <li>모든 자료를 정리하세요.</li>
                <br>

                
              </ul>
              <button type="button" class="btn btn-lg btn-block btn-primary">프리미엄으로 업그레이드</button>
            </div>
          </div>
          <div class="card mb-4 shadow-sm">
            <div class="card-header">
              <h4 class="my-0 font-weight-normal">Business</h4>
            </div>
            <div class="card-body">
              <h1 class="card-title pricing-card-title">15,000 원 <small class="text-muted">/ 월</small></h1>
              <ul class="list-unstyled mt-3 mb-4">
                    <br>
                <li>사람들과 협업해보세요.</li>
                <li>효율적인 똑똑한 서비스</li>
              </ul>
              <button type="button" class="btn btn-lg btn-block btn-primary">비즈니스로 업그레이드</button>
            </div>
          </div>
        </div>
      </div>

        <!-------서비스별 이용혜택-------->
        
    <!------------------->
      <div id="info_div">
      <div id="basic"  style="float: left;">
          <ul id="basic_ul">
            <li id="basic_p">
              &nbsp;&nbsp;&nbsp;장치 간 동기화<p id="basic_pright"><b>최대 2대&nbsp;&nbsp;&nbsp;&nbsp;</b></p>
            </li>
            <li id="basic_p">
                &nbsp;&nbsp;&nbsp;월 업로드 허용량<p id="basic_pright"><b>60 MB</b>&nbsp;&nbsp;&nbsp;&nbsp;</p>
              </li>
              <li id="basic_p">
                  &nbsp;&nbsp;&nbsp;최대 노트 크기<p id="basic_pright"><b>25 MB&nbsp;&nbsp;&nbsp;&nbsp;</b></p>
              </li>
              <li id="basic_p">
                    &nbsp;&nbsp;&nbsp;고객지원<p id="basic_pright"><b>온라인 포럼&nbsp;&nbsp;&nbsp;&nbsp;</b></p>
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
          <li id="basic_p">
            &nbsp;&nbsp;&nbsp;장치 간 동기화<p id="basic_pright"><b>최대 2대&nbsp;&nbsp;&nbsp;&nbsp;</b></p>
          </li>
          <li id="basic_p">
              &nbsp;&nbsp;&nbsp;월 업로드 허용량<p id="basic_pright"><b>60 MB</b>&nbsp;&nbsp;&nbsp;&nbsp;</p>
            </li>
            <li id="basic_p">
                &nbsp;&nbsp;&nbsp;최대 노트 크기<p id="basic_pright"><b>25 MB&nbsp;&nbsp;&nbsp;&nbsp;</b></p>
            </li>
            <li id="basic_p">
                  &nbsp;&nbsp;&nbsp;고객지원<p id="basic_pright"><b>온라인 포럼&nbsp;&nbsp;&nbsp;&nbsp;</b></p>
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
        <li id="basic_p">
          &nbsp;&nbsp;&nbsp;장치 간 동기화<p id="basic_pright"><b>최대 2대&nbsp;&nbsp;&nbsp;&nbsp;</b></p>
        </li>
        <li id="basic_p">
            &nbsp;&nbsp;&nbsp;월 업로드 허용량<p id="basic_pright"><b>60 MB</b>&nbsp;&nbsp;&nbsp;&nbsp;</p>
          </li>
          <li id="basic_p">
              &nbsp;&nbsp;&nbsp;최대 노트 크기<p id="basic_pright"><b>25 MB&nbsp;&nbsp;&nbsp;&nbsp;</b></p>
          </li>
          <li id="basic_p">
                &nbsp;&nbsp;&nbsp;고객지원<p id="basic_pright"><b>온라인 포럼&nbsp;&nbsp;&nbsp;&nbsp;</b></p>
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
