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

	
	

	<h1>${memberVO.member_id}에 대한 관리자 회원 관리 페이지</h1>



	<h2>커뮤니티 글 목록</h2>

	<table border='1'>

		<thead>
			<tr>
				<th>NO</th>
				<th>회원 아이디</th>
				<th>가입일</th>
				<th>회원추방</th>
			</tr>
		</thead>

		<c:forEach var="serviceCustomerVO" items="${serviceCustomerVOList }">
			<tbody>
				<tr>
					<td>${serviceCustomerVO.serviceCustomer_code}</td>
					<td><a
						href="${contextPath }/service/serviceCustomerDetail.do?member_id=${serviceCustomerVO.member_id}&serviceCustomer_code=${serviceCustomerVO.serviceCustomer_code}">${serviceCustomerVO.serviceCustomer_title}</a></td>
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

	<hr>

	<div class="col-md-offset-3">
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li><a
					href="${contextPath}/admin/member/memberAllData.do${pageMaker.makeSearch(pageMaker.startPage - 1)}&member_id=${memberVO.member_id}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li
					<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
					<a
					href="${contextPath}/admin/member/memberAllData.do${pageMaker.makeSearch(idx)}&member_id=${memberVO.member_id}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="${contextPath}/admin/member/memberAllData.do${pageMaker.makeSearch(pageMaker.endPage + 1)}&member_id=${memberVO.member_id}">다음</a></li>
			</c:if>
		</ul>
	</div>

	
	<hr><hr>
	
	<h2>sh1234가 작성한 글 목록</h2>
	
	<table border='1'>

		<thead>
			<tr>
				<th>NO</th>
				<th>회원 아이디</th>
				<th>가입일</th>
				<th>회원추방</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>미완성입니다.</tr>
			
		</tbody>

	</table>

</body>
</html>
