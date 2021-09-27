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
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		
	<h1>FAQ관리자 글 작성 페이지</h1>
	
	<form action="${contextPath }/admin/service/FAQWrite.do">
	
		질문내용 : <input type="text" name="faq_content">
		
		<br>
		답변내용 : <textarea name="faq_reply"  cols="50" rows="20"></textarea>
		
		<br>			
			
		<input type="submit" value="글 작성">
		<input type="button" value="돌아가기" onclick="location.href='${contextPath}/main/main.do'">
	</form>
	
	
	
</body>
</html>