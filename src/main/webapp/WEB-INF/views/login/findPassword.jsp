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
      <div class="email-auth-container">
      	<div class="sub-title">본인확인 이메일로 인증</div>
      	<div class="description">본인확인 이메일 주소와 입력한 이메일 주소가 같아야,<br> 인증번호를 받을 수 있습니다.</div>
      	<form class="email-auth-input">
      		<input type="text" placeholder="id">
      		<div class="email-input">
		      	<input type="email" name="email" placeholder="email">
		        <button>인증번호 발송</button>
      		</div>
      		<div class="checkNum-input">
		      	<input type="text" name="checkNum" placeholder="인증번호 6자리 숫자 입력">
		        <div class="error">인증번호를 다시 확인해주세요.</div>
      		</div>
      		<div class="page-btns">
	      		<button type="button" onclick="history.back()">이전</button>
	      		<button type="submit">다음</button>
      		</div>
      	</form>
      </div>
    </div>
  </div>
</body>
</html>