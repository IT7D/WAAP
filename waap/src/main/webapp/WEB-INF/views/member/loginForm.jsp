<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<c:set var="message"  value="${message}"  />

<c:if test='${not empty message }'>
	<script>
		alert("아이디나 비밀번호가 틀립니다. 다시 시도하세요.")
	</script>

</c:if>

<c:set var="login_demand"  value="${login_demand}"  />



</head>
<body>
	<H3>회원 로그인 창</H3>
	<form action="${contextPath}/member/login.do" method="post">
		<TABLE>
			<TBODY>
				<TR class="dot_line">
					<TD class="fixed_join">아이디</TD>
					<TD><input name="member_id" type="text" size="20" /></TD>
				</TR>
				<TR class="solid_line">
					<TD class="fixed_join">비밀번호</TD>
					<TD><input name="member_pw" type="password" size="20" /></TD>
				</TR>
			</TBODY>
		</TABLE>
		아이디 저장 <input type="checkbox">
		<br><br>
		<input type="submit" value="확인"> 
		<input type="button" value="취소" onclick="locaiton.href='${contextPath}/main/main.do'">
		
		<br><br>
		   <a href="${contextPath}/member/idFindForm.do">아이디 찾기</a>  | 
		   <a href="${contextPath}/member/pwFindForm.do">비밀번호 찾기</a> | 
		   <a href="${contextPath}/member/memberForm.do">회원가입</a>       
	</form>		

</body>
</html>