<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path }/resources/css/login/login.css">
<link rel="stylesheet" href="${path }/resources/css/login/findIdPassword.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.min.js"></script>
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="container">
    <div class="left-panel">
		<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="#5A8B63" class="bi bi-person-fill-lock" viewBox="0 0 16 16">
		  <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0m-9 8c0 1 1 1 1 1h5v-1a2 2 0 0 1 .01-.2 4.49 4.49 0 0 1 1.534-3.693Q8.844 9.002 8 9c-5 0-6 3-6 4m7 0a1 1 0 0 1 1-1v-1a2 2 0 1 1 4 0v1a1 1 0 0 1 1 1v2a1 1 0 0 1-1 1h-4a1 1 0 0 1-1-1zm3-3a1 1 0 0 0-1 1v1h2v-1a1 1 0 0 0-1-1"/>
		</svg>
		<div class="login-message">비밀번호를 잊으셨나요?</div>
    </div>
    <div class="right-panel">
      <div class="title" >비밀번호 찾기</div>
      <div class="input-container">
      	<div class="sub-title">본인확인 이메일로 인증</div>
      	<div class="description">본인확인 이메일 주소와 입력한 이메일 주소가 같아야,<br> 인증번호를 받을 수 있습니다.</div>
      	<form class="email-auth-input" action="${path }/login/newpassword.do">
      		<input type="text" name="id" placeholder="ID">
      		<div class="email-input mb-0">
      			<div class="input-btn">
			      	<input type="email" name="email" placeholder="email">
			        <button type="button" onclick="sendEmail();">인증번호 발송</button>
      			</div>
		        <small class="error"></small>
      		</div>
      		<div class="checkNum-input">
      			<div class="input-btn">
			      	<input type="text" name="checkNum" placeholder="인증번호 6자리 숫자 입력" disabled>
			      	<button type="button" onclick="verifyCode();" disabled>인증</button>
      			</div>
		        <small class="error"></small>
      		</div>
      		<div class="page-btns">
	      		<button type="button" onclick="history.back()">이전</button>
	      		<button type="submit" disabled>다음</button>
      		</div>
      	</form>
      </div>
    </div>
  </div>
  <script>
	const sendEmail = () => {
	    const email = document.querySelector('input[name="email"]').value.trim();
	    const errorElement = document.querySelector('.error');
	    const checkNumInput = document.querySelector('input[name="checkNum"]'); // 인증번호 입력 필드
	    const verifyButton = document.querySelector('.checkNum-input button'); // 인증 버튼

	    if (!email) {
	        errorElement.textContent = "이메일 주소를 입력해주세요.";
	        errorElement.style.color = "red";
	        return;
	    }

	    $.ajax({
	        url: `${path}/login/sendcodebyemail.do`,
	        type: "POST",
	        data: { email: email },
	        success: function (response) {
	            if (response.success) {
	                errorElement.textContent = "인증번호가 발송되었습니다. 이메일을 확인하세요.";
	                errorElement.style.color = "white";
	                
	                checkNumInput.disabled = false;
	                verifyButton.disabled = false;
	            } else {
	                errorElement.textContent = response.message || "인증번호 발송에 실패했습니다. 다시 시도하세요.";
	                errorElement.style.color = "red";

	                checkNumInput.disabled = true;
	                verifyButton.disabled = true;
	            }
	        },
	        error: function () {
	            errorElement.textContent = "서버 요청 중 문제가 발생했습니다. 다시 시도해주세요.";
	            errorElement.style.color = "red";
	            
                checkNumInput.disabled = true;
                verifyButton.disabled = true;
	        }
	    });
	}
	
	const verifyCode = () => {
	    const email = document.querySelector('input[name="email"]').value;
	    const checkNum = document.querySelector('input[name="checkNum"]').value;
	    const errorElement = document.querySelector('.checkNum-input .error');
	    const nextBtn = document.querySelector('button[type="submit"]');

	    if (!checkNum) {
	        errorElement.textContent = "인증번호를 입력해주세요.";
	        errorElement.style.color = "red";
	        return;
	    }

	    $.ajax({
	        url: `${path}/login/verifycode.do`, // 서버 요청 URL
	        type: "POST",
	        data: { email: email, checkNum: checkNum }, // 전송 데이터
	        success: function (response) {
	            if (response.success) {
	                errorElement.textContent = "인증번호가 확인되었습니다.";
	                errorElement.style.color = "white";

	                // 다음 단계로 이동
	                nextBtn.disabled = false;
	            } else {
	                errorElement.textContent = response.message || "인증번호가 일치하지 않습니다.";
	                errorElement.style.color = "red";
	            }
	        },
	        error: function () {
	            errorElement.textContent = "서버 요청 중 문제가 발생했습니다. 다시 시도해주세요.";
	            errorElement.style.color = "red";
	        }
	    });
	};
	</script>
</body>
</html>