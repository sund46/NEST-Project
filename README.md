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
노트의 작성을 위하여 위지윅 에디서 TinyMCE API를 사용하였습니다.
* 글꼴편집, 표 삽입, 코드 변환이 가능합니다.
* 이미지편집이 가능하지만, 이미지업로드와 파일업로드 기능을 제공하지 않아 커스터마이징을 통해 직접 기능을 구현하였습니다.
![Alt text](images/tiny.png)
![Alt text](images/tinyMCE.png)
<pre><code>
// 파일, 이미지 업로드 커스터마이징 코드입니다.
<script>
	var height;
	$(function(){
    // 페이지 크기만큼 위지윅에디터의 사이즈를 조절하기 위한 높이변수 
		var i = $('#text').css('height');
		var arr = i.split('p');
		
		console.log(arr[0]);
		height=arr[0]-2;
		console.log(height);
		tinymce.init({
			  selector:'textarea',
			  language : 'ko_KR', // 언어 설정
			  height: height, // 높이 설정
			  plugins: [
			    'link image imagetools table code'
			  ],
			  menubar:false, // 메뉴바 사용하지 않음
        // 툴바에 사용할 기능 설정 (imageupload, fileupload는 직접 구현한 기능 추가)
			  toolbar: 'undo redo styleselect fontselect fontsizeselect bold italic alignleft aligncenter alignright alignjustify code table imageupload fileupload',
			  allow_script_urls: true, // 위지윅에디터 내 script 적용
			  content_css:"https://use.fontawesome.com/releases/v5.2.0/css/all.css", // CSS파일 적용
        // 사용할 요소 추가
			  extended_valid_elements: "button[class|id|onclick],script[src|async|defer|type|charset],div,span[*],i[*]",
			  setup: function(editor) { // 커스터마이징
				  
	              // DOM에 input:file, input:image 태그 추가
	              var inp2 = $('<input id="tinymce-uploader" type="file" name="pic" style="display:none">');
	              $(editor.getElement()).parent().append(inp2);
	              var inp = $('<input id="tinymce-uploader" type="file" name="pic" accept="image/*" style="display:none">');
	              $(editor.getElement()).parent().append(inp);

	              // 툴바에 추가할 업로드버튼 설정
	              editor.ui.registry.addButton('imageupload', { 
	                icon: 'image',
	                onAction: function(e) { // 툴바에서 버튼클릭 시, 파일 또는 이미지 선택 Modal을 띄움
	                  inp.trigger('click');
	                }
	              });
	              
	              editor.ui.registry.addButton('fileupload', { 
	                icon: 'save',
	                onAction: function(e) {
	                  inp2.trigger('click');
	                }
	              });
	               
	              
	              // 파일,이미지가 선택되었을 때, 함수를 통한 업로드
	              inp.on("change", function(e){
	                uploadImage($(this), editor);
	              });
				  
	              inp2.on("change", function(e){
	                uploadFile($(this), editor);
	              });
	              
	            function uploadImage(inp, editor) {
	              var input = inp.get(0);
	              var data = new FormData();
	              data.append('files', input.files[0]);
	              
	              $.ajax({
	                url: '${pageContext.request.contextPath}/a/images',
	                type: 'POST',
	                data: data,
	                enctype: 'multipart/form-data', //파일의 경로와 내용을 전송
	                dataType : 'json',
	                processData: false, // Don't process the files
	                contentType: false, // Set content type to false as jQuery will tell the server its a query string request
	                content_css:"",
	                success: function(data, textStatus, jqXHR) {
                    // 성골 시 img태그로 이미지 추가
	                  editor.insertContent('<img class="content-img" src="${pageContext.request.contextPath}' + data.location + '" data-mce-src="${pageContext.request.contextPath}' + data.location + '" />');
	                  
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                  if(jqXHR.responseText) {
	                    errors = JSON.parse(jqXHR.responseText).errors
	                    alert('Error uploading image: ' + errors.join(", ") + '. Make sure the file is an image and has extension jpg/jpeg/png.');
	                  }
	                }
	              });
	            }
	            
	            function uploadFile(inp, editor) {
	              var input = inp.get(0);
	              var data = new FormData();
	              data.append('files', input.files[0]);
	              
	              $.ajax({
	                url: '${pageContext.request.contextPath}/a/files',
	                type: 'POST',
	                data: data,
	                enctype: 'multipart/form-data', //파일의 경로와 내용을 전송
	                dataType : 'json',
	                processData: false, // form-data를 String으로 전달하지 않게함.
	                contentType: false, // contentType 헤더가 multipart/form-data 전달하게 함
	                success: function(data, textStatus, jqXHR) {
	                	var file=data.location.split('/');
	                	console.log(file[file.length-1]);
	                	var fileName=file[file.length-1]; // 파일명 추출
	                	// 성골 시 a태그로 파일을 추가하여 다운로드 가능
	                  editor.insertContent('<a href="${pageContext.request.contextPath}'+data.location+'" style="color:gray;font-weight:normal;"><i class="far fa-file-archive"></i> '+fileName+' </a>');
	                  
	                },
	                error: function(jqXHR, textStatus, errorThrown) {
	                  if(jqXHR.responseText) {
	                    errors = JSON.parse(jqXHR.responseText).errors
	                    alert('Error uploading image: ' + errors.join(", ") + '. Make sure the file is an image and has extension jpg/jpeg/png.');
	                  }
	                }
	              });
	            }   
	      }
			  });
	});
