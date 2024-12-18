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
<title>아이디 찾기</title>
</head>
<body>
	<div class="container">
    <div class="left-panel">
		<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="#5A8B63" class="bi bi-person-bounding-box" viewBox="0 0 16 16">
		  <path d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5M.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5m15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5"/>
		  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
		</svg>
		<div class="login-message">아이디를 잊으셨나요?</div>
    </div>
    <div class="right-panel">
      <div class="title" >아이디 찾기</div>
      <div class="email-auth-container">
      	<div class="sub-title">본인확인 이메일로 인증</div>
      	<div class="description">본인확인 이메일 주소와 입력한 이메일 주소가 같아야,<br> 인증번호를 받을 수 있습니다.</div>
      	<form class="email-auth-input" action="${path }/login/findidsuccess.do">
      		<input type="text" placeholder="name">
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