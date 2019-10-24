# NEST-Project
## Overview
![Alt text](images/nest1.PNG)
![Alt text](images/nest2.PNG)
![Alt text](images/nest3.PNG)
![Alt text](images/nest4.PNG)
## Function
![Alt text](images/Overview.PNG)
## DB 설계
![Alt text](images/db.PNG)
## 담당 임무
자료 저장 담당
1. 노트(문서) 작성
2. 노트북 생성
3. 이미지, 파일 첨부
4. 템플릿 형식 저장 및 적용
5. 휴지통
## Skills
![Alt text](images/skills.PNG)
## 랜딩 페이지
One-Page로 서비스에 대한 간략한 설명을 제공하도록 하였습니다.
![Alt text](images/landing.png)
## 회원 관련 기능
### 회원가입
회원가입시 해야하는 기본적인 유효성검사를 하였습니다.

* 이메일, 이름, 비밀번호, 비밀번호 확인, 주민등록번호, 닉네임, 핸드폰번호를 입력받고 해당 데이터가 입력되지 않았을 경우 해당 태그에 포커싱되게 하고 회원가입이 되지 않게 하였습니다.
* 이메일은 ex) test@gmail.com 처럼 @ 앞에 아이디 뒤에 메일주소를 입력하지 않으면 회원가입이 되지 않도록 하였습니다.
* 작성한 이메일로 인증번호를 발송하여 이메일 인증을 하도록 JavaMailSender 라이브러리와 네이버 SMTP(POP3 방식)을 사용하였습니다.
* 회원정보 등록시 DB에서 이메일의 중복 여부를 체크하여 중복되어있을 경우 중복된 이메일이라는 경고창과 함께 회원가입이 되지 않도록 하였습니다.
* 이름은 2~10글자 이내로 한글 및 영문만 입력하게 하였습니다.
* 비밀번호와 비밀번호 확인은 영문+숫자+특수문자 조합으로 8~16이내의 정보를 입력하지 않거나 둘의 값이 다를 경우 회원가입이 되지 않도록 하였습니다.
![Alt text](images/join.PNG)
![Alt text](images/agreement.png)
### ID / PWD 찾기
핸드폰 비밀번호 인증을 통해 ID / PWD를 찾을 수 있도록 하였습니다.
![Alt text](images/searchid.PNG)
![Alt text](images/searchpw.PNG)
## 노트
위지윅 API 설명
### 새 노트
![Alt text](images/note1.png)
![Alt text](images/menu.PNG)
![Alt text](images/move.png)
### 노트북
![Alt text](images/notebook.png)
![Alt text](images/newnotebook.PNG)
### 템플릿
### 휴지통
![Alt text](images/trash.png)
## 스페이스
### 스페이스 생성
![Alt text](images/space1.PNG)
### 노트 조회 / 보기
![Alt text](images/space2.png)
### 중요 노트 고정
![Alt text](images/space3.PNG)
### 실시간 채팅 서비스
![Alt text](images/chat.png)
![Alt text](images/chat2.png)
