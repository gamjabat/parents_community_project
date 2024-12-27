<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<link rel="stylesheet"
	href="${path}/resources/css/board/boardDetail.css">
<section id="main-container">

	<div class="board-container px-4">
		<!-- 제목 -->
		<div class="d-flex justify-content-between py-1">
			<div style="display=align-center;">
				<h3 >
					<strong>신고처리</strong>
				</h3>
				
				<h5>신고글 번호 : ${reportBoard.reportNo}</h5>
				<h5>신고한 사용자id : ${reportBoard.reportMemberId}</h5>
				<h5>신고글 유형 : ${reportBoard.reportBoardType}</h5>
				<h5>신고당한 글 내용   <br>
						${reportBoard.reportFromContent}</h5>
				<h5>신고접수 내용 :  ${reportBoard.reportContent}</h5>
			</div>
			<!-- 신고 모달 -->
			<div class="modal fade" id="reportModal" tabindex="-1"
				aria-labelledby="reportModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
<!-- 						<div class="modal-header">
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div> -->
						<div class="modal-body">
							<form id="reportForm" action="${pageContext.request.contextPath}/admin/board/reportProcessing.do?"
								method="post" onsubmit="return fn_invalidate();">
								<%-- 		        	<input type="hidden" name="currentBoardNo" value="${param.boardNo}" />
		        	<input type="hidden" name="boardNo" value="${boardNo || ''}">
		        	<input type="hidden" name="commentNo" value="${commentNo || ''}"> --%>
								<div class="mb-3">
		        				<input type="hidden" name="reportNo" value="${reportBoard.reportNo}">
									<label for="reportReason" class="form-label">신고 처리유형</label> <select
										class="form-select" id="reportReason" name="reason" required>
										<option value="" selected disabled>신고조치 상태를 선택하세요</option>
										<option value="RHS-3">신고반려</option>
										<option value="RHS-4">신고승인처리</option>
									</select>
								</div>
								<div class="mb-3">
									<label for="reportDetails" class="form-label">처리 내용</label>
									<textarea class="form-control" id="reportDetails"
										name="details" rows="3" placeholder="처리 내용을 입력하세요"></textarea>
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-danger">신고처리</button>
									<button type="button" class="btn btn-secondary me-2"
										data-bs-dismiss="modal">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
</section>
<script>
		/* 
	 // 댓글 수정 버튼 클릭 시 수정 폼 보이기
    $(".dropdown-item1").click(function (e) {
        e.preventDefault(); // 기본 링크 클릭 동작 방지

        const $parent = $(this).closest(".comment"); // 클릭한 댓글 요소 찾기
        const commentNo = $parent.find("input[name='commentNo']").val(); // 댓글 번호 가져오기
        const currentContent = $parent.find(".comment-content").text().trim(); // 댓글 내용 가져오기
        console.log(commentNo);
        // 수정 폼이 이미 존재하지 않으면 폼 생성
        if ($parent.find(".edit-form").length === 0) {
            const $form = `
                <form class="edit-form" action="${path}/board/updatecomment.do" method="POST">
			
                    <input type="hidden" name="commentNo" value="\${commentNo}">
                    <input type="hidden" name="boardNo" value="${board.boardNo}">
                    <textarea name="commentContent">\${currentContent}</textarea>
                    <button type="submit">수정</button>
                </form>
            `;
            $parent.find(".comment-content").html($form); // 댓글 내용 영역에 수정 폼 삽입
        }
    });

    // 댓글 수정 폼 제출 처리
    $(document).on("submit", ".edit-form", function (e) {
        e.preventDefault(); // 폼의 기본 제출 동작 방지

        const $form = $(this);
        const commentNo = $form.find("input[name='commentNo']").val();
        const commentContent = $form.find("textarea[name='commentContent']").val();

        // 서버로 수정된 댓글 전송
        $.post($form.attr("action"), $form.serialize(), function(response) {
            // 성공 시 댓글 내용 갱신
            $form.closest(".comment").find(".comment-content").text(commentContent);
            alert("댓글이 수정되었습니다.");
        }).fail(function() {
            alert("댓글 수정에 실패했습니다.");
        });
    });
 */
    
    
/*     
	//  대댓글 기능 스크립트.
	$(".btn-insert2").click(e => {
	    const $parent = $(e.target).parents("div.comment");
	    console.log($parent);
	    const $form = $(".comment-input>form").clone();
	    console.log($form);
		
	    
	    $form.find("button").removeAttr("id").addClass("btn-insert2");
	    
	    // commentLevel 값을 설정 (대댓글은 레벨 2)
	    $form.find("input[name='level']").val('2');
	    console.log("Level: ", $form.find("input[name='level']").val()); // 로그로 확인

	    // parentCommentNo 값도 설정
	    const parentCommentNo = $parent.find('input[name="parentCommentNo"]').val();
	    $form.append('<input type="hidden" name="parentCommentNo" value="' + parentCommentNo + '" />');
	    console.log("Parent Comment No: ", parentCommentNo); // 로그로 확인

	    // 생성한 폼을 댓글 아래에 추가
	    $parent.after($form);
	});
	 */
	
/* //아이콘을 담고 있는 요소 선택
const heartIcon = document.getElementById("heart-icon"); */

// 현재 상태 (true: 좋아요, false: 좋아요 해제)
/* let isLiked = false; */

// 클릭 이벤트 리스너 추가
/* heartIcon.addEventListener("click", () => {
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
}); */

	// 현재 상태 (true: 좋아요, false: 좋아요 해제)
