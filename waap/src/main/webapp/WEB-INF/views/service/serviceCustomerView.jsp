<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<%
request.setCharacterEncoding("UTF-8");
%>
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

	<h1>1:1문의 페이지입니다</h1>

	<table border='1'>

		<thead>
			<tr>
				<th>NO</th>
				<th>제목</th>
				<th>등록일</th>
				<th>답변상황</th>
			</tr>
		</thead>

		<c:forEach var="serviceCustomerVO" items="${serviceCustomerVOList }">
			<tbody>
				<tr>
					<td>${serviceCustomerVO.serviceCustomer_code}</td>
					<td><a
						href="${contextPath }/service/serviceCustomerDetailView.do?member_id=${serviceCustomerVO.member_id}&serviceCustomer_code=${serviceCustomerVO.serviceCustomer_code}">${serviceCustomerVO.serviceCustomer_title}</a></td>
					<td>${serviceCustomerVO.serviceCustomer_write_date }</td>


					<c:choose>
						<c:when
							test="${serviceCustomerVO.serviceCustomer_reply == '' || serviceCustomerVO.serviceCustomer_reply == null}">
							<td style="color: red">답변없음</td>
						</c:when>
						<c:otherwise>
							<td>답변있음</td>
						</c:otherwise>
					</c:choose>

				</tr>
			</tbody>
		</c:forEach>

	</table>

	<button
		onclick="location.href='${contextPath}/service/serviceCustomerWriteView.do'">글쓰기
		버튼</button>


	<div class="col-md-offset-3">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a
					href="${contextPath}/service/serviceCustomerView.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
					<a
					href="${contextPath}/service/serviceCustomerView.do${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="${contextPath}/service/serviceCustomerView.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>

</body>
