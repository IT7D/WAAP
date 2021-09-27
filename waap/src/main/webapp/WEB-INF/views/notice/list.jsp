<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<html>
	<head>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
	 	<title>공지사항</title>
	 		<style type="text/css">
				li {list-style: none; float: left; padding: 6px;}
			</style>
	</head>
	<body>
		<div id="root">
			<header>
				<h1>공지사항</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form role="form" method="get">
					<table class="table table-hover">
						<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th></tr>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.notice_no}" /></td>
								<td><a href="${contextPath}/notice/readView.do?notice_no=${list.notice_no}"><c:out value="${list.notice_title}" /></a></td>
								<td><c:out value="관리자" /></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${list.view_count}" /></td>
							</tr>
						</c:forEach>
					</table>
					
					<div class="search row">
						<div class="col-xs-1 col-sm-1">
						    <select name="searchType" class="form-control">
						      <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>검색조건</option>
						      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						      <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
						      <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						    </select>
						</div>
						
						<div class="col-xs-4 col-sm-4">
							<div class="input-group">
							    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
								<span class="input-group-btn">
							    	<button id="searchBtn" type="button" class="btn btn-default">검색</button>
							    </span>
						    </div>
					    </div>
					    
					    <script>
					      $(function(){
					        $('#searchBtn').click(function() {
					          self.location = "${contextPath}/notice/list.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>
					 </div>
					 
					<div class="col-md-offset-3">
					  <ul class="pagination">
					    <c:if test="${pageMaker.prev}">
					    	<li><a href="${contextPath}/notice/list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if> 
					
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
					    	<a href="${contextPath}/notice/list.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li><a href="${contextPath}/notice/list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if>
					  </ul>
					</div>
					
					
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>