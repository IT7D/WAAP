<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	 isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<script>


var codeNum = "";
var member_id = "";

function emailCheck(){
	
	var email1 = document.getElementById('email1').value;
	var email2 = "@"+ document.getElementById('email2').value;
	var id = document.getElementById('member_id').value;
	
	$.ajax({
		async: false,
		type:'POST',
		url:"${contextPath}/member/pwFindEmail.do",
		data: {"sending_member_email": email1, "sending_member_email2" : email2, "member_id":id},
		success:function(request){
			if(request.message == "없는 이메일 입니다."){
				alert(request.message)	
			}else{

				alert(request.message);
				codeNum = request.code;
				member_pw = request.member_pw;
			}
		},
		error:function(request, error){
			alert("code:" + request.status + "\n" + "message: " + request.responseText + "\n" + "error : " + error )
		}
		
		
	})
}


function lastCheck(){
	if(document.getElementById('checkNum').value == codeNum){
		alert("인증번호가 일치합니다!");
		document.getElementById('submit_btn').disabled = false;
	}else{
		alert("인증번호를 다시 확인하세요");
	}
	 
}


function lastSubmit(){
	alert("비밀번호는 " + member_pw + "입니다.")
	
	location.href= "${contextPath}/main/main.do";
	
}


</script>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
<h1>비밀번호 찾기 페이지</h1>
	
	<form action="" method="post">
		<TABLE>
			<TBODY>
				<TR>
					<TD class="">아이디</TD>
					<TD><input id="member_id" name="" type="text" size="20" /></TD>
				</TR>
				<TR>
					<TD class="">E-mail</TD>
					<TD><input id="email1" type="text" size="20" /></TD>
					<TD>@</TD>
					<TD><input id="email2" type="email" size="20" /></TD>
					<TD><button type="button" onclick=emailCheck()>인증키 전송</button>
				</TR>
				<TR>
					<TD class="">인증번호 확인</TD>
					<TD class=""><input type="text" id="checkNum" placeholder="인증번호 입력"></TD>
					<TD><button type="button" onclick=lastCheck()>확인</button></TD>
				</TR>
			</TBODY>
		
		
		</TABLE>
		<button type="button" id="submit_btn" onclick=lastSubmit() disabled>비밀번호 찾기</button>
		<button type="button" onclick="location.href='${contextPath}/main/main.do'">취소</button>
			
				
		
		
	</form>
	


</body>
</html>