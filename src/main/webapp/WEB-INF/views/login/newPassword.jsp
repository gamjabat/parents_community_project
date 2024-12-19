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
      	<div class="newpassword-input">
      		<input type="password" placeholder="새 비밀번호 입력">
      		<div class="checkPw-input">
		      	<input type="password" placeholder="새 비밀번호 재입력">
		        <div class="error">비밀번호를 다시 확인해주세요.</div>
      		</div>
      		<div class="page-btns">
	      		<button onclick="loginPage();">로그인</button>
      		</div>
      	</div>
      </div>
    </div>
  </div>
  <script>
  const loginPage = () =>{
		location.assign("${path }/login/loginpage.do");
	};
  </script>
</body>
</html>