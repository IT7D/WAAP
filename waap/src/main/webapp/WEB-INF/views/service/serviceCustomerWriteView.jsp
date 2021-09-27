<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    


<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<script>
var fileIndex = 1;

function fn_addFile(){

	$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
	
	$(document).on("click","#fileDelBtn", function(){
		$(this).parent().remove();
		
	});
}

</script>



<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		
	<h1>1:1문의 글 작성 페이지</h1>
	
	<form action="${contextPath }/service/serviceCustomerWrite.do" method="post" enctype="multipart/form-data">
	
		<table>
			<tbody>
				<tr>
					<td>제목 : <input type="text" name="serviceCustomer_title"></td>
				</tr>
				<tr>
					<td>내용 : <textarea name="serviceCustomer_content"  cols="50" rows="20"></textarea></td>
				</tr>	
				
				<tr>
					<td id="fileIndex"></td>
				</tr>
			</tbody>
		</table>
		
		
		
		<input type="submit" value="글 작성">
		<button type="button" onclick=fn_addFile()>파일추가</button>		
		<input type="button" value="돌아가기" onclick="location.href='${contextPath}/main/main.do'">
		
		<input type="hidden" value="${memberInfo.member_id }" name="member_id">
		
	</form>
	
	
	
</body>
</html>