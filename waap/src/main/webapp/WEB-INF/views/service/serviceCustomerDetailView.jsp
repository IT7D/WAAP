<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    


<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<%
  request.setCharacterEncoding("UTF-8");
%>  


<head>
<script>
	var update;
		
	function ServiceCustomerDetailViewupdate(){
		updateTitle = document.getElementById('UserUpdateModeTitle');
		updateTitle.disabled = false;
		
		updateContent = document.getElementById('UserUpdateModeContent');
		updateContent.disabled = false;
		
	
		fileUpdate_btn = document.getElementById('fileUpdate_btn');
		fileUpdate_btn.disabled = false;	
		
		if(document.getElementsByName('fileDel') != null){
			
			var size = document.getElementsByName('fileDel').length;
			
			for(var i = 0; i< size; i++){
				document.getElementsByName('fileDel')[i].disabled = false;
			}
		
		}
		
		
		document.getElementById('user_mode_normal').style.display ="none";
		
		document.getElementById('userUpdateMode').style.display ="block";	
		
		
	}
	
	function ServiceCustomerDetailViewReply(){
		updateReply = document.getElementById('adminModeReply');
		updateReply.disabled = false;
		
		document.getElementById('admin_mode_normal').style.display ="none";
		
		document.getElementById('adminUpdateMode').style.display ="block";	
		
	}
	
	
	function fn_addFile(){
		var fileIndex = 1;
		$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();
			
		});
	}
	
	
	function fn_fileDown(file_code){
		
		location.href= "${contextPath}/service/fileDown.do?FILE_CODE=" + file_code;
		
	}
	
	
	var fileNoArry = new Array();
	var fileNameArry = new Array();
	function fn_del(value, name){
			
			fileNoArry.push(value);
			fileNameArry.push(name);
			$("#fileNoDel").attr("value", fileNoArry);
			$("#fileNameDel").attr("value", fileNameArry);
			
			
		}
	
	
	$(document).on("click","#fileDel", function(){
		$(this).parent().remove();
	})
	
</script>



</head>
<body>


	<h1> 1:1문의 상세 페이지입니다</h1>
	
	
	<form action="" method="post" enctype="multipart/form-data">
		<input type="hidden" id="fileNoDel" name="fileNoDel[]" value="">
		<input type="hidden" id="fileNameDel" name="fileNameDel[]" value="">
		
		
		
		<table border='1'>
		
				<tbody>
					<tr>
						<td> 제목 : <input type="text" id="UserUpdateModeTitle" name="serviceCustomer_title" value="${serviceCustomerVO.serviceCustomer_title}" disabled></td>
					<tr>
						
						<td> 내용 : <textarea id="UserUpdateModeContent" name="serviceCustomer_content" cols="50" rows="20" disabled>${serviceCustomerVO.serviceCustomer_content }</textarea></td>
					</tr>
					
					<tr>
						<td> 답변 : <textarea id="adminModeReply" name="serviceCustomer_reply" cols="50" rows="10" disabled> ${serviceCustomerVO.serviceCustomer_reply }</textarea></td>
					</tr>
						
					<tr>
						<td id="fileIndex">
							<c:forEach var="file" items="${fileList}" varStatus="var">
							<div>
								<input type="hidden" id="FILE_CODE" name="FILE_CODE_${var.index}" value="${file.FILE_CODE }">
								<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_CODE_${var.index}">
								<a href="#" id="fileName" onclick="fn_fileDown('${file.FILE_CODE}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE})
								<button id="fileDel" name="fileDel" onclick="fn_del('${file.FILE_CODE}','FILE_CODE_${var.index}');" type="button" disabled>삭제</button><br>
							</div>
							</c:forEach>
						</td>
					</tr>		
				</tbody>
				
		</table>	
		
		
		<button type="button" id="fileUpdate_btn" onclick=fn_addFile() disabled>파일추가</button>				   
						
			
		<input type="hidden" value="${serviceCustomerVO.serviceCustomer_code }" name="serviceCustomer_code">
		
		
		
		<c:choose>
			<c:when test="${memberInfo.member_id == 'admin'}">
				<div id="admin_mode_normal">
					<input type="submit" value="삭제" onclick="javascript:form.action='${contextPath}/service/serviceCustomerViewDelete.do'">
					<input type="button" onclick=ServiceCustomerDetailViewReply() value="답변">
					<input type="button" onclick="location.href='${contextPath}/admin/service/adminServiceCustomerView.do'" value="돌아가기">
					
				</div>
				
				<div id="adminUpdateMode" style="display:none;">
					<input type="submit" value="답변완료" onclick="javascript:form.action='${contextPath}/admin/service/serviceCustomerViewReply.do';">
					<input type="button" onclick="location.href='${contextPath}/service/serviceCustomerDetail.do?member_id=${serviceCustomerVO.member_id}&serviceCustomer_code=${serviceCustomerVO.serviceCustomer_code }'" value="답변취소">
				</div>	
			</c:when>
		
			<c:when test="${memberInfo.member_id != 'admin' and memberInfo.member_id == serviceCustomerVO.member_id }">
				<div id="user_mode_normal" style="display:block;">
					<input type="submit" value="삭제" onclick="javascript:form.action='${contextPath}/service/serviceCustomerViewDelete.do'">
					<input type="button" onclick=ServiceCustomerDetailViewupdate() value="수정">
					<input type="button" onclick="location.href='${contextPath}/service/serviceCustomerView.do'" value="돌아가기">
				</div>
				
				<div id="userUpdateMode" style="display:none;">
					<input type="submit" value="수정완료" onclick="javascript:form.action='${contextPath}/service/serviceCustomerViewUpdate.do';">
					<input type="button" onclick="location.href='${contextPath}/service/serviceCustomerDetail.do?member_id=${memberInfo.member_id}&serviceCustomer_code=${serviceCustomerVO.serviceCustomer_code }'" value="수정취소">
				</div>				
			</c:when>
		</c:choose>
		
		
	</form>
	



</body>
