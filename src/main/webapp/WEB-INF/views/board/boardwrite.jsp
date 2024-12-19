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
            <div class="form-group">
                <label for="category">카테고리를 선택해 주세요.</label>
              <div class="select-container" style="padding:0;">
                <select id="category" class="form-control " name="category">
                
                	<option value="공지">공지</option>
                    <option value="잡담">잡담</option>
                    <option value="책">책</option>
                    <option value="진학">진학</option>
                    <option value="진로">진로</option>
                    <option value="유아">유아</option>
                    <option value="입시">입시</option>
                    <option value="정보">정보</option>
                    <option value="질문">질문</option> 
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
            placeholder: '   내용을 입력해 주세요...',
            modules: {
                toolbar: [['bold', 'italic', 'underline'], [{ 'header': 1 }, { 'header': 2 }], [{ 'list': 'ordered' }, { 'list': 'bullet' }], ['link', 'image']]
            }
        });
        document.getElementById('submit-btn').addEventListener('click', function() {
            var content = quill.root.innerHTML;
            document.getElementById("content").value=content;
           
        });
    </script>
    
</body>
</html>











<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
