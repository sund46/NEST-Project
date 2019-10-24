<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		var i = $('#text').css('height');
		var arr = i.split('p');
		
		console.log(arr[0]);
		height=arr[0]-2;
		console.log(height);
		tinymce.init({
			  selector:'textarea',
			  language : 'ko_KR',
			  height: height,
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
			<!-- Home 화면 구현부분 ////////////////////////////////////////////////////////////////////////////////////////////////////-->
			<div id="community" style="padding:10px 19px;">
				<div id="note" style="height: 800px;">
					<input id="nno" type="hidden" value="${nno}" />
					<input id="mno" type="hidden" value="${member.mNo }" />
			        <div class="Editor-Title" style="width:100%;height:7.33333%">
						<div class="Title" style="width:100%;border-bottom:1px solid lightgray;height:100%">
							<input type="text" id="ntitle" name="ntitle" placeholder="제목 없음" style="font-size:30px;width:100%; height:100%; border:none; padding-left:10px" />
						</div>
					</div>
					<div id="text" style="overflow:auto;height:92.66666%;k">	
							<textarea id="ncontent" name="ncontent" style="border-color:transparent"></textarea>
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
			      <div id="whitebox_footer">
			        <i class="fas fa-tags" style="font-size: 20px; color: #b8b8b8 ; margin-right: 10px;"></i>
			        <input type="text" placeholder="태그추가" style="border: none; width: 400px;">
			      </div>
			</div>	
		</div>
		<!-- End of Content Wrapper -->

		<!-- End of Page Wrapper -->
		<script>
			function firstSave(){
				var nno=0;
				var ntitle = $('#ntitle').val();
				var ncontent = tinyMCE.activeEditor.getContent();
				var mno=$('#mno').val();
				if($('#nno').val()>0){
					console.log($('#nno').val());
					nno=$('#nno').val();
				}
				console.log(nno+"/"+ntitle+"/"+mno);
				$.ajax({
					url:"${pageContext.request.contextPath}/note/firstSave.do",
					type: 'POST',
					data:{mno:mno,nno:nno,ntitle:ntitle,ncontent:ncontent},
					dataType:'json',
					success:function(data){
						alert("저장성공");
						$('#nno').val(data);
					},error : function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
				
			}
			function template(){
				$("#myModal").modal();	
			}
			
			$('.noteTemplate').click(function(){
				var index = $('.noteTemplate').index(this);
				//tinyMCE.activeEditor.setContent($('.tcontent').eq(index).val());
				var tno = $('.tno').eq(index).val()
				
				console.log(index+"/"+tno);
				$.ajax({
					url:'${pageContext.request.contextPath}/template/Tselect.do',
					data:{tno:tno},
					type:'post',
					dataType:'json',
					success:function(data){
						tinyMCE.activeEditor.setContent(data.tcontent);
						$('#myModal').modal("hide");
					},error : function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
				
			});
			
			function insertTemplate(){
				var ntitle = $('#ntitle').val();
				var ncontent = tinyMCE.activeEditor.getContent();
				$.ajax({
					url:'${pageContext.request.contextPath}/template/Tinsert.do',
					data:{mno:${member.mNo},ttitle:ntitle,tcontent:ncontent},
					type : 'post',
					dataType:'json',
					success:function(data){
						if(data.tf){
							alert("템플릿이 저장되었습니다.");
						}else{
							alert("템플릿 저장을 실패하였습니다.");}				
					},error : function(request,status,error){
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
				
			}
		</script>

</body>

</html>