</script>
</code></pre>
<pre><code>
// NoteController.java
@RequestMapping(value = "/a/images", method = RequestMethod.POST)
@ResponseBody
public String handleTinyMCEUpload(@RequestParam("files") MultipartFile files[],HttpSession session) {
    System.out.println("uploading______________________________________MultipartFile " + files.length);
    // 업로드 될 파일의 경로
    String filePath = "/resources/uploads/images/" + files[0].getOriginalFilename();
    String result = uploadFilesFromTinyMCE("images", files, false,session);
    System.out.println(result);
    return "{\"location\":\"" + filePath + "\"}";

}
@RequestMapping(value = "/a/files", method = RequestMethod.POST, produces = "application/String; charset=utf8")
@ResponseBody
public String handleTinyMCEUpload2(@RequestParam("files") MultipartFile files[],HttpSession session) {
    System.out.println("uploading______________________________________MultipartFile " + files.length);
    String filePath = "/resources/uploads/files/" + files[0].getOriginalFilename();
    String result = uploadFilesFromTinyMCE("files", files, false,session);
    System.out.println(result);
    return "{\"location\":\"" + filePath + "\"}";
}
private String uploadFilesFromTinyMCE(String prefix, MultipartFile files[], boolean isMain,HttpSession session) {
  ServletContext context=session.getServletContext();
    System.out.println("uploading______________________________________" + prefix);
    try {
        // 폴더 경로
        String folder = context.getRealPath("/") + "/resources/uploads/" + prefix+"/";
        StringBuffer result = new StringBuffer();
        byte[] bytes = null;
        result.append("Uploading of File(s) ");

        for (int i = 0; i < files.length; i++) {
            if (!files[i].isEmpty()) {
                try {
                    boolean created = false;
                    try {
                        // 폴더 생성
                        File theDir = new File(folder); 
                        theDir.mkdir();
                        created = true;
                    } catch (SecurityException se) {
                        se.printStackTrace();
                    }
                    if (created) {
                        System.out.println("DIR created");
                    }
                    String path = "";
                    path = folder + files[i].getOriginalFilename();
                    File destination = new File(path);
                    System.out.println("--> " + destination);
                    System.out.println("파일전송");
                    // 경로에 파일 전송
                    files[i].transferTo(destination);
                    result.append(files[i].getOriginalFilename() + " Succsess. ");
                } catch (Exception e) {
                    throw new RuntimeException("Product Image saving failed", e);
                }
            } else
                result.append(files[i].getOriginalFilename() + " Failed. ");
        }
        return result.toString();

    } catch (Exception e) {
        return "Error Occured while uploading files." + " => " + e.getMessage();
    }
}
</code></pre>

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
