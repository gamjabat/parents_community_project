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
</head>
<body>
	<header class="admin-header">
		<h1>학부모 커뮤니티 관리자 페이지</h1>
		<nav>
			<ul>
				<li><a href="#users">사용자 관리</a></li>
				<li><a href="#posts">게시글 관리</a></li>
			</ul>
		</nav>
	</header>

	<main>
		<section id="users">
			<h2>사용자 관리</h2>
			<table>
				<thead>
					<tr>
						<th>id</th>
						<th>이름</th>
						<th>이메일</th>
						<th>상세정보</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty members}">
						<c:forEach var="member" items="${members}">
							<tr>
								<td>${member.memberNo}</td>
								<td>${member.name}</td>
								<td>${member.email}</td>
								<td><button class="details-btn" onclick="openPopup(this)">상세정보</button></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<div class="pagination">
				<a href="#" class="page-link">&lt;&lt;</a> <a href="#"
					class="page-link">&lt;</a> <a href="#" class="page-link active">1</a>
				<a href="#" class="page-link">2</a> <a href="#" class="page-link">3</a>
				<a href="#" class="page-link">&gt;</a> <a href="#" class="page-link">&gt;&gt;</a>
			</div>
		</section>
		<section id="posts">
			<h2>게시글 관리</h2>
			<nav>
				<button type="button" 
				onclick="hideDeclaration();"
					class="btn btn-primary">문의글</button>
				<button type="button" class="btn btn-danger"
					onclick="hideInquery();">신고글</button>
			</nav>
			<table id="inquiry-table">
				<thead>
					<tr>
						<th>문의 번호</th>
						<th>문의한 회원id</th>
						<th>문의 유형</th>
						<th>문의 제목</th>
						<th>문의 내용</th>
						<th>문의 날짜</th>
						<th>처리상태</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty inqueryboards}">
						<c:forEach var="board" items="${inqueryboards}">
							<a href="javascript:inqueryDetailSearch();">
								<tr>
									<td>${board.inqueryNo}</td>
									<td>${board.inqueryMember.memberId}</td>
									<td>${board.inqueryCode}</td>
									<td>${board.inqueryTitle}</td>
									<td>${board.inqueryContent}</td>
									<td>${board.createDate}</td>
									<td>${board.status}</td>
								</tr>
							</a>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<table id="declaration-table" style="display: none;">
				<thead>
					<tr>
						<th>신고글 id</th>
						<th>신고한 회원id</th>
						<th>신고당한 회원id</th>
						<th>글 유형</th>
						<th>신고 내용</th>
						<th>신고 날짜</th>
						<th>처리중</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${not empty reportboards}">
						<c:forEach var="rboard" items="${reportboards}">
							<tr>
								<td>${rboard.reportNo}</td>
								<td>${rboard.reportMember.memberId}</td>
								<td>${rboard.suspectMember.memberId}</td>
								<td>${rboard.reportCode}</td>
								<td>${rboard.reportTitle}</td>
								<td>${rboard.reportContent}</td>
								<td>${rboard.reportStatus}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>

		</section>
		<div class="pagination">
			<a href="#" class="page-link">&lt;&lt;</a> <a href="#"
				class="page-link">&lt;</a> <a href="#" class="page-link active">1</a>
			<a href="#" class="page-link">2</a> <a href="#" class="page-link">3</a>
			<a href="#" class="page-link">&gt;</a> <a href="#" class="page-link">&gt;&gt;</a>
		</div>

	</main>

	<footer>
		<p>&copy; 2024 학부모 커뮤니티</p>
	</footer>

	<script>
		function openPopup(button) {
			// 클릭된 행(row) 가져오기
			const row = button.closest("tr");

			// 사용자 데이터 추출
			/*         const userData = {
			 id: row.dataset.id,
			 name: row.dataset.name,
			 email: row.dataset.email,
			 joinDate: row.dataset.joinDate,
			 status: row.dataset.status,
			 posts: row.dataset.posts,
			 comments: row.dataset.comments
			 }; */

			// 사용자 데이터 추출
			const userData = {
				memberNo : row.dataset.memberNo,
				uid : row.dataset.id,
				name : row.dataset.name,
				email : row.dataset.email,
				phone : row.dataset.phone,
				address : row.dataset.address,
				birth : row.dataset.birth,
				nickName : row.dataset.nickname,
				createDate : row.dataset.createDate,
				updateDate : row.dataset.updateDate,
				deleteDate : row.dataset.deleteDate,
				isDelete : row.dataset.status
			};

			// 팝업 URL에 데이터 전달 (쿼리스트링 사용)
			const popupUrl = `${pageContext.request.contextPath}/admin/memberInfo.do?memberNo=\${userData.memberNo}&id=\${userData.uid}&name=\${userData.name}&email=\${userData.email}&phone=\${userData.phone}&address=\${userData.address}&birth=\${userData.birth}&nick=\${userData.nick}&createDate=\${userData.createDate}&updateDate=\${userData.updateDate}&deleteDate=\${userData.deleteDate}&isDelete=\${userData.isDelete}`
			// 팝업 열기

			const popupW = 300;
			const popupH = 450;
			const left = Math.ceil((window.screen.width - popupW) / 2);
			const top = Math.ceil((window.screen.height - popupH) / 2);

			open(
					popupUrl,
					"_blank",
					"width="
							+ popupW
							+ ',height='
							+ popupH
							+ 'left='
							+ left
							+ ',top='
							+ top
							+ ',scrollbars=yes,resizable=no,toolbar=no,titlebar=no,menubar=no,location=no');
		}
		
		const hideDeclaration=()=>{
			$("#declaration-table").hide();
			$("#inquiry-table").show();
		}
		
		const hideInquery=()=>{
			$("#inquiry-table").hide();
			$("#declaration-table").show();
		}
		
		
		
/* 		const inqueryDetailSearch = ()=>{
			console.log('inquery 상세 클릭 ')
		
		
		} */
		
/*  		const searchInqueryboard=()=>{
			$.get("${pageContext.request.contextPath}/admin/searchInqueryboard.do")
			.done(data=>{
				data.forEach(v=>JSON.parse(v));			
			})
			.fail(response=>{console.log(response)})
			
		}  */
		
		
		
	</script>
</body>
</html>
