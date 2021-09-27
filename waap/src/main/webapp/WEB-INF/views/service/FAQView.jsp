<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />


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

	<a href="${contextPath}/service/FAQView.do">고객센터 자주묻는 질문</a>
	
	
	<c:choose>
		<c:when test="${memberInfo.member_id == 'admin' }">
			<a href="${contextPath }/admin/service/adminServiceCustomerView.do">1:1 문의 관리자 페이지</a>
		</c:when>
		
		<c:otherwise>
			<a href="${contextPath}/service/serviceCustomerView.do">1:1 문의 페이지</a>
		</c:otherwise>
		
	</c:choose>
	
	<br>

	<h1>자주묻는 질문</h1>

	<table border='1'>

		<thead>
			<tr>
				<th>번호</th>
				<th>질문</th>
				<th>작성자</th>
				<td>작성일</td>
				<th>조회수</th>
			</tr>
		</thead>

		<c:forEach var="FAQVO" items="${FAQVOList }">
			<tbody>
				<tr>
					<td>${FAQVO.faq_code}</td>
					<td><a
						href="${contextPath }/service/FAQViewDetail.do?faq_code=${FAQVO.faq_code}">${FAQVO.faq_content}</a></td>
					<td>관리자</td>
					<td>${FAQVO.faq_writeDay}</td>
					<td>${FAQVO.faq_clickCount}</td>
				</tr>
			</tbody>
		</c:forEach>

	</table>


	<c:if test="${memberInfo.member_id == 'admin' }">

		<button
			onclick="location.href='${contextPath}/admin/service/adminFAQWriteForm.do'">게시물
			등록</button>
	</c:if>

	<hr>

	<div class="col-md-offset-3">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a
					href="${contextPath}/service/FAQView.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
					<a
					href="${contextPath}/service/FAQView.do${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="${contextPath}/service/FAQView.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>





</body>
</html>
