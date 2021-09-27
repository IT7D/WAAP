<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<html>
	<head>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
	 	<title>커뮤니티</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(document).on("click","#fileDel", function(){
				$(this).parent().remove();
			})
			
			fn_addFile();
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "${contextPath}/community/readView.do?com_no=${update.com_no}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "${contextPath}/community/update.do");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		
		function fn_addFile(){
			var fileIndex = 1;
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
 		var fileNoArry = new Array();
 		var fileNameArry = new Array();
 		function fn_del(value, name){
 			
 			fileNoArry.push(value);
 			fileNameArry.push(name);
 			$("#fileNoDel").attr("value", fileNoArry);
 			$("#fileNameDel").attr("value", fileNameArry);
 		}
		
	</script>
	<body>
	
		<div class="container">
			<header>
				<h1>커뮤니티 수정</h1>
			</header>
			<hr />
			 
			<ul class="nav nav-pills">
				<li class="nav-item"><a class="nav-link active" href="${contextPath}/community/list.do">목록</a></li>
				<li class="nav-item"><a class="nav-link active" href="${contextPath}/community/writeView.do">글 작성</a></li>
				<li class="nav-item"><a class="nav-link active" href="${contextPath}/mypage/mylist.do">내 글보기</a></li>
			</ul>
			<hr />
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="${contextPath}/community/update.do" enctype="multipart/form-data">
					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
					<input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
					
						<div class="form-group">
							<label for="com_no" class="col-sm-2 control-label">글 번호</label>
							<input type="text" id="com_no" name="com_no" class="form-control" value="${update.com_no}" readonly/>
						</div>
							
						<div class="form-group">
							<label for="com_title" class="col-sm-2 control-label">제목</label>
							<input type="text" id="com_title" name="com_title" class="form-control" value="${update.com_title}" />
						</div>
							
						<div class="form-group">
							<label for="com_content" class="col-sm-2 control-label">내용</label>
							<textarea id="com_content" name="com_content" class="form-control" ><c:out value="${update.com_content}" /></textarea>
						</div>
							
						<div class="form-group">
							<label for="member_id" class="col-sm-2 control-label">작성자</label>
							<input type="text" id="member_id" name="member_id" class="form-control" value="${update.member_id}"  readonly/>
						</div>
							

						<div class="form-group">
							<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
							<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>					
						</div>
						
						<div class="form-group">
							<label for="regdate" class="col-sm-2 control-label">수정날짜</label>
							<fmt:formatDate value="${update.modifydate}" pattern="yyyy-MM-dd"/>					
						</div>
						
						<div class="form-group">
							<label for="view_count" class="col-sm-2 control-label">조회수</label>
							<input type="text" id="view_count" name="view_count" class="form-control" value="${update.view_count}" readonly/>					
						</div>
						
						<span>파일 목록</span>
						<div id="fileIndex" class="form-group" style="border: 1px solid #dbdbdb;">	
							<tr>
								<td>
									<c:forEach var="file" items="${file}" varStatus="var">
									<div>
										<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
										<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
										<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
										<button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
									</div>
									</c:forEach>
								</td>
							</tr>
						</div>
						
						<div>
							<button type="button" class="update_btn">저장</button>
							<button type="button" class="cancel_btn">취소</button>
							<button type="button" class="fileAdd_btn">파일추가</button>
						</div>
				
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>
