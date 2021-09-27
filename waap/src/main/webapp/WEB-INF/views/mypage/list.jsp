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
			var formObj = $("form[name='frm_list_member']");
			
			// 내 정보수정 
			$(".update_btn").on("click", function(){
				if($("#member_pw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#member_pw").focus();
					return false;	
				}
				$.ajax({
					url: "${contextPath}/mypage/passChk",
					type: "POST",
					dataType: "json",
					data: $("#listForm").serializeArray(),
					success: 
						function(data) {
						
						if(data==0) {
							alert("패스워드가 틀렸습니다.");
							return;
						}else{
							if(confirm("수정하시겠습니까?")){
								location = "${contextPath}/mypage/updateView.do";
							}
						}
					  }
				    })	
			      });
		   
		})
		
		
</script>
	<style>
		.update_btn {
		    position: absolute;
		    top: 100px;
		    left: 600px;
		}
		
		
	</style>
<body>
	<h3>내 상세 정보</h3>
	<div>
	<button type="submit" class="update_btn">내 정보수정</button>
	</div>
<form name="frm_list_member" id="listForm">	
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
					<td class="fixed_join">이름</td>
					<td>
					  <input id="member_name" name="member_name" type="text" size="20" value="${memberInfo.member_name}"  readonly />
					 </td>
					 <td>
					</td>
				</tr>
				
				<tr class="dot_line">
					<td class="fixed_join">휴대폰번호</td>
					<td>
					   <select  name="member_hp" id="member_hp" >
							<option>${memberInfo.member_hp}</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select> 
					 - <input type="text" name="member_hp2" size=4 value="${memberInfo.member_hp2}" readonly /> 
					 - <input type="text" name="member_hp3"  size=4 value="${memberInfo.member_hp3}" readonly /><br><br>
				    </td>	
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이메일<br>(e-mail)</td>
					<td>
					   <input type="text" name="member_email" size=10 value="${memberInfo.member_email}" readonly /> @ <input type="text" size=10  name="member_email2" value="${memberInfo.member_email2}" readonly /> 
					   <select name="select_email2" onChange=""  title="직접입력">
							<option value="non">직접입력</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="naver.com">naver.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="paran.com">paran.com</option>
							<option value="nate.com">nate.com</option>
							<option value="google.com">google.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="empal.com">empal.com</option>
							<option value="korea.com">korea.com</option>
							<option value="freechal.com">freechal.com</option>
					</select><Br><br> 
					
					</td>
				
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">주소</td>
					<td>
					   <input type="text" id="member_zonecode" name="member_zonecode" size=5 value="${memberInfo.member_zonecode}" readonly />
					  <br>
					  <p>
						  도로명 주소: <input type="text" id="member_roadAddress" name="member_roadAddress" size="50" value="${memberInfo.member_roadAddress}" readonly /><br><br>
						  나머지 주소: <input type="text"  name="member_remainingAddress" size="50" value="${memberInfo.member_remainingAddress}" readonly />
					   </p>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
			<div>
				<button type="button" class="mywrite_btn" onclick="javascript:location.href='${contextPath}/mypage/mylist.do'">내가 쓴글</button>
				<button type="button" class="withdrawal_btn" onclick="javascript:location.href='${contextPath}/mypage/withdrawalView.do'">회원탈퇴</button>
			</div>
</form>	
</body>
</html>