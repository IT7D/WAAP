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
	 	<title>마이페이지</title>
	 		<style type="text/css">
				li {list-style: none; float: left; padding: 6px;}
			</style>
	</head>
	
	<body>
		<div id="root">
			<header>
				<h1>내가 쓴 글 목록</h1>
			</header>
		<section id="container">
				<form role="form" method="get">
					<table class="table table-hover">
						<tr><th>번호</th><th>제목</th><th>작성된 날짜</th><th>수정된 날짜</th></tr>		
						<c:forEach items="${list}" var = "list">
						<c:if test="${memberInfo.member_id == list.member_id}">
							<tr>
								<td><c:out value="${list.com_no}" /></td>
								<td><a href="${contextPath}/community/readView.do?com_no=${list.com_no}"><c:out value="${list.com_title}" /></a></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
								<td><fmt:formatDate value="${list.modifydate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:if>
						</c:forEach>
					</table>
					
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
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
					          self.location = "${contextPath}/mypage/mylist.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>
					 </div>
					 
					<div class="col-md-offset-3">
					  <ul class="pagination">
					    <c:if test="${pageMaker.prev}">
					    	<li><a href="${contextPath}/mypage/mylist.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if> 
					
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
					    	<a href="${contextPath}/mypage/mylist.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li><a href="${contextPath}/mypage/mylist.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if>
					  </ul>
					</div>
					
					
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>