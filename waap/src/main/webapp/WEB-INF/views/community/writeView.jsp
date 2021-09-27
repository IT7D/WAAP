<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />


<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>커뮤니티 글쓰기 페이지</title>
    <!-- 부트스트랩 태그 -->
    <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
      crossorigin="anonymous"
    ></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
      integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
      crossorigin="anonymous"
    />
    <!-- 부트스트랩 태그 끝 -->
    <!-- 서머노트 태그:  스타일관련, 자바스크립트, 한글화, 서머노트js -->
    <link
      href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
    
    <!-- 서머노트 태그 끝 -->
    <!-- 커뮤니티스타일 css -->
  
    <!-- 커뮤니티스타일 css 끝 -->
  </head>
  
  <script type="text/javascript">
		$(document).ready(function(){

			$(".summernote").summernote({
			 // 에디터 높이
		    height: 300,
		    // 에디터 한글 설정
		    lang: "ko-KR",
		    // 에디터에 커서 이동 (input창의 autofocus라고 생각하시면 됩니다.)
		    focus: true,
		    toolbar: [
		      // 글꼴 설정
		      ["fontname", ["fontname"]],
		      // 글자 크기 설정
		      ["fontsize", ["fontsize"]],
		      // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		      ["style", ["bold", "italic", "underline", "strikethrough", "clear"]],
		      // 글자색
		      ["color", ["forecolor", "color"]],
		      // 표만들기
		      ["table", ["table"]],
		      // 글머리 기호, 번호매기기, 문단정렬
		      ["para", ["ul", "ol", "paragraph"]],
		      // 줄간격
		      ["height", ["height"]]
		    ],
		    // 추가한 글꼴
		    fontNames: [
		      "Arial",
		      "Arial Black",
		      "Comic Sans MS",
		      "Courier New",
		      "맑은 고딕",
		      "궁서",
		      "굴림체",
		      "굴림",
		      "돋음체",
		      "바탕체"
		    ],
		    // 추가한 폰트사이즈
		    fontSizes: [
		      "8",
		      "9",
		      "10",
		      "11",
		      "12",
		      "14",
		      "16",
		      "18",
		      "20",
		      "22",
		      "24",
		      "28",
		      "30",
		      "36"
		    ]
		  });
			var formObj = $("form[name='writeForm']");	
			
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "${contextPath}/community/write.do");
				formObj.attr("method", "post");
				formObj.submit();
			});
			
			$(".list_btn").on("click", function(){
				location.href = "${contextPath}/community/list.do";
			});
			
			fn_addFile();
		
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("placeholder"));
					return true;
				}
			}
		}
		
		})
		
		function fn_addFile(){
			var fileIndex = 1;
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
		
		
	</script>
  <body>
    <!-- 타이틀, 제목입력창 -->
    <form name="writeForm" method="post" action="${contextPath}/community/write.do" enctype="multipart/form-data">
        <input type="hidden" id="member_id" name="member_id" value="${memberInfo.member_id}">
    	<div class="container">
        <h2 class="text-center mt-5 mb-4 font-weight-bold">커뮤니티 글쓰기</h2>
	        <div class="form-group mb-0">
	          <input type="text" id="com_title" name="com_title" class="chk form-control" placeholder="제목을 입력하세요." />
	        </div>	
        </div>
     	
      <!-- 타이틀, 제목입력창 끝 -->

      <!-- 내용 입력 및 서머노트(글자편집창) -->
	      <div class="container">
	        <textarea id="com_content" name="com_content" class="chk summernote" placeholder="내용을 입력하세요."></textarea>
	        <p>
	        <div id="fileIndex">
	        </div>
	        <button
	        type="button"
	        class="fileAdd_btn btn btn-outline-secondary btn-sm mr-4 mt-5"
	      	>
	        파일추가
	      </button>
	      </div>

	      <!-- 내용 입력 및 서머노트 끝 -->
	
	      <!-- 파일 업로드  -->
	      
	      
	      <!-- 파일 업로드 끝 -->
	
	      <!-- 등록, 취소 버튼 -->
	      <div class="container">
	        <div class="d-flex justify-content-center">
	          
	          <button
	            type="submit"
	            class="write_btn btn btn-outline-secondary btn-sm mr-4 mt-5"
	          >
	            등록
	          </button>
	          <button
	            type="button"
	            class="list_btn btn btn-outline-secondary btn-sm mr-4 mt-5"
	          >
	            취소
	          </button>
			  
			   
	    
	          <!-- 등록, 취소 버튼 끝 -->
	        </div>
	      </div>
      </form>
  </body>
</html>
