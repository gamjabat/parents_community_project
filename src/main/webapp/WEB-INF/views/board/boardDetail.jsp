<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/board/boardDetail.css">
<section id="main-container">

	<div class="board-container px-4">
            <!-- 제목 -->
            <div class="d-flex justify-content-between py-1">
            	<div>
	                <h5><strong>[잡담]</strong> <strong>${board.title}</strong></h5>
            	</div>
            	 <!-- 드롭다운 -->
		        <div class="dropdown">
		            <!-- 아이콘 버튼 -->
		            <a href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
		                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-three-dots dropdown-icon" viewBox="0 0 16 16">
		                    <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
		                </svg>
		            </a>
		            <!-- 드롭다운 메뉴 -->
		            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
		                <li><a class="dropdown-item" href="${path}/board/edit.do?boardNo=${board.boardNo}">글 수정</a></li>
		                <li><a class="dropdown-item" href="${path}/board/delete.do?boardNo=${board.boardNo}" onclick="return confirm('이 게시물을 삭제하시겠습니까?');">글 삭제</a></li>
		                <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#reportModal">글 신고</a></li>

		            </ul>
		        </div>
            </div>
            <!-- 게시글 정보 -->
            <div class="board-meta text-muted py-1 mb-3">
            	<div class="w-100">
            		<div class="w-100">
				    <span>작성자: "a" | </span>
				    <span>작성일: <fmt:formatDate value="${board.createdAt}" pattern="yyyy.MM.dd HH:mm"/></span>
				</div>
            	</div>
            	<div class="d-flex flex-row justify-content-end flex-shrink-1">
            		<div class="d-flex justify-content-center align-items-center px-1">
            			<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-eye mx-1" viewBox="0 0 16 16">
						  <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
						  <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
						</svg>
		                <span class="fw-bold"> 조회수 1 </span>
            		</div>
	                <div class="d-flex justify-content-center align-items-center px-1">
	                	<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" fill="currentColor" class="bi bi-chat-left-dots mx-1" viewBox="0 0 16 16">
						  <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
						  <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0"/>
						</svg>
		                <span class="fw-bold"> 댓글 2</span>
	                </div>
                </div>
            </div>
            <!-- 첨부파일 -->
            <div class="file-attachment">
            	<div class="p-1">
	            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder" viewBox="0 0 16 16">
					  <path d="M.54 3.87.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3h3.982a2 2 0 0 1 1.992 2.181l-.637 7A2 2 0 0 1 13.174 14H2.826a2 2 0 0 1-1.991-1.819l-.637-7a2 2 0 0 1 .342-1.31zM2.19 4a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91h10.348a1 1 0 0 0 .995-.91l.637-7A1 1 0 0 0 13.81 4zm4.69-1.707A1 1 0 0 0 6.172 2H2.5a1 1 0 0 0-1 .981l.006.139q.323-.119.684-.12h5.396z"/>
					</svg>
					<span class="px-1">고양이.jpg</span>
            	</div>
            	<div class="p-1">
	            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder" viewBox="0 0 16 16">
					  <path d="M.54 3.87.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3h3.982a2 2 0 0 1 1.992 2.181l-.637 7A2 2 0 0 1 13.174 14H2.826a2 2 0 0 1-1.991-1.819l-.637-7a2 2 0 0 1 .342-1.31zM2.19 4a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91h10.348a1 1 0 0 0 .995-.91l.637-7A1 1 0 0 0 13.81 4zm4.69-1.707A1 1 0 0 0 6.172 2H2.5a1 1 0 0 0-1 .981l.006.139q.323-.119.684-.12h5.396z"/>
					</svg>
					<span class="px-1">고양이.jpg</span>
            	</div>
            </div>
            <!-- 이미지 -->
            <!-- <div class="text-center mb-3">
                <img src="https://via.placeholder.com/200" alt="고양이 이미지" class="img-fluid rounded">
            </div> -->
            <!-- 내용 -->
            <!-- 내용 -->
			<p>${board.content}</p>
            <!-- 해시태그 -->
            <div class="hashtag-container d-flex flex-row justify-content-start">
            	<div>#인사</div>
            	<div>#인사</div>
            </div>
            <!-- 좋아요 및 댓글 입력 -->
            <div class="board-stats my-3 d-flex align-items-center">
           		<div class="d-flex justify-content-center align-items-center px-1">	
	            	<div id="heart-icon" class="icons">
		            	<!-- 빈하트 -->
	           			<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-heart mx-1" viewBox="0 0 16 16">
							<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
						</svg>
						<!-- 빨간 하트
						<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="#dc3545" class="bi bi-heart-fill mx-1" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
						</svg> -->
					</div>
	                <span class="fw-bold"> 좋아요 1 </span>
           		</div>
                <div class="d-flex justify-content-center align-items-center px-1">
                	<div class="icons">
	                	<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-chat-left-dots mx-1" viewBox="0 0 16 16">
						  <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
						  <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0"/>
						</svg>
                	</div>
	                <span class="fw-bold"> 댓글 2</span>
                </div>
            </div>
            <hr>
            <!-- 댓글 목록 -->
            <div class="comment-container p-1">
            	<!-- 로그인 완료 후에만 보임 -->
            	<div class="comment-form pb-3 mb-3">
	                	<div class="d-flex justify-content-between">
		                	<div class="fs-6 fw-bold me-2">${sessionScope.loginMember.memberId}</div>
	                	</div>
	                	<div class="comment-input px-2 mt-1 d-flex flex-row align-items-center justify-content-center w-100">
	                	<form action="${path}/board/insertcomment.do" method="post">
	                		<input type="hidden" name="commentBoardNo" value="${board.boardNo}"/>
	                		<input type="hidden" name="parentCommentNo" value="0"/>
	                		<input type="hidden" name="level" value="1"/>
	                		<input type="hidden" name="commentMemberNo" value="${sessionScope.loginMember.memberNo}"/>
	                		<textarea name="content" cols="50" rows="3"></textarea>
		                	<button type="submit" id="btn-insert" class="comment-btn ms-2 d-flex align-items-center justify-content-center">등록</button>
		                </form>
	                	</div>
	           		 </div>
            	<div class="d-flex justify-content-end">
	            	<select class="comment-sort form-select form-select-sm" aria-label=".form-select-sm example">
					  <option selected>최신순</option>
					  <option value="1">인기순</option>
					  <option value="2">등록순</option>
					</select>
            	</div>
            	
          <!-- 댓글시작  -->  	
		  <div id="tbl-comment">
		    <div class="comments">
		        <c:if test="${not empty comments}">
		            <!-- 댓글 반복문 -->
		            <c:forEach var="comment" items="${comments}">
		                <!-- 댓글 (레벨 1) -->
		                <c:if test="${comment.commentLevel == 1}">
		                    <div class="comment">
		                        <!-- 작성자 아이디 -->
		                        <div class="d-flex justify-content-between">
		                            <div class="fs-6 fw-bold me-2">${comment.commentMemberNo}</div>
		                            <!-- 드롭다운 -->
		                            <div class="dropdown">
		                                <!-- 아이콘 버튼 -->
		                                <a href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
		                                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-three-dots dropdown-icon" viewBox="0 0 16 16">
		                                        <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
		                                    </svg>
		                                </a>
		                                <!-- 드롭다운 메뉴 -->
		                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
		                                    <li><a class="dropdown-item" href="#">댓글 수정</a></li>
		                                    <li><a class="dropdown-item" href="#">댓글 삭제</a></li>
		                                    <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#reportModal">댓글 신고</a></li>
		                                </ul>
		                            </div>
		                        </div>
		                        <!-- 댓글 내용 -->
		                        <div class="comment-content">
		                            ${comment.commentContent}
		                        </div>
		                        <!-- 댓글 날짜 -->
		                        <div class="comment-meta pb-2">
		                            <div class="d-flex align-items-end justify-content-center">${comment.createdAt}</div>
		                            <input type="hidden" name="parentCommentNo" value="${comment.commentNo}"/>
		                            <button  class="comment-btn ms-2 d-flex align-items-center justify-content-center btn-insert2">대댓글 쓰기</button>
		                        </div>
		                    </div>
		                </c:if>
		                <!-- 대댓글 (레벨 2) -->
		                <c:if test="${comment.commentLevel == 2}">
		                    <div class="sub-comment d-flex flex-row">
		                        <div class="mx-2">
		                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
		                                <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5"/>
		                            </svg>
		                        </div>
		                        <div class="comment d-flex flex-column flex-grow-1">
		                            <div class="d-flex justify-content-between">
		                                <div class="fs-6 fw-bold me-2">${comment.commentMemberNo}</div>
		                                <!-- 드롭다운 -->
		                                <div class="dropdown">
		                                    <a href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
		                                        <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-three-dots dropdown-icon" viewBox="0 0 16 16">
		                                            <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
		                                        </svg>
		                                    </a>
		                                    <!-- 드롭다운 메뉴 -->
		                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
		                                        <li><a class="dropdown-item" href="#">댓글 수정</a></li>
		                                        <li><a class="dropdown-item" href="#">댓글 삭제</a></li>
		                                        <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#reportModal">댓글 신고</a></li>
		                                    </ul>
		                                </div>
		                            </div>
		                            <div class="comment-content">
		                                ${comment.commentContent}
		                            </div>
		                            <div class="comment-meta pb-2">
		                                <div class="d-flex align-items-end justify-content-center">${comment.createdAt}</div>
		                            </div>
		                        </div>
		                    </div>
		                </c:if>
		            </c:forEach>
		        </c:if>
		    </div>
		</div>

            <!-- 페이지네이션 -->
            <nav aria-label="Page navigation" class="mt-4">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                </ul>
            </nav>
        </div>
       
        
        <!-- 신고 모달 -->
		<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="reportModalLabel">신고하기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <form id="reportForm">
		          <div class="mb-3">
		            <label for="reportReason" class="form-label">신고 사유</label>
		            <select class="form-select" id="reportReason" required>
		              <option value="" selected disabled>신고 사유를 선택하세요</option>
		              <option value="spam">스팸</option>
		              <option value="abusive">욕설 및 비방</option>
		              <option value="inappropriate">부적절한 내용</option>
		              <option value="other">기타</option>
		            </select>
		          </div>
		          <div class="mb-3">
		            <label for="reportDetails" class="form-label">상세 내용</label>
		            <textarea class="form-control" id="reportDetails" rows="3" placeholder="신고 내용을 입력하세요"></textarea>
		          </div>
		          <!-- 버튼 중앙 정렬 -->
		          <div class="text-center">
		            <button type="submit" class="btn btn-danger">신고 제출</button>
		            <button type="button" class="btn btn-secondary me-2" data-bs-dismiss="modal">취소</button>
		          </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		


		
        
        
