<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 글쓰기</title>
    <!-- Quill.js CSS -->
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${path}/resources/css/board/boardwrite.css">
</head>
<body>
    <!-- 메인 컨테이너 -->
    <div class="main-container">
        <h1 class="page-title">커뮤니티 글쓰기</h1>

        <!-- 섹션 1: 카테고리 & 제목 입력 -->
        <div class="section">
        <form action="${path }/board/boardwriteend.do" method="post">
         
         <!-- 로그인한 사용자의 멤버 번호를 전송하기 위한 숨겨진 입력 필드 -->
    <input type="hidden" name="memberNo" value="${sessionScope.loginMember.memberNo}"/>
        
            <div class="form-group">
                <label for="category">카테고리를 선택해 주세요.</label>
              <div class="select-container" style="padding:0;">
                <select id="category" class="form-control " name="category">

                    <option value="CAT-2">잡담</option>
                    <option value="CAT-3">책</option>
                    <option value="CAT-4">진학</option>
                    <option value="CAT-5">진로</option>
                    <option value="CAT-6">유아</option>
                    <option value="CAT-7">입시</option>
                    <option value="CAT-8">정보</option>
                    <option value="CAT-9">질문</option> 
                </select>
            	</div>
			</div>
			
            <div class="form-group">
                <label for="title">제목을 입력해 주세요.</label>
                <input type="text" id="title" class="form-control" placeholder="제목을 입력해 주세요." name="title">
            </div>
        </div>

        <!-- 섹션 2: 내용 입력 -->
        <div class="section">
            <div class="form-group">
                <label for="editor-container">내용을 입력해 주세요.</label>
                <div id="editor-container"></div>
                <input id="content" type="hidden" name="content"/>
            </div>
        </div>

        <!-- 섹션 3: 태그 입력 -->
		<div class="section tags-input"> <!-- 클래스 추가 -->
		    <div class="form-group">
		        <label for="tags">#태그를 입력해 주세요.</label>
		        <input type="text" id="tags" class="form-control" placeholder="#태그를 입력해 주세요." name="tag">
		    </div>
		</div>


        <!-- 등록 버튼 -->
        <div class="button-container">
           <button id="submit-btn">등록</button>
        </div>
		</form>
    </div>
    
    
<!-- Quill.js 라이브러리 -->
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script>
    var quill = new Quill('#editor-container', {
        theme: 'snow',
        placeholder: '내용을 입력해 주세요...',
        modules: {
            toolbar: {
                container: [['bold', 'italic', 'underline'], [{ 'header': 1 }, { 'header': 2 }], [{ 'list': 'ordered'}, {'list': 'bullet'}], ['link', 'image']],
                handlers: {
                    'image': imageHandler
                }
            }
        }
    });

    function imageHandler() {
      const input = document.createElement('input');
      input.setAttribute('type', 'file');
      input.setAttribute('accept', 'image/*');
      input.click();
      input.onchange = async () => {
        const file = input.files[0];
        if (file) {
          const formData = new FormData();
          formData.append('image', file);
          try {
            const response = await fetch('${path}/board/boardattachment.do', {
              method: 'POST',
              body: formData
            });
            const data = await response.json();
            const range = this.quill.getSelection(true);
            this.quill.insertEmbed(range.index, 'image', data.imageUrl);
          } catch (error) {
            console.error('Failed to upload image:', error);
          }
        }
      };
    }

    document.getElementById('submit-btn').addEventListener('click', function() {
    	if (!validateForm()) {
            event.preventDefault(); // 유효성 검사를 통과하지 못하면 폼 제출 중단
        }
    	
        var content = quill.root.innerHTML;
        document.getElementById("content").value = content;
    });
</script> 

<script>
    // 폼 유효성 검사 함수
    function validateForm() {
        // 카테고리 선택 확인
        const category = document.getElementById("category").value;
        if (!category) {
            alert("카테고리를 선택해 주세요.");
            document.getElementById("category").focus();
            return false;
        }

        // 제목 입력 확인
        const title = document.getElementById("title").value.trim();
        if (!title) {
            alert("제목을 입력해 주세요.");
            document.getElementById("title").focus();
            return false;
        }

        // 내용 입력 확인
        const content = quill.root.innerHTML.trim(); // Quill의 내용을 가져옴
        if (content === "<p><br></p>" || content === "") {
            alert("내용을 입력해 주세요.");
            return false;
        }
        document.getElementById("content").value = content; // 내용을 숨겨진 input에 저장

        // 태그 입력 확인
        const tags = document.getElementById("tags").value.trim();

	     // 태그 입력 확인
	     if (!tags) {
	         alert("태그를 입력해 주세요. 예: #책,#도서관,#책추천");
	         document.getElementById("tags").focus();
	         return false; // 입력값이 없으면 폼 제출 중단
	     }
	     
        if (tags) {
            const tagPattern = /^#([a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]+)(,#([a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]+))*$/;
            if (!tagPattern.test(tags)) {
                alert("태그는 #으로 시작하며 쉼표로 구분해야 합니다. 예: #책,#도서관,#책추천");
                document.getElementById("tags").focus();
                return false;
            }
        }

        return true; // 모든 유효성 검사를 통과하면 true 반환
    }

</script>

    
</body>
</html>











<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
