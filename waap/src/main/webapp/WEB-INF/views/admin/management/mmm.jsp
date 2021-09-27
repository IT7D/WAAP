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
	 	<title>관리자 회원관리</title>
	 		<style type="text/css">
				li {list-style: none; float: left; padding: 6px;}
			</style>
	</head>  
  	
	<body>
		<div id="root">
			<header>
				<h1>관리자 회원관리</h1>
			</header>		
			<section id="container">
				<form role="form" method="post" id="management" name="frm_list_member">
					<table class="table table-hover">
						<tr><th>회원번호</th><th>회원 아이디</th><th>가입일</th><th>작성한 글</th><th>회원 추방</th></tr>
						
						<c:forEach items="${adminlist}" var = "adminlist">
						<c:if test="${adminlist.member_id != 'admin'}">
							<tr>
								<td><c:out value="${adminlist.member_code}" /></td>
								<td><a href="${contextPath}/admin/management/minfo.do?member_id=${adminlist.member_id}"><c:out value="${adminlist.member_id}" /></a></td>
								<td><fmt:formatDate value="${adminlist.member_joinDay}" pattern="yyyy-MM-dd"/></td>
								<td><button type="button" class="writeView_btn" onclick="javascript:location.href='${contextPath}/admin/management/mylist.do?member_id=${adminlist.member_id}'">작성한 글 보기</button></td>
								<td><button type="button" class="deport_btn" onclick="javascript:location.href='${contextPath}/admin/management/deportView.do?member_id=${adminlist.member_id}'">회원 추방</button></td>
							</tr>
						</c:if>
						</c:forEach>
					</table>
					
					<div class="search row">
						<div class="col-xs-2 col-sm-2">
						    <select name="searchType" class="form-control">
						      <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
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
					          self.location = "${contextPath}/admin/management/mmm.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					        });
					      });   
					    </script>
					 </div>
					 
					<div class="col-md-offset-3">
					  <ul class="pagination">
					    <c:if test="${pageMaker.prev}">
					    	<li><a href="${contextPath}/admin/management/mmm.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if> 
					
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
					    	<a href="${contextPath}/admin/management/mmm.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li><a href="${contextPath}/admin/management/mmm.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if>
					  </ul>
					</div>
					
					
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>