</section>
	<script>
	
	$(".btn-insert2").click(e=>{
		
		const $parent=$(e.target).parents("div.comment");
		console.log($parent);
		const $form=$(".comment-input>form").clone();
		console.log($form);
		
		$parent.after($form);
	})



//아이콘을 담고 있는 요소 선택
const heartIcon = document.getElementById("heart-icon");

// 현재 상태 (true: 좋아요, false: 좋아요 해제)
let isLiked = false;

// 클릭 이벤트 리스너 추가
heartIcon.addEventListener("click", () => {
    // 상태 토글
    isLiked = !isLiked;

    // 상태에 따라 아이콘 변경
    if (isLiked) {
        // 빨간 하트
        heartIcon.innerHTML = `
            <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="#dc3545" class="bi bi-heart-fill mx-1" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
            </svg>
        `;
    } else {
        // 빈 하트
        heartIcon.innerHTML = `
            <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-heart mx-1" viewBox="0 0 16 16">
                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
            </svg>
        `;
    }
});


 document.addEventListener("DOMContentLoaded", () => {
    // "대댓글 쓰기" 버튼에 이벤트 리스너 추가
    document.querySelectorAll(".sub-comment-btn").forEach((btn) => {
        btn.addEventListener("click", () => {
            // 부모 .comment 요소 찾기
            const commentElement = btn.closest(".comment");

            // 대댓글 입력 요소가 이미 있는지 확인
            const existingSubCommentForm = commentElement.querySelector(".sub-comment.comment-form");

            if (existingSubCommentForm) {
                // 이미 존재하면 제거 (토글 기능)
                existingSubCommentForm.remove();
            } else {
                // 새 대댓글 입력 요소 생성
                const subCommentForm = document.createElement("div");
                subCommentForm.classList.add("sub-comment", "d-flex", "flex-row", "comment-form");

                subCommentForm.innerHTML = `
                    <div class="mx-2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5"/>
                        </svg>
                    </div>
                    <div class="comment-form pb-3 mb-3">
                        <div class="d-flex justify-content-between">
                            <div class="fs-6 fw-bold me-2">닉네임</div>
                        </div>
                        <div class="comment-input px-2 mt-1 d-flex flex-row align-items-center justify-content-center w-100">
                            <textarea></textarea>
                            <div class="comment-btn ms-2 d-flex align-items-center justify-content-center">등록</div>
                        </div>
                    </div>
                `;

                // 새 요소를 comment의 마지막 자식으로 추가
                commentElement.appendChild(subCommentForm);
            }
        });
    });
});



document.getElementById('reportForm').addEventListener('submit', function(event) {
  event.preventDefault(); // 기본 제출 방지

  // 폼 데이터 가져오기
  const reason = document.getElementById('reportReason').value;
  const details = document.getElementById('reportDetails').value;

  // 예제: 데이터 콘솔 출력
  console.log('신고 사유:', reason);
  console.log('신고 상세 내용:', details);

  // 모달 닫기
  const reportModal = bootstrap.Modal.getInstance(document.getElementById('reportModal'));
  reportModal.hide();

  // 사용자에게 알림
  alert('신고가 접수되었습니다.');
});
</script>

	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>