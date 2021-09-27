<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<html>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<head>
		<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
	 	<title>커뮤니티</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "${contextPath}/community/write.do");
				formObj.attr("method", "post");
				formObj.submit();
			});
			fn_addFile();
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		
		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
		
	</script>
	
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<ul class="nav nav-pills">
				<li class="nav-item"><a class="nav-link active" href="${contextPath}/community/list.do">목록</a></li>
				<li class="nav-item"><a class="nav-link active" href="${contextPath}/community/writeView.do">글 작성</a></li>
				<li class="nav-item"><a class="nav-link active" href="${contextPath}/mypage/mylist.do">내 글보기</a></li>
			</ul>
			<hr />
			
			<section id="container">
				<form name="writeForm" method="post" action="${contextPath}/community/write.do" enctype="multipart/form-data">
				
					<table>
						<tbody>
								<tr>
									<td>
										<label for="com_title">제목</label><input type="text" id="com_title" name="com_title" class="chk" title="제목을 입력하세요." />
									</td>
								</tr>	
								<tr>
									<td>
										<label for="com_content">내용</label><textarea id="com_content" name="com_content" class="chk" title="내용을 입력하세요."></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<label for="member_id">작성자</label><input type="text" id="member_id" name="member_id" value="${memberInfo.member_id}" readonly/>
									</td>
								</tr>
								<tr>
									<td id="fileIndex">
									</td>
								</tr>
								<tr>
									<td>						
										<button class="write_btn" type="submit">작성</button>
										<button class="fileAdd_btn" type="button">파일추가</button>
									</td>
								</tr>
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>