<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<!-- Basic Page Info -->
	<meta charset="utf-8">
	<title>wefer</title>

	<!-- Jquery CDN -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  	
	<!-- Site favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="./resources/vendors/images/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="./resources/vendors/images/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="./resources/vendors/images/favicon-16x16.png">
	
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="./resources/vendors/styles/core.css">
	<link rel="stylesheet" type="text/css" href="./resources/vendors/styles/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="./resources/vendors/styles/style.css">


	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-119386393-1');
	</script>
<style>
#file_label {
 display: inline-block;
 padding: .5em .75em;
 color: #999;
 font-size: inherit;
 line-height: normal;
 vertical-align: middle;
 background-color: #fdfdfd;
 cursor: pointer; 
 border: 1px solid #ebebeb; 
 border-bottom-color: #e2e2e2; 
 border-radius: .25em; 
 margin : 5px;

        }
        
 .p-status{
	padding-top:13px;
 	text-align:center;
 	color: white;
 	font-size: inherit;
 	line-height: normal;
 	vertical-align: middle;
 	background-color: #fdfdfd;
 	border: 1px solid #ebebeb; 
 	border-bottom-color: #e2e2e2; 
 	border-radius: .50em; 
 	margin : 5px;
 	width: 100px;
 	height: 50px;
 }
        
 input[name="upload_project_file"]{
 position: absolute;
  width: 1px;
  height: 1px; 
  padding: 0; 
  margin: -1px; 
  overflow: hidden; 
  clip:rect(0,0,0,0); 
  border: 0;
 } 
  
.upload-name { 
display: inline-block; 
padding: .5em .75em; /* label의 패딩값과 일치 */ 
font-size: inherit; 
font-family: inherit; 
line-height: normal; 
vertical-align: middle; 
background-color: #f5f5f5; 
border: 1px solid #ebebeb; 
border-bottom-color: #e2e2e2; 
border-radius: .25em; 
-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
-moz-appearance: none; 
appearance: none; 
}
</style>

