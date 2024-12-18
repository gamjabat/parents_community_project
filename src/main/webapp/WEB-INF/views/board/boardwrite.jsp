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
    <div class="write-container">
        <h1 class="page-title">커뮤니티 글쓰기</h1>

        <!-- 카테고리 선택 -->
        <div class="form-group">
            <label for="category">카테고리를 선택해 주세요.</label>
            <select id="category" class="form-control">
                <option>공지사항</option>
                <option>자유게시판</option>
                <option>질문답변</option>
            </select>
        </div>

        <!-- 제목 입력 -->
        <div class="form-group">
            <label for="title">제목을 입력해 주세요.</label>
            <input type="text" id="title" class="form-control" placeholder="제목을 입력해 주세요.">
        </div>

        <!-- Quill 에디터 영역 -->
        <div class="form-group">
            <label>내용을 입력해 주세요.</label>
            <div id="editor-container"></div>
        </div>

        <!-- 등록 버튼 -->
        <div class="button-container">
            <button id="submit-btn">등록</button>
        </div>
    </div>

    <!-- Quill.js 라이브러리 -->
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    <script>
        // Quill 에디터 초기화
        var quill = new Quill('#editor-container', {
            theme: 'snow', // Snow 테마
            placeholder: '내용을 입력해 주세요...',
            modules: {
                toolbar: [
                    ['bold', 'italic', 'underline'], // 텍스트 스타일
                    [{ 'header': 1 }, { 'header': 2 }], // 헤더 스타일
                    [{ 'list': 'ordered' }, { 'list': 'bullet' }], // 리스트
                    ['link', 'image'], // 링크 및 이미지 업로드
                ]
            }
        });

        // 등록 버튼 클릭 이벤트
        document.getElementById('submit-btn').addEventListener('click', function() {
            var content = quill.root.innerHTML;
            console.log("작성된 내용:", content);
            alert("글이 등록되었습니다!\n" + content);
        });
    </script>
</body>
</html>







<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

