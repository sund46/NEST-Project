<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

	<c:import url="../common/menubar.jsp"/>
	<script>
    var height;
	$(function(){
		
		tinymce.init({
			  selector:'textarea',
			  language : 'ko_KR',
			  
			  plugins: [
			    'link image imagetools table code'
			  ],
			  menubar:false,
			  toolbar: 'undo redo styleselect fontselect fontsizeselect bold italic alignleft aligncenter alignright alignjustify code table imageupload fileupload',
			  allow_script_urls: true,
			  content_css:"https://use.fontawesome.com/releases/v5.2.0/css/all.css",
			  extended_valid_elements: "button[class|id|onclick],script[src|async|defer|type|charset],div,span[*],i[*]",
			  setup: function(editor) {
				  
	              // create input and insert in the DOM
	              var inp2 = $('<input id="tinymce-uploader" type="file" name="pic" style="display:none">');
	              $(editor.getElement()).parent().append(inp2);
	              var inp = $('<input id="tinymce-uploader" type="file" name="pic" accept="image/*" style="display:none">');
	              $(editor.getElement()).parent().append(inp);

	              // add the image upload button to the editor toolbar
	              editor.ui.registry.addButton('imageupload', { 
	                icon: 'image',
	                onAction: function(e) { // when toolbar button is clicked, open file select modal
	                  inp.trigger('click');
	                }
	              });
	              
	              editor.ui.registry.addButton('fileupload', { 
	                icon: 'save',
	                onAction: function(e) { // when toolbar button is clicked, open file select modal
	                  inp2.trigger('click');
	                }
	              });
	               
	              // when a file is selected, upload it to the server
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
	              var scriptLoader = new tinymce.dom.ScriptLoader();
	              
	              $.ajax({
	                url: '${pageContext.request.contextPath}/a/images',
	                type: 'POST',
	                data: data,
	                enctype: 'multipart/form-data',
	                dataType : 'json',
	                processData: false, // Don't process the files
	                contentType: false, // Set content type to false as jQuery will tell the server its a query string request
	                content_css:"",
	                success: function(data, textStatus, jqXHR) {
	                  editor.insertContent('<img class="content-img" src="${pageContext.request.contextPath}' 
	                		  + data.location + '" data-mce-src="${pageContext.request.contextPath}' + data.location + '" />');
	                  
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
	              var scriptLoader = new tinymce.dom.ScriptLoader();
	              
	              $.ajax({
	                url: '${pageContext.request.contextPath}/a/files',
	                type: 'POST',
	                data: data,
	                enctype: 'multipart/form-data',
	                dataType : 'json',
	                processData: false, // Don't process the files
	                contentType: false, // Set content type to false as jQuery will tell the server its a query string request
	                success: function(data, textStatus, jqXHR) {
	                	var file=data.location.split('/');
	                	console.log(file[file.length-1]);
	                	var fileName=file[file.length-1];
	                	
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
			<style>
				#cummunity>div{
					display:inline-block;
				}
			</style>
			<div style="width:100%;min-width:1560px;height:100%;">
			<div id="second_container" value="slide" style="overflow:auto;height:500px;min-height:100%;display:inline-block;width:20.33333%;min-width:364px;;padding: 0 15px;float:left;border-right:1px solid">
			     <div>
			      <div id="sc1" style="border-bottom: 1px solid #1a1a1a; padding: 14px;">
			        <div style="padding-top:10px;">
			        	<h5 style="display:inline-block;">${spaceNoteDetailContents.spaceName}</h5>
			        	<p style="display:inline-block;float:right">0개의 노트</p>
			        </div>
			      </div>
			      <div id="sc2">
			        <div style="padding:10px;">
			          <i class="far fa-lightbulb"></i>
			          <span>
			            노트 활용 Tip !
			            NEST에 오신 것을 환영합니다.
			            NEST는 노트 필기, 작업 관리, 프로젝트 진행, 자료 진행, 자료 정리를 위한 최적의…
			          </span>
			        </div>
			      </div>
			      <style>
			      	li{
			      		list-style:none;
			      	}
			      </style>
			     
					<c:forEach var="note" items="${spaceNoteDetailContents.list}" varStatus="status">
						
							<div class="sc3" style="height:110px;overflow:hidden;border-bottom:1px solid #dcdcdc;padding:10px;cursor:pointer">
					        
					          <script>
					      
					          </script>
					          <span>
					          <input class="noteCheck" type="hidden" value="${note.nno}" style="cursor:zz"/>
					          <div id="list_ntitle">${note.ntitle}</div>
					          <div id="list_ncontent">${note.ncontent}</div>
					          </span>
					        
					      </div>
						
					</c:forEach>
					
				</div>
			 </div>
			 <script>
			 var select;
			 var nno;
				$('.sc3').click(function(){
					$('.sc3').css("background","#fff");
					$(this).css("background","#ebebeb");
					select=$(this).index();
					nno = $(this).children().children('input').val();
					$.ajax({
						url:'${pageContext.request.contextPath}/note/noteDetail.do',
						data:{nno:nno},
						dataType:'json',
						success:function(data){
							console.log(data);
							$('#ntitle').val(data.ntitle);
							tinyMCE.activeEditor.setContent(data.ncontent);
						},error : function(request,status,error){
		    			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    			}
					});
				});
				$('.sc3').mouseenter(function(){
					$('.sc3').css("background","#fff");
					$(this).css("background","#ebebeb");
					$('.sc3').eq(select-3).css("background","#ebebeb");
				});
				$('.sc3').mouseleave(function(){
					$('.sc3').css("background","#fff");
					$('.sc3').eq(select-3).css("background","#ebebeb");
				});
				
				
			</script>
			<!-- Home 화면 구현부분 ////////////////////////////////////////////////////////////////////////////////////////////////////-->
			<div id="community" style="padding:10px 19px;display:inline-block;height:100%;width:76.66666%;">
				
			 <c:if test="${!empty spaceNoteDetailContents.list}">
				<div id="note" style="width:100%;height: 95%;">
			        <div class="Editor-Title" style="height:7.33333%">
						<div class="Title" style="width:100%;border-bottom:1px solid lightgray;height:100%">
							<input type="text" id="ntitle" name="ntitle" placeholder="제목 없음" style="font-size:30px;width:100%; height:100%; border:none; padding-left:10px" />
						</div>
					</div>
					<div id="text" style="overflow:auto;height:92.66666%;k">	
							<textarea id="ncontent" name="ncontent" style="border-color:transparent"><b>테스트입니다.</b></textarea>
					</div>
					
					<style>
					
						.tox-tinymce{
							border:none;
						}
						.tox-toolbar__group{
							display:none;
						}
					</style>
			      </div>
			      <div id="whitebox_footer" style="height:4.9999%">
			        <i class="fas fa-tags" style="font-size: 20px; color: #b8b8b8 ; margin-right: 10px;"></i>
			        <input type="text" placeholder="태그추가" style="border: none; width: 400px;">
			      </div>
			  </c:if>
			</div>
			</div>	
		</div>
		<!-- End of Content Wrapper -->

		<!-- End of Page Wrapper -->
	<script>
	var find = true;
	var i;
	var obj;
	var givenNno = ${nno};
	
	$(function(){ // 처음 페이지 열 때
		var str = '.noteCheck[value='+givenNno+']';
		
		
		$(str).eq(0).prop('checked',true);
		i=$(str).eq(0).val();
		obj=$(str).eq(0);
	
		check($(str).eq(0).prop('checked'),obj);
	});
	
	$('.noteCheck').click(function(){ // 노트 선택 시 
		i = $(this).val();
		console.log(i);
		
		var checked = $(this).prop('checked');
		obj = $(this);
		console.log(checked);
		
		check(checked,obj);
		
	});
	
	function check(checked,obj){
		if(checked){
			$('.noteCheck').prop('checked', false);
			obj.prop('checked', true);
			console.log(i);
			$.ajax({
				url:'${pageContext.request.contextPath}/note/noteDetail.do',
				data:{nno:i},
				dataType:'json',
				success:function(data){
					console.log(data);
					$('#ntitle').val(data.ntitle);
					if(find) $('#ncontent').html(data.ncontent);
					else tinyMCE.activeEditor.setContent(data.ncontent);
					find=false;
				},error : function(request,status,error){
    			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    			}
			});
		}
	}
	
	
	function deleteOneNote(){
		location.href="${pageContext.request.contextPath}"
            +"/note/goBackTrash.do?nno="+i+"&trashcan=Y";
	}
	
	function deleteAllNote(){
		location.href="${pageContext.request.contextPath}"
            +"/note/goAllTrash.do?mno=1&trashcan=Y";
	}
	function afterSave(){
		var ntitle = $('#ntitle').val();
		var ncontent = tinyMCE.activeEditor.getContent();
		$.ajax({
			url:'${pageContext.request.contextPath}/note/saveNote.do',
			type: 'POST',
			data:{nno:nno,ntitle:ntitle,ncontent:ncontent},
			dataType:'json',
			success:function(data){
				if(data){
					alert("저장성공");
					$('.sc3').eq(select-3).children().children('div#list_ntitle').text(ntitle);
					console.log($('#ncontent').text());
					$('.sc3').eq(select-3).children().children('div#list_ncontent').text(tinyMCE.activeEditor.getContent({format: 'text'}));
					
				}else{
					alert("저장실패");}				
				
			},error : function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
function goTrash(){
		
		$.ajax({
			url:'${pageContext.request.contextPath}/notebook/trashGo.do',
			type: 'POST',
			data:{nno:i,trashcan:"Y"},
			dataType:'json',
			success:function(data){
				if(data){
					//alert("삭제성공");
					obj.parent().remove();
					$('.noteCheck').eq(0).prop('checked',true);
					check($('.noteCheck').eq(0).prop('checked'),$('.noteCheck').eq(0));
				}else{
					alert("삭제실패");}				
				
			},error : function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	</script>
	
</body>

</html>
