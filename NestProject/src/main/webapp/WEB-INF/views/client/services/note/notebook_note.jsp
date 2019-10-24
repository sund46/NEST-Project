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
			<div id="cont" style="width:100%;height:100%;">
			<div id="second_container" value="slide" style="overflow:auto;height:500px;min-height:100%;display:inline-block;width:20.33333%;min-width:364px;;padding: 0 15px;float:left;border-right:1px solid">
			     <div>
			      <div id="sc1" style="border-bottom: 1px solid #1a1a1a; padding: 14px;">
			        <div style="padding-top:10px;">
			        	<h5 style="display:inline-block;">${nbtitle}</h5>
			        	<p style="display:inline-block;float:right"><b id="noteCount">0</b>개의 노트</p>
			        </div>
			      </div>
			      
			      <style>
			      	li{
			      		list-style:none;
			      	}
			      </style>
			     
					<c:forEach var="note" items="${list}" varStatus="status">
						
							<div class="sc3" style="height:110px;overflow:hidden;border-bottom:1px solid #dcdcdc;padding:10px;cursor:pointer">
					        
					          
					          <span>
						          <input class="noteCheck" type="hidden" value="${note.nno}" style="cursor:zz"/>
						          <div class="list_ntitle" id="list_ntitle">${note.ntitle}</div>
						          <div class="list_ncontent1" id="list_ncontent1" style="display:none;text-overflow: ellipsis;">${note.ncontent}</div>
						          <div style="height:51px;overflow:hidden"><div class="list_ncontent" id="list_ncontent"></div></div>
						          <div class="nDate" style="font-size:11px;text-align:right;">${note.nDate}</div>
					          </span> 
					        
					      </div>
						
					</c:forEach>
					
				</div>
			 </div>
			 <script>
			 
			 var select;
				$(function(){
					var value = 0;
					
					// 노트 리스트 색 입히기
					while(value < 100) {
						 $('.list_ncontent').eq(value).text($('.list_ncontent1').eq(value).text());
						 value++;
					}
					console.log($('.list_ntitle').eq(0).text());
					$('#ntitle').text($('.list_ntitle').eq(0).text());
					tinyMCE.activeEditor.setContent($('.list_ncontent').eq(0).html());
					$('.sc3').eq(select).css("background","#ebebeb");
					
					// 에디터 반응형으로..
					var cont = $('#cont').width();
					  var sc = $('#second_container').width();
					  var com = cont-sc-38;
					  console.log(cont+"/"+sc+"/"+com);
					  $('#community').css("width",com);
					
					  noteCount=$('.sc3').index($('.sc3').last())+1;
						$('#noteCount').text(noteCount);
					  
				 });
			 
			 var nno = $('.noteCheck').first().val();
				$('.sc3').click(function(){
					$('.sc3').css("background","#fff");
					$(this).css("background","#ebebeb");
					select=$('.sc3').index(this);
					nno = $('.noteCheck').eq(select).val();
					$.ajax({
						url:'${pageContext.request.contextPath}/note/noteDetail.do',
						data:{nno:nno},
						dataType:'json',
						success:function(data){
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
					$('.sc3').eq(select).css("background","#ebebeb");
				});
				$('.sc3').mouseleave(function(){
					$('.sc3').css("background","#fff");
					$('.sc3').eq(select).css("background","#ebebeb");
				});
				
				
			</script>
			<!-- Home 화면 구현부분 ////////////////////////////////////////////////////////////////////////////////////////////////////-->
			<div id="community" style="padding:10px 19px;display:inline-block;height:100%;">
				
			 <c:if test="${!empty list}">
				<div id="note" style="width:100%;height: 95%;">
			        <div class="Editor-Title" style="height:7.33333%">
						<div class="Title" style="width:100%;border-bottom:1px solid lightgray;height:100%">
							<input type="text" id="ntitle" name="ntitle" placeholder="제목 없음" style="font-size:30px;width:100%; height:100%; border:none; padding-left:10px" />
						</div>
					</div>
					<div id="text" style="overflow:auto;height:92.66666%;">	
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
		
		$( window ).resize( function() {
			  
			  var cont = $('#cont').width();
			  var sc = $('#second_container').width();
			  var com = cont-sc-38;
			  
			  $('#community').css("width",com);
		} );
	function deleteOneNote(){
		
		$.ajax({
			url:'${pageContext.request.contextPath}/note/goBackTrash.do',
			data:{nno:nno,trashcan:'Y'},
			dataType:'json',
			success:function(data){
				alert("삭제성공");
				$('.sc3').eq(select).remove();
				$('#ntitle').val(null);
				tinyMCE.activeEditor.setContent("  ");
				
				select=1000;
				noteCount=$('.sc3').index($('.sc3').last())+1;
				$('#noteCount').text(noteCount);
				
			},error : function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
        
	}
	
	function deleteAllNote(){
		location.href="${pageContext.request.contextPath}"
            +"/note/goAllTrash.do?mno="+${member.mNo}+"&trashcan=Y";
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
					$('div#list_ntitle').eq(select).text(ntitle);
					console.log($('#ncontent').text());
					$('div#list_ncontent').eq(select).text(tinyMCE.activeEditor.getContent({format: 'text'}));
				}else{
					alert("저장실패");}				
				
			},error : function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}

	
function copyNote(){
	location.href="${pageContext.request.contextPath}/notebook/copyNote.do?nno="+nno+"&mno=${member.mNo}&nbno=${nbno}&nbtitle=${nbtitle}";
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
		data:{ttitle:ntitle,tcontent:ncontent},
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
$('.selectNbno').click(function(){
	var index = $('.selectNbno').index(this);
	var nbno = $('.nbno').eq(index).val();
	
	$.ajax({
		url:'${pageContext.request.contextPath}/note/moveNbno.do',
		data:{nno:nno,nbno:nbno},
		type : 'post',
		dataType:'json',
		success:function(data){
			alert("이동 성공하였습니다.");

			// 노트 지우기
			$('.sc3').eq(select).remove();
			
			// 노트 상세 비우기
			$('#ntitle').val(null);
			tinyMCE.activeEditor.setContent("  ");
			
			// 노트 갯수
			noteCount=$('.sc3').index($('.sc3').last())+1;
			$('#noteCount').text(noteCount);
			
			select=1000;
			$('#moveNote').modal("hide");
		},error : function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
	
	
});
function goCommunity(){
	var cate1 =$('#cate1').val();
	var cate2 =$('#cate2').val();
	console.log(cate1+"/"+cate2);
	var nickname = $('.nickname').text();
	var ntitle = $('#ntitle').val();
	var ncontent = tinyMCE.activeEditor.getContent();
	$.ajax({
		url:'${pageContext.request.contextPath}/note/goCommunity.do',
		data:{ntitle:ntitle,ncontent:ncontent,nickname:nickname,cate1:cate1,cate2:cate2},
		type : 'post',
		dataType:'json',
		success:function(data){
			alert("게시글 업로드 성공");

			

			$('#goCom').modal("hide");
			
		},error : function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
	</script>
	
</body>

</html>
