<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<meta charset="utf-8">

<head>마이페이지</head>
<script type="text/javascript">
		$(document).ready(function(){
			// 돌아가기
			$(".return_btn").on("click", function(){
				location.href="${contextPath}/mypage/list.do";			
			})

			$(".withdrawal_btn").on("click", function(){
				if($("#member_pw").val()=="" || $("#member_pw2").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#member_pw").focus();
					return false;
			}
			});
			
			
		})
		//비밀번호 확인
		$(function(){
			$('#member_pw2').blur(function(){
			   if($('#member_pw').val() != $('#member_pw2').val()){
			    	if($('#member_pw2').val()!=''){
				    alert("비밀번호가 일치하지 않습니다.");
			    	    $('#member_pw2').val('');
			          $('#member_pw2').focus();
			       }
			    }
			})  	   
		});
			
</script>

<body>
	<h3>회원 탈퇴</h3>
	<form action="${contextPath}/mypage/withdrawal.do" method="post" id="withdrawalForm">	
		<div id="detail_table">
			<table>
				<tbody>
					<tr class="dot_line">
						<td class="fixed_join">아이디</td>
						<td>
							<input id="member_id" name="member_id" type="text" size="20" value="${memberInfo.member_id}"  readonly />
						</td>
					</tr>
					<tr class="dot_line">
						<td class="fixed_join">비밀번호</td>
						<td>
						  <input id="member_pw" name="member_pw" type="password" size="20"  />
						</td>
					</tr> 
					<tr class="dot_line">
						<td class="fixed_join">비밀번호 확인</td>
						<td>
						  <input id="member_pw2" name="member_pw2" type="password" size="20"  />
						</td>
					</tr>				
				</tbody>
			</table>
		</div>
		<div>
			<button type="button" class="return_btn">돌아가기</button>
			<button type="submit" class="withdrawal_btn">회원탈퇴</button>
		</div>
	</form>	
	<c:if test="${msg == false }">
	  <p>
	   	입력한 비밀번호가 잘 못 되었습니다.
	  </p>
	</c:if>

</body>
</html>