<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<!-- 예시 데이터 -->
<tr  data-member-no="1" data-id="parmhani" data-name="팜하니" data-email="pag@gmail.com" data-nickname="팜닉네임" data-phone="010-8282-1004" data-address="경기도 화성시 남양읍 미뇨니집" data-birth="2000-11-11"  
data-create-date="2024-01-15" data-status=false data-posts="12" data-update-date="2024-01-15"  data-delete-date="2024-01-15" 
data-comments="45" data-isDelete="false">
						<td>팜하니</td>
						<td>홍길동</td>
						<td>pag@gmail.com</td>
						<td><button class="details-btn" onclick="openPopup(this)">상세정보</button></td>
					</tr>
<tr  data-member-no="1" data-id="parmhani" data-name="팜하니" data-email="pag@gmail.com" data-nickname="팜닉네임" data-phone="010-8282-1004" data-address="경기도 화성시 남양읍 미뇨니집" data-birth="2000-11-11"  
data-create-date="2024-01-15" data-status=false data-posts="12" data-update-date="2024-01-15"  data-delete-date="2024-01-15" 
data-comments="45" data-isDelete="false">
						<td>팜하니</td>
						<td>홍길동</td>
						<td>pag@gmail.com</td>
						<td><button class="details-btn" onclick="openPopup(this)">상세정보</button></td>
					</tr>
<tr  data-member-no="1" data-id="parmhani" data-name="팜하니" data-email="pag@gmail.com" data-nickname="팜닉네임" data-phone="010-8282-1004" data-address="경기도 화성시 남양읍 미뇨니집" data-birth="2000-11-11"  
data-create-date="2024-01-15" data-status=false data-posts="12" data-update-date="2024-01-15"  data-delete-date="2024-01-15" 
data-comments="45" data-isDelete="false">
						<td>팜하니</td>
						<td>홍길동</td>
						<td>pag@gmail.com</td>
						<td><button class="details-btn" onclick="openPopup(this)">상세정보</button></td>
					</tr>
<tr  data-member-no="1" data-id="parmhani" data-name="팜하니" data-email="pag@gmail.com" data-nickname="팜닉네임" data-phone="010-8282-1004" data-address="경기도 화성시 남양읍 미뇨니집" data-birth="2000-11-11"  
data-create-date="2024-01-15" data-status=false data-posts="12" data-update-date="2024-01-15"  data-delete-date="2024-01-15" 
data-comments="45" data-isDelete="false">
						<td>팜하니</td>
						<td>홍길동</td>
						<td>pag@gmail.com</td>
						<td><button class="details-btn" onclick="openPopup(this)">상세정보</button></td>
					</tr>
<tr  data-member-no="1" data-id="parmhani" data-name="팜하니" data-email="pag@gmail.com" data-nickname="팜닉네임" data-phone="010-8282-1004" data-address="경기도 화성시 남양읍 미뇨니집" data-birth="2000-11-11"  
data-create-date="2024-01-15" data-status=false data-posts="12" data-update-date="2024-01-15"  data-delete-date="2024-01-15" 
data-comments="45" data-isDelete="false">
						<td>홍길동2</td>
						<td>박영희</td>
						<td>hong2@gmail.com</td>
						<td><button class="details-btn" onclick="openPopup(this)">상세정보</button></td>
					</tr>
<tr  data-member-no="1" data-id="parmhani" data-name="팜하니" data-email="pag@gmail.com" data-nickname="팜닉네임" data-phone="010-8282-1004" data-address="경기도 화성시 남양읍 미뇨니집" data-birth="2000-11-11"  
data-create-date="2024-01-15" data-status=false data-posts="12" data-update-date="2024-01-15"  data-delete-date="2024-01-15" 
data-comments="45" data-isDelete="false">
						<td>팜하니</td>
						<td>홍길동</td>
						<td>pag@gmail.com</td>
						<td><button class="details-btn" onclick="openPopup(this)">상세정보</button></td>
					</tr>
<tr  data-member-no="1" data-id="parmhani" data-name="팜하니" data-email="pag@gmail.com" data-nickname="팜닉네임" data-phone="010-8282-1004" data-address="경기도 화성시 남양읍 미뇨니집" data-birth="2000-11-11"  
data-create-date="2024-01-15" data-status=false data-posts="12" data-update-date="2024-01-15"  data-delete-date="2024-01-15" 
data-comments="45" data-isDelete="false">
						<td>팜하니</td>
						<td>홍길동</td>
						<td>pag@gmail.com</td>
						<td><button class="details-btn" onclick="openPopup(this)">상세정보</button></td>
					</tr>
<tr  data-member-no="1" data-id="parmhani" data-name="팜하니" data-email="pag@gmail.com" data-nickname="팜닉네임" data-phone="010-8282-1004" data-address="경기도 화성시 남양읍 미뇨니집" data-birth="2000-11-11"  
data-create-date="2024-01-15" data-status=false data-posts="12" data-update-date="2024-01-15"  data-delete-date="2024-01-15" 
data-comments="45" data-isDelete="false">
						<td>팜하니</td>
						<td>홍길동</td>
						<td>pag@gmail.com</td>
						<td><button class="details-btn" onclick="openPopup(this)">상세정보</button></td>
					</tr>
