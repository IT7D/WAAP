<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>    
<script>
	
</script>

<style type="text/css">
	li {list-style: none; display:inline; padding: 6px;}
</style>
<ul>
	<c:if test="${memberInfo.member_id == 'admin' }">
		<li><a href="${contextPath}/notice/list.do">목록</a></li>
		<li><a href="${contextPath}/admin/notice/writeView.do">글 작성</a></li>
	</c:if>
</ul>

	