</head>
<body>

 <%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<div class="page-header">
					<div class="row">
						<div class="col-md-6 col-sm-12">
		
							<nav aria-label="breadcrumb" role="navigation">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="index.html">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">프로젝트</li>
									<c:if test="${not empty projectDate}">
										<c:forEach items="${projectDate}" var="pcs" varStatus="ms" > 
											<li class="breadcrumb-item active" aria-current="page">${pcs.project_title}</li>
										</c:forEach>
									</c:if>
									
								</ol>
							</nav>
						</div>
						
					</div>
				</div>
				<div class="pd-20 bg-white border-radius-4 box-shadow mb-30">
				<h5>히스토리</h5>
				<hr>
				<div class="blog-list" style="width: 900px; margin: 0 auto;" >
					<div class="row no-gutters">						
						<div class="col-lg-8 col-md-12 col-sm-12" style = "flex: 0 0 100%; max-width: 100%;">
							<div class="blog-caption">
								<div class="blog-by">
									<form action="historyInsert.do" method="post" enctype="multipart/form-data">
									<select id="stauts" class="custom-select col-12" style="width: 30%; float:right; clear: both;">
													<option value="" selected="selected">선택해 주세요</option>
													<option value="진행중">진행중</option>
													<option value="막힘">막힘</option>
													<option value="종료">종료</option>
													
									</select>
									<input type="hidden" name="stauts" value="">
										<div style="width: 100%; display: flex;">
											<div style="width: 10%; text-align: center; margin: 0 auto;">
										<c:if test="${not empty projectDate}">
											<c:forEach items="${projectDate}" var="pcs" varStatus="ms" > 
												<input type="hidden" name="pid" value="${pcs.project_id}">
											</c:forEach>
										</c:if>
										<c:if test="${not empty subid}">
									
											<input type="hidden" name="psid" value="${subid}">
										
										</c:if>
											<c:if test="${not empty projectMemberImg}">
												<div style="width: 100%;">
												<img src = "./resources/image/memberImage/${projectMemberImg.profile}" style="width: 80px; height:80px; border-radius: 50%;" >
												<p>${projectMemberImg.name}</p>
												<input type="hidden" name="sessionId" value="${projectMemberImg.id}">
												</div>
											</c:if>
											
												
											</div>
											<div style="width: 90%;">
												<textarea name="project_datail_content" style="width:100%; height: 100%;"></textarea>
											</div>
										</div>
										<div id="file-form" style="float: right;">
										<label id="file_label" for ="upload_project_file">파일선택</label>
										<input class="upload-name" value="파일선택" disabled="disabled">
										<input id="upload_project_file" name="upload_project_file" type="file" accept=".zip" style="float: right;">
										</div>


										
										<input id="histryAddBtn" type="submit" class="btn btn-secondary btn-lg btn-block" style="background-color: #0b132b" value="글작성">
										
									</form>
									<hr>
								</div>
							</div>
						</div>
					</div>
									<ul>
									
									<c:if test="${not empty projectHistoryList}">
										<c:forEach items="${projectHistoryList}" var="ph" varStatus="a">
										<li>
											<div class="history" style="width: 100%; position: relative;">
												<div class="history-header" style="text-align: right;">
													<c:choose>
 
													    <c:when test="${ph.project_datail_status eq '막힘'}">
													        <label class="p-status" style="background-color: #FE2E2E">${ph.project_datail_status }</label>
													    </c:when>
													 
													    <c:when test="${ph.project_datail_status eq '진행중'}">
													      <label class="p-status" style="background-color: #0080FF">${ph.project_datail_status }</label>
													    </c:when>
													 
													    <c:otherwise>
													      <label class="p-status" style="background-color: #00FF00">${ph.project_datail_status }</label>
													    </c:otherwise>
													 
													</c:choose>


													
													
													
													
													
													</div>
												<div class="userImg" style="width: 90%; margin: 0 auto;">
													
													
													<div class="history-body" style="width: 100%; display: flex;">
													
													<div style="width: 20%; text-align: center; display: flex;" >
														<img src = "./resources/image/memberImage/${ph.profile}" style="width: 50px; height:50px; border-radius: 50%;">
														<div style="display:inline-block; text-align: left;">
														<p style="margin:0; font-size: 10px; font-weight: bold;">${ph.name}</p>
														<p style="margin:0; font-size: 10px;">${ph.project_datail_write_date}</p>
														</div>
														<input type="hidden" name="user_id" value="${ph.id}">
													</div>
												</div>
													<div class="contents" style="width: 100%;  word-break:break-all;">
														<div style="margin: 0;">${ph.project_datail_content }</div>
													</div>
													
												</div>
												<div class="history-footer" style="margin-left: 5%; margin-top: 10px">
												
														<i class="icon-copy fa fa-file-archive-o" aria-hidden="true">첨부파일 : </i>
														<c:if test="${not empty ph.project_datail_file}"> 
														<a style="color: blue;" href="./download.do?fileName=${ph.project_datail_file}">${ph.project_datail_file}</a>
														</c:if>
														<c:if test="${empty ph.project_datail_file}"> 
														첨부된 파일이 없습니다.
														</c:if>
												</div>
												<br>
													<hr style="margin: 0">
													<div class="history-footer-button" style="display:flex; width: 100%;">
													<div class="comment" style="height:40px; line-height:40px; border-bottom-left-radius:10px; border: 1px solid gray; cursor:pointer; width: 33.33333%; text-align: center;">
													댓글달기
													</div>
													<div  class="update" style="height:40px; line-height:40px; border-top: 1px solid black; border-bottom: 1px solid gray;  cursor:pointer; width: 33.33333%; text-align: center;">
													수정
													
													</div>
													
													<div class="delete" style="height:40px; line-height:40px; border-bottom-right-radius:10px; border: 1px solid gray; cursor:pointer; width: 33.33333%; text-align: center;">삭제</div>
												</div>
												
												<div class="commentArea" style="width: 90%; margin: 10px auto; display: none;">
													<div class="commentInsert" style=" play: flex;">
														
														<c:if test="${not empty projectMemberImg}">
															<img src = "./resources/image/memberImage/${projectMemberImg.profile}" style="width: 40px; height:40px; border-radius: 50%;" >
															<input type="hidden" name="sessionId" value="${projectMemberImg.id}">
															
														</c:if>
														<input type="hidden" class="project_datail_id" name="project_datail_id" value="${ph.project_datail_id}">
														<input type="text" name="commentWrite" style="width:700px; height: 40px;">
														<input type="button" class="commentWriteSubmit" style="width: 60px; height: 40px; background-color: #0b132b; border-radius: 5%; color:white; font-size: 13px; text-align: center; line-height:40px;"value="전송">
													
													<hr>
													
													</div>
													<!-- 댓글 대댓글 달리는 구역 -->
													<div class="commentList" style="width: 100%; display: block;">
										
															
													</div>
													<hr>
													<div class="closeCommnetArea" style="width: 100%; height: 20px; text-align: center; line-height: 10px; cursor: pointer;">^</div>
													</div>
											
											</div>
										</li>
										</c:forEach>
										</c:if>
										<c:if test="${empty projectHistoryList}">
											<h3>작업내용이 없습니다.</h3>
										</c:if>
									</ul>
								</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="Medium-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="display: none;" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myLargeModalLabel">히스토리 수정</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
					<form action="projectHistoryUpdate.do" method="post" enctype="multipart/form-data">
					
						<input type="hidden" name="pdid" value="">
				
					<c:if test="${not empty projectDate}">
						<c:forEach items="${projectDate}" var="pcs" varStatus="ms" > 
							<input type="hidden" name="pid" value="${pcs.project_id}">
						</c:forEach>
					</c:if>
					<c:if test="${not empty subid}">
						<input type="hidden" name="subid" value="${subid}">
					</c:if>
				<div class="modal-body" style="margin:0 auto;">
					게시글 : <input type="text" name="update_content" style="width:100%; height: 40px;">
					<br>
					<br>
					수정할 파일 :<br>
					 <input type="file" name="update_file" accept=".zip">
					 <br>
					 <br>
					 중요도 :<br>
					 <select id="update_stauts" class="custom-select col-12" style="width: 100%;">
						<option value="" selected="selected">선택해 주세요</option>
						<option value="진행중">진행중</option>
						<option value="막힘">막힘</option>
						<option value="종료">종료</option>
					</select>
					<input type="hidden" name="update_stauts" value="">
				</div>
				<div class="modal-footer">
					<input type="reset" class="btn btn-secondary" data-dismiss="modal" value="닫기">
					<input type="submit" class="btn btn-primary" value="수정">
				</div>
				</form>
			</div>
		</div>
	</div>
	
		<script type="text/javascript">
		
		
		
			$(document).ready(function(){
				  var fileTarget = $('#upload_project_file');

				    fileTarget.on('change', function(){
				        if(window.FileReader){
				            var filename = $(this)[0].files[0].name;
				        } else {
				            var filename = $(this).val().split('/').pop().split('\\').pop();
				        }

				        $(this).siblings('.upload-name').val(filename);
				    });
				    
				   
			
			
			
			
				
			
		
			
			
			
			}); 
			
			
			$('#stauts').change(function() {
				var status = $("#stauts option:selected").val();	
				$('input[name=stauts]').val(status);
			})
			
			$('#update_stauts').change(function() {
				var status = $("#update_stauts option:selected").val();	
				$('input[name=update_stauts]').val(status);
			})
			
			
			/* 히스토리 추가*/
			$("#histryAddBtn").click(function(){
				var content = $('textarea[name=project_datail_content]').val().trim();				
				var status = $("#stauts option:selected").val().trim();
				
			
				
				if(content == ""){
					$('textarea[name=project_datail_content]').css("border","2px solid red");
					alert('내용을 입력해 주세요');
					return false;
				}else if(status == ""){
					alert('현재상태를 정해 주세요');	
					return false;
				}
				
				if(content != ""){
					$('textarea[name=prj-content]').css("border","1px solid black");
				}
			
			
			});
			
			
			
			$(document).on("click", ".comment", function() {
				
			
				var commentArea = $(this).parent().parent().find('.commentArea');
				
				var project_datail_id = commentArea.find('input[name=project_datail_id]').val();
				var sessionId = commentArea.find('input[name=sessionId]').val();
				var commentList = commentArea.find('.commentList');
				var chk_content_id = commentList.find('.comments');
				
        
				
				console.log("코멘츠" + chk_content_id);
					
				console.log('aaa'+chk_content_id.length);
				
				
				
				
				commentArea.css("display","block");
				
				 $.ajax({
		                url : "${pageContext.request.contextPath}/projecthistoryCommentList.do",
		                type : 'POST',
		                dataType : 'json',
		                data : {
		                project_datail_id : project_datail_id,
		               	id : sessionId
		                },
		                beforeSend : function() {
		                    console.log('Ajax submit 보내기전');
		                },
		                success : function(data) {
		                	if(chk_content_id.length >= data.commentList.length){
		                		alert('다불러오ㅓㅏㅆ습니다');
		                	}else{
		                		for(var i = 0; i<data.commentList.length; i++){
			                    	a = chk_content_id.length;
			                		console.log(a.length);
			                		commentList.append('<div class="comments" style="width: 100%; display: block;">'
				    						+'<div class="comments_block" style="width: 100%; display: flex">'
		                					+	'<div style="width: 5%; text-align: center;">'
				    						+		'<img src="./resources/image/memberImage/'+data.commentList[i].profile+'" style="width: 30px; height:30px; border-radius: 50%;">'
				    						+		'<input type="hidden" name="sessionIds" value="'+data.commentList[i].id+'">'
				    						+		'<input type="hidden" name="project_detail_id" value="'+data.commentList[i].project_detail_id+'">'
				    						+'</div>'
				    						+	'<div class="commentPrints" style="width: 70%; word-break:break-all;">'
				    						+	'<div class="comment_user_name" style="font-size: 12px; font-weight: bold;">'+data.commentList[i].name+'</div>'
				    						+	'<div class="comment_content">'+data.commentList[i].project_comment_content+'</div>'
 				    						+	'<input type="hidden" name="project_comment_ids" value="'+data.commentList[i].project_comment_id+'">'
				    						+'</div>'
					    						+'<div class="comment-nav" style="width: 22%; margin-left: 2%;">'
					    						+	'<label class="commnet_delete" style="margin-left:135px; text-decoration: underline; color:red; font-size: 10px; cursor: pointer;">삭제하기</label>'
					    						+'</div>'
				    						+'</div>'
			    						+'<div class="recommentWriteFMArgin" style="margin-left:5%">'
										+'<div class="recommentWriteF" style="width: 90%; display: none;">'
										+	'<img src="./resources/image/memberImage/default.png" style="width: 30px; height:30px; border-radius: 50%;">'
										+	'<input type="hidden" name="sessionIdse" value="${sessionScope.loginId}">'
										+	'<input type="hidden" name="project_comment_id" value="'+data.commentList[i].project_comment_id+'">'
										+	'<input type="text" name="recommentWrite" style="width:90%; height: 40px;">'
										+	'<input class="recommentWriteOk" type="button" style="margin-left: 5px; margin-bottom:20px; width: 65px; height: 40px; background-color: #0b132b; border-radius: 5%; color:white; font-size: 13px; text-align: center; line-height:40px;" value="전송">'
						 				+'</div> '
						 				+'</div> '
						 				+'<label class="addReComment" style="margin-left:40px; font-size:10px; cursor:pointer; text-decoration:underline;">댓글 더보기</label>'
						 				+'<div class="recomments" style="margin-left:5% display:block">'
						 				+'</div>'
				    					/* +'<div class="recommnet_Print" style="margin-left: 2%; margin-top: 10px; width: 100%; display: flex;">'
										+'	<div style="width: 5%; text-align: center;">'
										+'			<img src="./resources/image/memberImage/default.png" style="width: 30px; height:30px; border-radius: 50%;">'
										+'			<input type="hidden" name="sessionId" value="test1">'
										+'	</div>'
										+'	<div class="recommentPrints" style="width: 98%; word-break:break-all;">'
										+'		<div class="recomment_user_name" style="font-size: 12px; font-weight: bold;">정현봉</div>'
										+'		<div class="recomment_content">ㅁㄴㅇㅁㄴㅁㄴㅁㅇㄴ</div>'
										+'		<label class="recomment_update" style="text-decoration: underline; color:blue; font-size: 10px; cursor: pointer;">수정하기</label>'
										+'		<label class="recommnet_delete" style="text-decoration: underline; color:red; font-size: 10px; cursor: pointer;">삭제하기</label>'
										+'	</div>'
										+'</div>' */
			    						+'</div>'
			    						+'<hr>');
			                		
			                  
			                		
			                  	}
			                	chk_content_id = null;
			                	
			                	/* 댓글 ajax */
		                	}
		                	
		                	
		                }, 
		                error : function(data) {
		                    console.log('Ajax submit error');
		                },
		                complete : function() {
		                	
		                    console.log('Ajax submit complete');
		                }
		            });	 

			});
			
			$('.closeCommnetArea').click(function() {
				var closeCommentArae = $(this).parent();
				var recommentFrm_block = $(this).parent().parent().parent().parent().find('.recommentWriteF');
				
				closeCommentArae.css("display","none")
				recommentFrm_block.css("display","none");
				/* project_comment_id */
			})
			
		 	$(document).on("click",".addReComment", function() {
		 		var recommentFrm_block = $(this).parent().find('.recommentWriteF');
		 		var recomments = $(this).parent().find('.recomments');
		 		var project_comment_id = $(this).parent().find('input[name=project_comment_id]').val();
				console.log(project_comment_id);
				console.log(recomments);
		 		var text = $(this).text();
				if(text == '댓글 더보기'){
					console.log('aaaaaa');
					
					 $.ajax({
			                url : "${pageContext.request.contextPath}/projecthistoryReCommentList.do",
			                type : 'POST',
			                dataType : 'json',
			                data : {
			                	project_comment_id : project_comment_id
			                	
			                },
			                beforeSend : function() {
			                    console.log('Ajax submit 보내기전');
			                },
			                success : function(data) {
			                	for(var i = 0; i<data.recommentList.length; i++){
			                 	recomments.prepend(
			                			'<div class="recommnet_Print" style="margin-left: 2%; margin-top: 10px; width: 100%; display: flex;">'
										+'	<div style="width: 5%; text-align: center;">'
										+'			<img src="./resources/image/memberImage/'+data.recommentList[i].profile+'" style="width: 30px; height:30px; border-radius: 50%;">'
										+'			<input type="hidden" name="user_id" value="'+data.recommentList[i].id+'">'
										+'	</div>'
										+'	<div class="recommentPrints" style="width: 98%; word-break:break-all;">'
										+'		<input type="hidden" name="project_recomment_id" value="'+data.recommentList[i].project_recomment_id+'">'
										+'		<div class="recomment_user_name" style="font-size: 12px; font-weight: bold;">'+data.recommentList[i].name+'</div>'
										+'		<div class="recomment_content">'+data.recommentList[i].project_recomment_content+'</div>'
										+'		<label class="recommnet_delete" style="text-decoration: underline; color:red; font-size: 10px; cursor: pointer;">삭제하기</label>'
										+'	</div>'
										
										
										+'</div>'
										);
			                	
			                	}
			                 
			                	console.log('성공');
			                
			                }, error : function(data) {
			                    console.log('Ajax submit error');
			                
			                }, complete : function() {
			                    console.log('Ajax submit complete');
			                }
					  }); 
					
					
					recommentFrm_block.css("display","flex");
					$(this).text('닫기');
					
					
				
					
					
					
				}else{
					$(this).text('댓글 더보기');
					recommentFrm_block.css("display","none");
					recomments.empty();
				}
			})
				
			
			
			$(".update").click(function() {
				var closeCommentArae = $(this).parent().parent().find('.project_datail_id').val();
				var sessionId = $('input[name=sessionId]').val();
				var user_id = $(this).parent().parent().find('input[name=user_id]').val();
				if(sessionId != user_id){
					alert("작성자만 수정가능합니다.")
					console.log("?????");
			
				}else{
					$(".update").attr({"data-toggle":"modal", "data-target":"#Medium-modal"});
					$('#Medium-modal').modal('show');
				$('input[name=pdid]').val(closeCommentArae);
				console.log(closeCommentArae);
					
				}
			})
			
			$(".delete").click(function() {
				var sessionId = $('input[name=sessionId]').val();
				var user_id = $(this).parent().parent().find('input[name=user_id]').val();
				var project_datail_id = $(this).parent().parent().find('.project_datail_id').val();
				var li = $(this).parent().parent().parent();
				
				console.log(li);
				
				
				if(sessionId != user_id){
					alert("작성자만 삭제가능합니다.")
				}else{
					if(confirm("정말 삭제하시겠습니까 ?") == true){
						
						
		 	 		$.ajax({
							url : "${pageContext.request.contextPath}/projectHistoryDelete.do",
							method : "POST",
							data : {
								project_datail_id : project_datail_id
							},
							success : function(data) {
								li.remove();
								var a = data.sucess;
								alert(a);
							},
							error : function(request, status,
									error) {

								alert("code:" + request.status
										+ "\n" + "message:"
										+ request.responseText
										+ "\n" + "error:"
										+ error);
							}
						});	 
					}
						
				else{
					return;
					}
				}
			})
			
			
			
			$(document).on("click",".recommnet_delete", function() {
				var project_recomment_id = $(this).parent().parent().find('input[name=project_recomment_id]').val();
				console.log(project_recomment_id);
				var id = $(this).parent().parent().find('input[name=user_id]').val();
				console.log(id);
				var recommnet_Print = $(this).parent().parent().parent();
				console.log(recommnet_Print);
				if(confirm("정말 삭제하시겠습니까 ?") == true){ 
					 $.ajax({
						url : "${pageContext.request.contextPath}/projectReCommentDelete.do",
						method : "POST",
						data : {
							project_recomment_id : project_recomment_id,
							id : id
						},
						success : function(data) {
						if(data.fail){
							alert(data.fail);
							
						}else{
							alert(data.sucess);
							recommnet_Print.remove();
						}
						},
						error : function(request, status,
								error) {

							alert("code:" + request.status
									+ "\n" + "message:"
									+ request.responseText
									+ "\n" + "error:"
									+ error);
						}
					});	  
				}else{
					return;
				}  
				
				
				
			})
			
			
			
			
			
			
			$(document).on("click",".commnet_delete", function() {
				var project_comment_id = $(this).parent().parent().parent().find('input[name=project_comment_ids]').val();
				var id = $(this).parent().parent().parent().find('input[name=sessionIds]').val();
				var comments = $(this).parent().parent().parent();
				console.log(comments);
				console.log(project_comment_id);
				console.log(id);
				if(confirm("정말 삭제하시겠습니까 ?") == true){
					$.ajax({
						url : "${pageContext.request.contextPath}/projectCommentDelete.do",
						method : "POST",
						data : {
							project_comment_id : project_comment_id,
							id : id
						},
						success : function(data) {
						if(data.fail){
							alert(data.fail);
						}else{
							comments.remove();
						}
						},
						error : function(request, status,
								error) {

							alert("code:" + request.status
									+ "\n" + "message:"
									+ request.responseText
									+ "\n" + "error:"
									+ error);
						}
					});	 
				}else{
					return;
				}
				
				
				
			})
			
			
			$(document).on("click", ".recommentWriteOk", function() {
				var project_recomment_content = $(this).parent().parent().parent().find('input[name=recommentWrite]').val();
				var comments = $(this).parent().parent().parent().find('.recomments');
				var project_comment_id = $(this).parent().parent().parent().find('input[name=project_comment_id]').val();
				var id = $(this).parent().parent().parent().parent().parent().find('input[name=sessionId]').val();
				console.log("프컨" + project_recomment_content)
				console.log("프아" +project_comment_id)
				console.log(id)
				console.log(comments)
				if(project_recomment_content == null || project_recomment_content == ''){
					alert('답글을 입력해 주세요.'); 
				}else{
					
					  $.ajax({
			                url : "${pageContext.request.contextPath}/projecthistoryReCommentInsert.do",
			                type : 'POST',
			                dataType : 'json',
			                data : {
			                	project_recomment_content : project_recomment_content,
			                	project_comment_id : project_comment_id,
			                	id : id
			                },
			                beforeSend : function() {
			                    console.log('Ajax submit 보내기전');
			                },
			                success : function(data) {
			                	console.log(data.recommentList.length)
			                	comments.prepend(
			                			'<div class="recommnet_Print" style="margin-left: 2%; margin-top: 10px; width: 100%; display: flex;">'
										+'	<div style="width: 5%; text-align: center;">'
										+'			<img src="./resources/image/memberImage/'+data.recommentList[0].profile+'" style="width: 30px; height:30px; border-radius: 50%;">'
										+'			<input type="hidden" name="user_id" value="'+data.recommentList[0].id+'">'
										+'	</div>'
										+'	<div class="recommentPrints" style="width: 98%; word-break:break-all;">'
										+'		<input type="hidden" name="project_recomment_id" value="'+data.recommentList[0].project_recomment_id+'">'
										+'		<div class="recomment_user_name" style="font-size: 12px; font-weight: bold;">'+data.recommentList[0].name+'</div>'
										+'		<div class="recomment_content">'+data.recommentList[0].project_recomment_content+'</div>'
										+'		<label class="recommnet_delete" style="text-decoration: underline; color:red; font-size: 10px; cursor: pointer;">삭제하기</label>'
										+'	</div>'
										
										
										+'</div>'
										);
			                	
			                	
			                 	$('input[name=recommentWrite]').val('');	
			                	
			                
			                }, error : function(data) {
			                    console.log('Ajax submit error');
			                
			                }, complete : function() {
			                    console.log('Ajax submit complete');
			                }
					  }); 
					
				}
			});
			
			
			
			$(document).on("click", ".commentWriteSubmit", function() {
				var comment = $(this).parent().find('input[name=commentWrite]').val();
				var project_datail_id = $(this).parent().find('input[name=project_datail_id]').val();
				var sessionId = $(this).parent().find('input[name=sessionId]').val();
				var commentList = $(this).parent().parent().find('.commentList');
				console.log("인서트"+sessionId);
				
	            $.ajax({
	                url : "${pageContext.request.contextPath}/projecthistoryComment.do",
	                type : 'POST',
	                dataType : 'json',
	                data : {
	                project_comment_content : comment,
	                project_datail_id : project_datail_id,
	               	id : sessionId
	                },
	                beforeSend : function() {
	                    console.log('Ajax submit 보내기전');
	                },
	                success : function(data) {
	                	var a = 0;
	                	if(!data.commentList){
	                		console.log("못받아옴");
	                	}else{
	                		for(var i = 0; i<data.commentList.length; i++){
	                			commentList.append(
	                					'<div class="comments" style="width: 100%; display: block;">'
				    						+'<div class="comments_block" style="width: 100%; display: flex">'
		                					+	'<div style="width: 5%; text-align: center;">'
				    						+		'<img src="./resources/image/memberImage/'+data.commentList[i].profile+'" style="width: 30px; height:30px; border-radius: 50%;">'
 				    						+		'<input type="hidden" name="commentIds" value="'+data.commentList[i].id+'">' 
				    						+		'<input type="hidden" name="sessionIds" value="${sessionScope.loginId}">'
				    						+'</div>'
				    						+	'<div class="commentPrints" style="width: 70%; word-break:break-all;">'
				    						+	'<div class="comment_user_name" style="font-size: 12px; font-weight: bold;">'+data.commentList[i].name+'</div>'
				    						+	'<div class="comment_content">'+data.commentList[i].project_comment_content+'</div>'
				    						+		'<input type="hidden" name="project_comment_id" value="'+data.commentList[i].project_comment_id+'">'
				    						+'</div>'
					    						+'<div class="comment-nav" style="width: 22%; margin-left: 2%;">'
					    						+	'<label class="commnet_delete" style="margin-left:135px; text-decoration: underline; color:red; font-size: 10px; cursor: pointer;">삭제하기</label>'
					    						+'</div>'
				    						+'</div>'
			    						
				    				
			    						+'<div class="recommentWriteFMArgin" style="margin-left:5%">'
										+'<div class="recommentWriteF" style="width: 90%; display: none;">'
										+	'<img src="./resources/image/memberImage/default.png" style="width: 30px; height:30px; border-radius: 50%;">'
										+	'<input type="hidden" name="sessionIdse" value="'+data.commentList[i].id+'">'
										+	'<input type="hidden" name="project_comment_id" value="'+data.commentList[i].project_comment_id+'">'
										+	'<input type="text" name="recommentWrite" style="width:90%; height: 40px;">'
										+	'<input class="recommentWriteOk" type="button" style="margin-left: 5px; margin-bottom:20px; width: 65px; height: 40px; background-color: #0b132b; border-radius: 5%; color:white; font-size: 13px; text-align: center; line-height:40px;" value="전송">'
						 				+'</div> '
						 				+'</div> '	
						 				+'<label class="addReComment" style="margin-left:40px; font-size:10px; cursor:pointer; text-decoration:underline;">댓글 더보기</label>'
						 				+'<div class="recomments" style="margin-left:5% display:block">'
						 				+'</div>'
				    		/* 			+'<div class="recommnet_Print" style="margin-left: 2%; margin-top: 10px; width: 100%; display: flex;">'
										+'	<div style="width: 5%; text-align: center;">'
										+'			<img src="./resources/image/memberImage/default.png" style="width: 30px; height:30px; border-radius: 50%;">'
										+'			<input type="hidden" name="sessionId" value="test1">'
										+'	</div>'
										+'	<div class="recommentPrints" style="width: 98%; word-break:break-all;">'
										+'		<div class="recomment_user_name" style="font-size: 12px; font-weight: bold;">정현봉</div>'
										+'		<div class="recomment_content">ㅁㄴㅇㅁㄴㅁㄴㅁㅇㄴ</div>'
										+'		<label class="recomment_update" style="text-decoration: underline; color:blue; font-size: 10px; cursor: pointer;">수정하기</label>'
										+'		<label class="recommnet_delete" style="text-decoration: underline; color:red; font-size: 10px; cursor: pointer;">삭제하기</label>'
										+'	</div>'
										+'</div>' */
			    						+'</div>'
		               		
							);
		                  
		                  	$('input[name=commentWrite]').val('');	
		                  	}
	                	}
	                	
	                	
	                }, 
	                error : function(data) {
	                    console.log('Ajax submit error');
	                },
	                complete : function() {
	                    console.log('Ajax submit complete');
	                }
	            });
	     
				
			})
 		
	</script>
</body>
</html>