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
    <div class="container d-flex justify-content-center mt-5">
      <span class="border py-3">
        <form name="frm_list_member" id="listForm">
          <div class="container">
            <!-- 아이디 그룹 -->
            <div class="form-group">
              <div class="form-row">
                <button
                  type="button"
                  class="btn btn-outline-secondary col-2"
                  disabled
                >
                  아이디
                </button>
                <!-- 아이디 데이터 -->
                <div class="col-3">
                  <input
                    type="text"
                    class="form-control"
                    id="member_id"
                    name="member_id"
                    value="${memberInfo.member_id}"
                    readonly
                  />
                  <div id="id_check_message"></div>
                </div>
                
              </div>
            </div>
            <!-- 아이디 그룹 끝 -->
            <!-- 비밀번호 그룹 -->
            <div class="form-group">
              <div class="form-row">
              <button
                type="button"
                class="btn btn-outline-secondary col-2"
                disabled
              >
                변경 비밀번호
              </button>
              <!-- 비밀번호 데이터 -->
              <div class="col-3">
                <input
                  type="password"
                  class="form-control"
                  id="member_pw"
                  name="member_pw"
                  value="${memberInfo.member_pw}"
                  size="20"
                />
                <div id="pw_check_message"></div>
              </div>
              <button
                type="button"
                class="btn btn-outline-secondary col-3"
                disabled
              >
                변경 비밀번호 재확인
              </button>
              <!-- 비밀번호 재확인 데이터 -->
              <div class="col-3">
                <label class="sr-only" for="inlineFormInputName"></label>
                <input
                  type="password"
                  class="form-control"
                  id="member_pw_check"
                  name="member_pw_check"
                  size="20"
                />
                <div id="pw_check_message2"></div>
              </div>
            </div>
            </div>
            <!-- 비밀번호 그룹 끝 -->
            <!-- 이름 그룹 -->
            <div class="form-group">
              <div class="form-row">
                <button
                  type="button"
                  class="btn btn-outline-secondary col-2"
                  disabled
                >
                  이름
                </button>
              <!-- 이름 데이터 -->
              <div class="col-3">
                <input
                  type="text"
                  class="form-control"
                  id=""
                  name="member_name"
                  value="${memberInfo.member_name}"  readonly
                />
              </div>
              </div>
            </div>
            <!-- 이름 그룹 끝 -->
            <!-- 성별 그룹 -->
            <fieldset class="form-group">
              <div class="form-row">
                <button
                  type="button"
                  class="btn btn-outline-secondary col-2"
                  disabled
                >
                  성별
                </button>
              

              <div class="col-3 d-flex justify-content-center align-items-center ">
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="radio"
                    name="member_gender"
                    value="남"
                    checked
                  />
                  <label class="form-check-label" for="gridRadios1">
                    남자
                  </label>
                </div>
                <div class="col-1"></div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="radio"
                    name="member_gender"
                    value="여"
                  />
                  <label class="form-check-label" for="gridRadios2">
                    여자
                  </label>
                </div>
              </div>
            </div>
            </fieldset>
            <!-- 성별 그룹 끝 -->
            <!-- 전화번호 그룹 -->
            <div class="form-group">
              <div class="form-row">
                <button
                  type="button"
                  class="btn btn-outline-secondary col-2"
                  disabled
                >
                  전화번호
                </button>
              <div class="col-3">
                <select id="" class="form-control text-center" name="member_hp">
                  <option selected>${memberInfo.member_hp}</option>
                  <option value="010">010</option>
                  <option value="011">011</option>
                  <option value="016">016</option>
                  <option value="017">017</option>
                  <option value="018">018</option>
                  <option value="019">019</option>
                </select>
              </div>

              <div class="col-3">
                <input
                  type="text"
                  class="form-control"
                  id=""
                  name="member_hp2"
                  maxlength="4"
                  value="${memberInfo.member_hp2}"
                />
              </div>

              <div class="col-3 ">
                <input
                  type="text"
                  class="form-control"
                  id=""
                  name="member_hp3"
                  maxlength="4"
                  value="${memberInfo.member_hp3}"
                />
              </div>
              </div>
          </div>
          <!-- 전화번호 그룹 끝 -->
          <!-- 생년월일 그룹 -->
          <div class="form-group">
            <div class="form-row">           
                <button
                  type="button"
                  class="btn btn-outline-secondary col-2"
                  disabled
                >
                  생년월일
                </button>
              <div class="col-3">                
                <select id="year" class="form-control" name="member_birth_y">
                  <option></option>
                </select>
              </div>
              <div class="col-3">                
                <select id="month" class="form-control" name="member_birth_m">
                  <option></option>
                </select>
              </div>
              <div class="col-3">              
                <select id="day" class="form-control" name="member_birth_d">
                  <option></option>
                </select>
              </div>
            </div>
          </div>
          <!-- 생년월일 그룹 끝 -->
          <!-- 이메일 그룹 -->
             <div class="form-group">
               <div class="form-row">
                <button
                  type="button"
                  class="btn btn-outline-secondary col-2"
                  disabled
                >
                  이메일
                </button>
              <div class="col-4">
                <input
                  type="text"
                  class="form-control"
                  id=""
                  name="member_email"
                  value="${memberInfo.member_email}"
                />
              </div>
              <div class="col-3">
                <select id="" class="form-control" name="member_email2">
                  <option selected>${memberInfo.member_email2}</option>
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
                </select>
            </div>
        </div>
          </div>
          <!-- 이메일 그룹 끝 -->
          <!-- 주소그룹 -->
            <div class="form-group">
              <div class="form-row">
                <button
                  type="button"
                  class="btn btn-outline-secondary col-2"
                  disabled
                >
                  주소
                </button>
                <div class="col-3">
                <input
                  type="text"
                  class="form-control"
                  id="member_zonecode"
                  name="member_zonecode"
                  value="${memberInfo.member_zonecode}" readonly
                />
              </div>
              <button
                  type="button"
                  onclick="findAddr()"
                  class="btn btn-outline-secondary col-2"
                >
                  주소찾기
                </button>
            </div>
          </div>
          <div class="form-group">
                <input
                  type="text"
                  class="form-control col-11"
                  id="member_roadAddress"
                  name="member_roadAddress"
                  value="${memberInfo.member_roadAddress}"
                  readonly
                />             
            </div>
              <div class="form-group">              
                <input
                  type="text"
                  class="form-control col-11"
                  id="member_remainingAddress"
                  name="member_remainingAddress"
                  value="${memberInfo.member_remainingAddress}"
                 
                />
              </div>
            </div>
            <!-- 주소그룹 끝 -->
            <!-- 가입하기, 뒤로기가 버튼 -->
            <div class="mt-4 mb-1 d-flex justify-content-center">
              <button
                type="submit"
                class="btn btn-outline-secondary mr-3"
                id="submit_button"
                onclick=""
              >
                수정완료
              </button>
              <button type="button" class="btn btn-outline-secondary" onclick="">
                돌아가기
              </button>
            </div>
            <!-- 가입하기, 뒤로가기 버튼 끝 -->
          </div>
        </div>
        </form>
      </span>
    </div>
  </body>

</html>