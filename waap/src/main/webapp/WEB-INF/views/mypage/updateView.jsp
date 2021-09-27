<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<meta charset="utf-8">

<head>마이 페이지 수정</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_zonecode').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_roadAddress").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_roadAddress").value = jibunAddr;
            }
        }
    }).open();
}
</script>
<script >

		$(document).ready(function(){
			var formObj = $("form[name='frm_mod_member']");
			
			// 수정완료
			$(".update_btn").on("click", function(){
				alert("수정이 완료되었습니다. 다시 로그인해주세요")
				formObj.attr("action", "${contextPath}/mypage/update.do");
				formObj.attr("method", "post");
				formObj.submit();				
			})
			
			// 돌아가기
			$(".return_btn").on("click", function(){
				formObj.attr("action", "${contextPath}/mypage/list.do");
				formObj.attr("method", "post");
				formObj.submit();				
			})
			
		   
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
		
		//email 드롭다운 
		function input_email(){
			document.frm_mod_member.member_email2.value = document.frm_mod_member.select_email2.value;
		}
		
		
</script>
	<style>
		.update_btn {
		    position: absolute;
		    top: 100px;
		    left: 600px;
		}
		
		.withdraw_btn {
			position: absolute;
		    top: 520px;
		    left: 700px;
		}
		
	</style>
<body>
	<h3>내 상세 정보</h3>
<form name="frm_mod_member" action="${contextPath}/mypage/update.do">	
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
					  <input id="member_pw" name="member_pw" type="password" size="20" value="${memberInfo.member_pw}" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">비밀번호확인</td>
					<td>
					  <input id="member_pw2" name="member_pw2" type="password" size="20" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이름</td>
					<td>
					  <input name="member_name" type="text" size="20" value="${memberInfo.member_name}"  readonly />
					 </td>
					 <td>
					</td>
				</tr>
				
				<tr class="dot_line">
					<td class="fixed_join">휴대폰번호</td>
					<td>
					   <select  name="member_hp" id="member_hp">
							<option>${memberInfo.member_hp}</option>
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select> 
					 - <input type="text" name="member_hp2" size=4 value="${memberInfo.member_hp2}" > 
					 - <input type="text" name="member_hp3"  size=4 value="${memberInfo.member_hp3}" ><br><br>
				    </td>	
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">이메일<br>(e-mail)</td>
					<td>
					   <input type="text" name="member_email" size=10 value="${memberInfo.member_email}" /> @ <input type="text" size=10  name="member_email2" value="${memberInfo.member_email2}" /> 
					   <select name="select_email2" onChange="input_email();"  title="직접입력">
							<option value="">직접입력</option>
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
					   <input type="text" id="member_zonecode" name="member_zonecode" value="${memberInfo.member_zonecode}"><input type="button" onclick="findAddr()" value="주소찾기"><br>
					  <p> 
						  도로명 주소: <input type="text" id="member_roadAddress" name="member_roadAddress" size="50" value="${memberInfo.member_roadAddress}" ><br><br>
						  상세 주소: <input type="text"  name="member_remainingAddress" size="50" value="${memberInfo.member_remainingAddress}" />
					   </p>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
			<div>
				<button type="submit" class="update_btn">수정완료</button>
				<button type="submit" class="return_btn">돌아가기</button>
			</div>
			
		</form>
	</body>
</html>