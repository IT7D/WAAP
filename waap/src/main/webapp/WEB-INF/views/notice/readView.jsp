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
	 	<title>공지사항</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "${contextPath}/admin/notice/updateView.do");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				var deleteYN = confirm("삭제하시겠습니까?");
				
				if(deleteYN == true){
					
				formObj.attr("action", "${contextPath}/admin/notice/delete.do");
				formObj.attr("method", "post");
				formObj.submit();
				
				}
			})

			// 목록
			$(".list_btn").on("click", function(){
				
				location.href = "${contextPath}/notice/list.do";
			})				
		})
		function fn_fileDown(fileNo){
			var formObj = $("form[name='readForm']");
			$("#FILE_NO").attr("value", fileNo);
			formObj.attr("action", "${contextPath}/notice/fileDown.do");
			formObj.submit();
		}
	</script>
	<body>
	
		<div class="container">
			<header>
				<h1>공지사항</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="notice_no" name="notice_no" value="${read.notice_no}" />
					<input type="hidden" id="FILE_NO" name="FILE_NO" value="">
				</form>
					
						<div class="form-group">
							<label for="notice_no" class="col-sm-2 control-label">글 번호</label>
							<input type="text" id="notice_no" name="notice_no" class="form-control" value="${read.notice_no}" readonly="readonly"/>
						</div>
							
						<div class="form-group">
							<label for="com_title" class="col-sm-2 control-label">제목</label>
							<input type="text" id="notice_title" name="notice_title" class="form-control" value="${read.notice_title}" readonly="readonly"/>
						</div>
							
						<div class="form-group">
							<label for="notice_cont" class="col-sm-2 control-label">내용</label>
							<textarea id="notice_cont" name="notice_cont" class="form-control" readonly="readonly"><c:out value="${read.notice_cont}"  /></textarea>
						</div>
							
						<div class="form-group">
							<label for="member_id" class="col-sm-2 control-label">작성자</label>
							<input type="text" id="member_id" name="member_id" class="form-control" value="${read.member_id}" readonly="readonly" />
						</div>
							
						<div class="form-group">
							<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
							<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/>					
						</div>
						
						<div class="form-group">
							<label for="view_count" class="col-sm-2 control-label">조회수</label>
							<input type="text" id="view_count" name="view_count" class="form-control" value="${read.view_count}" readonly="readonly" />					
						</div>
						
						<hr>
						<span>파일 목록</span>
						<div class="form-group" style="border: 1px solid #dbdbdb;">
							<c:forEach var="file" items="${file}">
								<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
							</c:forEach>
						</div>
						<hr>
					<div>
					<c:if test="${memberInfo.member_id == 'admin' }">
						<button type="submit" class="update_btn btn btn-warning">수정</button>
						<button type="submit" class="delete_btn btn btn-danger">삭제</button>
					</c:if>
						<button type="submit" class="list_btn btn btn-primary">목록</button>	
					</div>
			</section>
			<hr />
		</div>
	</body>
</html>
