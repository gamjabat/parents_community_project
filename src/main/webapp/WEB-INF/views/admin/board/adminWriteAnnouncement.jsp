<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사용자 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/main/adminMain.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
	    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<link rel="stylesheet"
	href="${path}/resources/css/admin/board/adminBoardwrite.css">
</head>
<body>
	<header class="admin-header">
		<h1>학부모 커뮤니티 관리자 페이지</h1>
		<nav>
			<ul>
				<li><a
					href="${pageContext.request.contextPath}/admin/main.do?cPage=1&numPerPage=5#users">사용자관리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/main.do?cPage=1&numPerPage=5#posts">게시글관리</a></li>
				<li><a
					href="${pageContext.request.contextPath}/admin/board/adminWrite.do">공지글관리</a></li>
			</ul>
		</nav>
	</header>
	<!-- 메인 컨테이너 -->
	<div class="main-container">
		<h1 class="page-title">공지사항 글쓰기</h1>

		<!-- 섹션 1: 카테고리 & 제목 입력 -->
		<div class="section">
			<form action="${path }/admin/board/adminWriteAnnouncement.do"
				method="post">

				<!-- 로그인한 사용자의 멤버 번호를 전송하기 위한 숨겨진 입력 필드 -->
				<input type="hidden" name="memberNo"
					value="${sessionScope.loginMember.memberNo}" />

				<div class="form-group" style="text-align: left">
					<label for="category"><h3>공지사항</h3></label>
					<div class="button-container">
						<button id="submit-btn">등록</button>
					</div>
				</div>

				<div class="form-group">
					<label for="title">제목을 입력해 주세요.</label> <input type="text"
						id="title" class="form-control" placeholder="제목을 입력해 주세요."
						name="title">
				</div>
		</div>
		<div class="section">
			<div class="form-group">
				<label for="editor-container">내용을 입력해 주세요.</label>
				<div id="editor-container"></div>
				<input id="content" type="hidden" name="content" />
			</div>
		</div>
		</form>
	</div>

	<footer>
		<p>&copy; 2024 학부모 커뮤니티</p>
	</footer>

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
		 
		document.getElementById('submit-btn').addEventListener('click',
				function() {
					var content = quill.root.innerHTML;
					document.getElementById("content").value = content;
				});
	</script>


</body>
</html>

