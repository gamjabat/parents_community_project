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
		<div class="login-message">새 비밀번호를 설정해주세요!</div>
    </div>
    <div class="right-panel">
      <div class="title" >새 비밀번호 설정하기</div>
      <div class="input-container">
      	<div class="sub-title">새 비밀번호를 입력해주세요</div>
      	<div class="description">최소 8자 이상,<br> 특수문자(!@#$%^&*) 중 1개 이상 포함,<br>대문자, 소문자, 숫자를 각각 1개 이상 포함해주세요</div>
      	<form class="newpassword-input" method="post" action="${path }/login/newpasswordend.do" onsubmit="return fn_invalidate();">
      		<div class="checkPw-input">
	      		<input type="password" id="password" name="password" placeholder="새 비밀번호 입력">
	      		<div class="error"></div>
      		</div>
      		<div class="checkPw-input">
		      	<input type="password" id="confirm-password" placeholder="새 비밀번호 재입력">
		        <div class="error"></div>
      		</div>
      		<div class="page-btns">
	      		<button type="submit">비밀번호 변경</button>
      		</div>
      	</form>
      </div>
    </div>
  </div>
  <script>
  	/* 실시간 유효성 검사 */
  	const passwordInput = document.getElementById('password');
	const confirmPasswordInput = document.getElementById('confirm-password');
	const passwordError = passwordInput.nextElementSibling;
	const confirmPasswordError = confirmPasswordInput.nextElementSibling;
	
	function validatePassword() {
		  const passwordValue = passwordInput.value.trim();
		  const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$/; // 최소 8자, 특수문자, 대소문자, 숫자 포함
		  if (!passwordRegex.test(passwordValue)) {
		    passwordError.textContent = '비밀번호는 8자리 이상, 대소문자, 숫자, 특수문자(!@#$%^&*)를 각각 포함해야 합니다.';
		    return false;
		  }
		  passwordError.textContent = '';
		  return true;
		}

	function validateConfirmPassword() {
		  if (passwordInput.value.trim() !== confirmPasswordInput.value.trim()) {
		    confirmPasswordError.textContent = '비밀번호가 일치하지 않습니다.';
		    return false;
		  }
		  confirmPasswordError.textContent = '비밀번호가 일치합니다.';
		  confirmPasswordError.style.color = 'white';
		  return true;
		}
	
	passwordInput.addEventListener('input', validatePassword);
	confirmPasswordInput.addEventListener('input', validateConfirmPassword);
	
	
	const fn_invalidate=()=>{
		if (passwordInput.value.trim() === "") {
            alert("비밀번호를 입력해주세요.");
            passwordInput.focus();
            return false;
        }
        if (confirmPasswordInput.value.trim() === "") {
            alert("비밀번호 확인을 입력해주세요.");
            confirmPasswordInput.focus();
            return false;
        }
        if (passwordInput.value.trim() !== confirmPasswordInput.value.trim()) {
            alert("비밀번호가 일치하지 않습니다.");
            confirmPasswordInput.focus();
            return false;
        }
		
		return true;
	};
  </script>
</body>
</html>