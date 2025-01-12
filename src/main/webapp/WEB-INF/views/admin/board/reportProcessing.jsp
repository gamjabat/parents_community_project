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
				<h5>신고한 사용자 : ${reportBoard.reportMemberId}</h5>
				<h5>신고글 유형 : ${reportBoard.reportBoardType}</h5>
				<h5>신고당한 글<br>   
						${reportBoard.reportFromContent}</h5>
				<h5>신고접수 내용<br>${reportBoard.reportContent}</h5>
			</div>
			<!-- 신고 모달 -->
			<div class="modal fade" id="reportModal" tabindex="-1"
				aria-labelledby="reportModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-body">
							<form id="reportForm" action="${pageContext.request.contextPath}/admin/board/reportProcessing.do?"
								method="post" onsubmit="return fn_invalidate();">
								<div class="mb-3">
		        				<input type="hidden" name="reportNo" value="${reportBoard.reportNo}">
									<label for="reportReason" class="form-label">신고 처리유형</label><br> 
									<select class="form-select" id="reportReason" name="reason" required>
										<option value="" selected disabled>신고조치 상태를 선택하세요</option>
										<option value="RHS-3">신고반려</option>
										<option value="RHS-4">신고승인처리</option>
									</select>
								</div>
								<div class="mb-3">
									<label for="reportDetails" class="form-label">처리 내용</label><br>
									<textarea class="form-control" id="reportDetails"
										name="details" rows="3" placeholder="처리 내용을 입력하세요"></textarea>
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-danger">신고처리</button>
									<button type="button" onclick="javasciprt:window.close();" class="btn btn-secondary me-2"
										data-bs-dismiss="modal">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
</section>
<script>

	
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
	  
	  opener.location.reload();
	  
	  
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

