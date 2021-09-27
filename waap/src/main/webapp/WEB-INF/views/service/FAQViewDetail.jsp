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
	var update;
		
	function FAQDetailViewupdate(){
		adminUpdateContent = document.getElementById('adminUpdateContent');
		adminUpdateContent.disabled = false;
		
		updateContent = document.getElementById('adminUpdateReply');
		adminUpdateReply.disabled = false;
		
		document.getElementById('admin_mode').style.display ="none";
		
		document.getElementById('UpdateMode').style.display ="block";	
	
	}

</script>


<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<form action="" id="ServiceCustomerDetailViewForm">
		
		<table border='1'>
		
				<tbody>
					<tr>	
						<td>질문번호 : ${faqVO.faq_code}</td>
					</tr>
					
					<tr>
						<td>작성일 : ${faqVO.faq_writeDay}</td>
					</tr>
					
					<tr>
						<td> 질문내용 : <textarea id="adminUpdateContent" name="faq_content" cols="50" rows="20" disabled>${faqVO.faq_content}</textarea></td>
					</tr>
					
					<tr>
						<td>답변내용 : <textarea id="adminUpdateReply" name="faq_reply" cols="50" rows="10" disabled> ${faqVO.faq_reply}</textarea></td> 
						
					</tr>
						
					<tr>
						<td>조회수 : ${faqVO.faq_clickCount}</td>
					</tr>	
					
					
				</tbody>
		
		</table>		
		<input type="hidden" value="${faqVO.faq_code }" name="faq_code">
		
		
		
		<c:if test="${memberInfo.member_id == 'admin'}">
			<div id="admin_mode">
				<input type="button" onclick=FAQDetailViewupdate() value="수정">
				<input type="submit" value="삭제" onclick="javascript:form.action='${contextPath}/admin/service/FAQViewDelete.do'">
			</div>
			
			<div id="UpdateMode" style="display:none;">
				<input type="submit" value="수정완료" onclick="javascript:form.action='${contextPath}/admin/service/FAQViewUpdate.do';">
				<input type="button" onclick="location.href='${contextPath}/service/FAQViewDetail.do?member_id=${memberInfo.member_id}&faq_code=${faqVO.faq_code }'" value="수정취소">
			</div>
									
		</c:if>
		
		<input type="button" onclick="location.href='${contextPath}/service/FAQView.do'" value="돌아가기">
		
	</form>
</body>
</html>