<tr  data-member-no="1" data-id="parmhani" data-name="팜하니" data-email="pag@gmail.com" data-nickname="팜닉네임" data-phone="010-8282-1004" data-address="경기도 화성시 남양읍 미뇨니집" data-birth="2000-11-11"  
data-create-date="2024-01-15" data-status=false data-posts="12" data-update-date="2024-01-15"  data-delete-date="2024-01-15" 
data-comments="45" data-isDelete="false">
						<td>팜하니</td>
						<td>홍길동</td>
						<td>pag@gmail.com</td>
						<td><button class="details-btn" onclick="openPopup(this)">상세정보</button></td>
					</tr>
				</tbody>
			</table>
		</section>
		<section id="posts">
			<h2>게시글 관리</h2>
			<nav>
				<button type="button" onclick="hideDeclaration();"
					class="btn btn-primary">문의글</button>
				<button type="button" class="btn btn-danger">신고글</button>
			</nav>
			<table id="declaration-table">
				<thead>
					<tr>
						<th>문의 id</th>
						<th>문의한 회원id</th>
						<th>문의 유형</th>
						<th>문의 제목</th>
						<th>문의 내용</th>
						<th>문의 날짜</th>
						<th>처리상태</th>
					</tr>
				</thead>
				<tbody>
					<tr data-member-no="1" data-id="parmhani" data-name="팜하니"
						data-email="pag@gmail.com" data-nickname="팜닉네임"
						data-phone="010-8282-1004" data-address="경기도 화성시 남양읍 미뇨니집"
						data-birth="2000-11-11" data-create-date="2024-01-15"
						data-status=false data-posts="12" data-update-date="2024-01-15"
						data-delete-date="2024-01-15" data-comments="45"
						data-isDelete=false>
						<td>1</td>
						<td>홍길동</td>
						<td>우치하</td>
						<td>댓글</td>
						<td>디자인 너무 짜친다고 욕했어요....</td>
						<td>2024-11-22</td>
						<td>처리중</td>
					</tr>
					<tr data-member-no="1" data-id="parmhani" data-name="팜하니"
						data-email="pag@gmail.com" data-nickname="팜닉네임"
						data-phone="010-8282-1004" data-address="경기도 화성시 남양읍 미뇨니집"
						data-birth="2000-11-11" data-create-date="2024-01-15"
						data-status=false data-posts="12" data-update-date="2024-01-15"
						data-delete-date="2024-01-15" data-comments="45"
						data-isDelete=false>
						<td>2</td>
						<td>팜하니</td>
						<td>유xx</td>
						<td>게시글</td>
						<td>강사님이 광고글을 유표(유포 아님 유표하심!(삼국지 유표))하셨어요....</td>
						<td>2024-11-10</td>
						<td>처리완료</td>
					</tr>
					<tr data-member-no="1" data-id="parmhani" data-name="팜하니"
						data-email="pag@gmail.com" data-nickname="팜닉네임"
						data-phone="010-8282-1004" data-address="경기도 화성시 남양읍 미뇨니집"
						data-birth="2000-11-11" data-create-date="2024-01-15"
						data-status=false data-posts="12" data-update-date="2024-01-15"
						data-delete-date="2024-01-15" data-comments="45"
						data-isDelete=false>
						<td>3</td>
						<td>사스케</td>
						<td>나루토</td>
						<td>게시글</td>
						<td>탈주했어요....</td>
						<td>2024-11-22</td>
						<td>처리중</td>
					</tr>
					<tr data-member-no="1" data-id="parmhani" data-name="팜하니"
						data-email="pag@gmail.com" data-nickname="팜닉네임"
						data-phone="010-8282-1004" data-address="경기도 화성시 남양읍 미뇨니집"
						data-birth="2000-11-11" data-create-date="2024-01-15"
						data-status=false data-posts="12" data-update-date="2024-01-15"
						data-delete-date="2024-01-15" data-comments="45"
						data-isDelete=false>
						<td>4</td>
						<td>샹크스</td>
						<td>루피</td>
						<td>댓글</td>
						<td>새시대에 두고왔다....</td>
						<td>2024-11-22</td>
						<td>처리중</td>
					</tr>
				</tbody>
			</table>
			<table id="inquiry-table" onclick="hideInquery();"
				style="visibility: hidden">
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
					<tr data-id="1" data-name="팜하니" data-email="pag@gmail.com"
						data-join-date="2024-01-15" data-status=false data-posts="12"
						data-comments="45">
						<td>1</td>
						<td>홍길동</td>
						<td>우치하</td>
						<td>댓글</td>
						<td>디자인 너무 짜친다고 욕했어요....</td>
						<td>2024-11-22</td>
						<td>처리중</td>
					</tr>
					<tr data-id="2" data-name="팜하니" data-email="pag@gmail.com"
						data-join-date="2024-01-15" data-status=false data-posts="12"
						data-comments="45">
						<td>2</td>
						<td>팜하니</td>
						<td>유xx</td>
						<td>게시글</td>
						<td>강사님이 광고글을 유표(유포 아님 유표하심!(삼국지 유표))하셨어요....</td>
						<td>2024-11-10</td>
						<td>처리완료</td>
					</tr>
					<tr data-id="3" data-name="팜하니" data-email="pag@gmail.com"
						data-join-date="2024-01-15" data-status=false data-posts="12"
						data-comments="45">
						<td>3</td>
						<td>사스케</td>
						<td>나루토</td>
						<td>게시글</td>
						<td>탈주했어요....</td>
						<td>2024-11-22</td>
						<td>처리중</td>
					</tr>
					<tr data-id="4" data-name="홍길동2" data-email="hong2@gmail.com"
						data-join-date="2023-12-01" data-status="탈퇴" data-posts="5"
						data-comments="10">
						<td>4</td>
						<td>샹크스</td>
						<td>루피</td>
						<td>댓글</td>
						<td>새시대에 두고왔다....</td>
						<td>2024-11-22</td>
						<td>처리중</td>
					</tr>
				</tbody>
			</table>
		</section>
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
			open(popupUrl, "_blank",
					"width=400px,height=800,scrollbars=yes");
		}
	</script>
</body>
</html>
