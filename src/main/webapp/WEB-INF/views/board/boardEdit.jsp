<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>커뮤니티 글 수정하기</title>
    <!-- Quill.js CSS -->
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${path}/resources/css/board/boardwrite.css">
</head>
<body>
    <div class="main-container">
        <h1 class="page-title">커뮤니티 글 수정하기</h1>

        <!-- 섹션 1: 카테고리 & 제목 입력 -->
        <div class="section">
            <form action="${path}/board/boardupdateend.do" method="post">
                <input type="hidden" name="boardNo" value="${board.boardNo}">
                <div class="form-group">
                    <label for="category">카테고리를 선택해 주세요.</label>
                    <select id="category" class="form-control" name="category" value="1"> <!-- ${board.category} -->
                        <!-- Options reflect the category of the post being edited -->
                        <%-- <c:forEach var="cat" items="${categories}">
                            <option value="${cat}" ${cat == board.category ? 'selected' : ''}>${cat}</option>
                        </c:forEach> --%>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="title">제목을 입력해 주세요.</label>
                    <input type="text" id="title" class="form-control" placeholder="제목을 입력해 주세요." name="title" value="${board.title}">
                </div>

                <!-- 섹션 2: 내용 입력 -->
                <div class="section">
                    <div class="form-group">
                        <label for="editor-container">내용을 입력해 주세요.</label>
                        <div id="editor-container">${board.content}</div>
                        <input id="content" type="hidden" name="content"/>
                    </div>
                </div>

                <!-- 섹션 3: 태그 입력 -->
                <div class="section tags-input">
                    <div class="form-group">
                        <label for="tags">#태그를 입력해 주세요.</label>
                        <input type="text" id="tags" class="form-control" placeholder="#태그를 입력해 주세요." name="tag" value="1">  <!-- ${board.tag} -->
                    </div>
                </div>

                <!-- 등록 버튼 -->
                <div class="button-container">
                    <button id="submit-btn">수정</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Quill.js 라이브러리 -->
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    <script>
        var quill = new Quill('#editor-container', {
            theme: 'snow',
            placeholder: '내용을 입력해 주세요...',
            modules: {
                toolbar: [['bold', 'italic', 'underline'], [{ 'header': 1 }, { 'header': 2 }], [{ 'list': 'ordered' }, { 'list': 'bullet' }], ['link', 'image']]
            }
        });
        document.getElementById('submit-btn').addEventListener('click', function() {
            var content = quill.root.innerHTML;
            document.getElementById("content").value = content;
        });
    </script>
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