/* 	let isLiked = false;
	
<<<<<<< HEAD

=======
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
	
	
	/* 신고 모달 관련 javascript*/
 	document.getElementById('reportForm').addEventListener('submit', function(event) {
	  event.preventDefault(); // 기본 제출 방지
	  
	  const loginMember = ${loginMember != null ? 'true' : 'false'};
	    if (!loginMember) {
	        alert("로그인 후 신고 가능합니다.");
	        location.assign("${path}/login/loginpage.do");
	        return;
	    }
	  
	
	  const reasonInput = document.getElementById('reportReason');
	  const detailsInput = document.getElementById('reportDetails');
	
	  // 신고 사유 확인
	  if (!reasonInput.value.trim()) {
	      alert("신고 유형을 선택해주세요.");
	      reasonInput.focus();
	      return;
	  }
	
	  // 신고 내용 확인
	  if (!detailsInput.value.trim()) {
	      alert("신고 내용을 입력해주세요.");
	      detailsInput.focus();
	      return;
	  }
	
	  this.submit();
	  // 모달 닫기
	  const reportModal = bootstrap.Modal.getInstance(document.getElementById('reportModal'));
	  reportModal.hide();
	});
	
	document.addEventListener('DOMContentLoaded', () => {
	    // 신고 모달 열릴 때
	    const reportModal = document.getElementById('reportModal');
	    reportModal.addEventListener('show.bs.modal', (event) => {
	        const button = event.relatedTarget; // 모달을 열 때 클릭한 버튼
	        const boardNo = button.getAttribute('data-board-no'); // 글번호
	        const commentNo = button.getAttribute('data-comment-no'); // 댓글번호
	
	        console.log('신고 대상 글번호:', boardNo);
	        console.log('신고 대상 댓글번호:', commentNo);
	
	        // 숨겨진 input에 글번호나 댓글번호 설정
	        const form = document.getElementById('reportForm');
	
	        // 기존의 필드를 제거하고 새로 추가
	        form.querySelectorAll('input[name="boardNo"], input[name="commentNo"]').forEach(input => input.remove());
	
	        if (boardNo) {
	            const boardNoInput = document.createElement('input');
	            boardNoInput.type = 'hidden';
	            boardNoInput.name = 'boardNo';
	            boardNoInput.value = boardNo;
	            form.appendChild(boardNoInput);
	        }
	
	        if (commentNo) {
	            const commentNoInput = document.createElement('input');
	            commentNoInput.type = 'hidden';
	            commentNoInput.name = 'commentNo';
	            commentNoInput.value = commentNo;
	            form.appendChild(commentNoInput);
	        }
	    });
	
	    // 모달 닫힐 때 숨겨진 필드 초기화
	    reportModal.addEventListener('hide.bs.modal', () => {
	        const form = document.getElementById('reportForm');
	        form.querySelectorAll('input[name="boardNo"], input[name="commentNo"]').forEach(input => input.remove());
	    });
	}); 
 
</script>



<!-- AJAX 하트 기능 추가 -->
<script>



/*
document.addEventListener("DOMContentLoaded", function() {
    fetch(`${path}/board/isLiked.do?boardNo=${board.boardNo}&memberNo=${sessionScope.loginMember.memberNo}`)
    .then(response => {
        if (!response.ok) {
            throw new Error('서버 상태 이상'); // 서버에서 200 OK가 아닌 경우 에러 처리
        }
        return response.json();
    })
    .then(data => {
        isLikeStatus = data.isLiked; // 좋아요 상태 변수 업데이트
        if(isLikeStatus==1||isLikeStatus==0){   
        	updateHeartIcon(isLikeStatus); // 하트 아이콘 업데이트
        	const count=data.newLikeCount;
        	$("#heart-icon+span").text("좋아요 "+count);
        }
        else alert("좋아요 실패! :( , 관리자에게 문의하세요!");
        
        
    })
    .catch(error => console.error('좋아요 상태 로드 실패:', error));
});

const heartIcon1 = document.getElementById("heart-icon"); // 아이디 중복 문제 해결
const likeCount = document.getElementById("likeCount");

// 하트 클릭 시 좋아요 상태 토글
heartIcon1.addEventListener("click", () => {
    //isLikeStatus = !isLikeStatus; // 상태 토글
    updateLikeStatus(); // 서버로 요청 보내기
});

function updateLikeStatus() {
    fetch(`${path}/board/toggleLike.do`, {
        method: 'POST', // 메소드를 명시적으로 POST로 설정
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            boardNo: "${board.boardNo}", // 실제 boardNo를 동적으로 전달
            memberNo: "${sessionScope.loginMember.memberNo}" // 실제 memberNo를 동적으로 전달
        })
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('좋아요 상태 변경 실패'); // 서버 에러 처리
        }
        return response.json();
    })
    .then(data => {
    	 isLikeStatus = data.success; // 좋아요 상태 변수 업데이트
         if(isLikeStatus==1||isLikeStatus==0){   
         	updateHeartIcon(isLikeStatus); // 하트 아이콘 업데이트
         	const count=data.newLikeCount;
         	$("#heart-icon+span").text("좋아요 "+count);
         }
         else alert("좋아요 실패! :( , 관리자에게 문의하세요!");
    })
    .catch(error => {
        console.error('좋아요 상태 업데이트 중 오류:', error);
        alert('네트워크 오류');
    });
}



// 하트 아이콘 업데이트 함수
function updateHeartIcon(isLikeStatus) {
    heartIcon1.innerHTML = isLikeStatus==1 ? 
    `<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="#dc3545" class="bi bi-heart-fill mx-1" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
    </svg>` : 
    `<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-heart mx-1" viewBox="0 0 16 16">
        <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
    </svg>`;
}

*/

</script>
