<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<meta charset="utf-8">

<head>회원 관리</head>
<script type="text/javascript">

		$(document).ready(function(){
			var formObj = $("form[name='frm_list_member']");
			
			// 돌아가기
			$(".return_btn").on("click", function(){
				formObj.attr("action", "${contextPath}/admin/management/mmm.do");
				formObj.attr("method", "post");
				formObj.submit();				
			})
			
		   
		})
</script>
<body>
	<h3>회원 상세 정보</h3>
	
<form name="frm_list_member" method="post" id="listForm">	
	<div id="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join">아이디</td>
					<td>
						<input id="member_id" name="member_id" type="text" size="20" value="${info.member_id}"  readonly />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">비밀번호</td>
					<td>
					  <input id="member_pw" name="member_pw" type="password" size="20" value="${info.member_pw}"  readonly />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이름</td>
					<td>
					  <input id="member_name" name="member_name" type="text" size="20" value="${info.member_name}"  readonly />
					 </td>
					 <td>
					</td>
				</tr>
				
				<tr class="dot_line">
					<td class="fixed_join">휴대폰번호</td>
					<td>
					   <select  name="member_hp" id="member_hp" >
							<option>${info.member_hp}</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select> 
					 - <input type="text" name="member_hp2" size=4 value="${info.member_hp2}" readonly /> 
					 - <input type="text" name="member_hp3"  size=4 value="${info.member_hp3}" readonly /><br><br>
				    </td>	
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이메일<br>(e-mail)</td>
					<td>
					   <input type="text" name="member_email" size=10 value="${info.member_email}" readonly /> @ <input type="text" size=10  name="member_email2" value="${info.member_email2}" readonly /> 
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
					   <input type="text" id="member_zonecode" name="member_zonecode" size=5 value="${info.member_zonecode}" readonly />
					  <br>
					  <p>
						  도로명 주소: <input type="text" id="member_roadAddress" name="member_roadAddress" size="50" value="${info.member_roadAddress}" readonly /><br><br>
						  나머지 주소: <input type="text"  name="member_remainingAddress" size="50" value="${info.member_remainingAddress}" readonly />
					   </p>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
			<div>
				<button type="submit" class="return_btn">돌아가기</button>
			</div>
</form>	
</body>
</html>