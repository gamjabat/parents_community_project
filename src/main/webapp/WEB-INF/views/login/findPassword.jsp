<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path }/resources/css/login/login.css">
<link rel="stylesheet" href="${path }/resources/css/login/findPassword.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.min.js"></script>
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="container">
    <div class="left-panel">
    	<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="#5A8B63" class="bi bi-question-circle" viewBox="0 0 16 16">
		  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
		  <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286m1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94"/>
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
		        <button>발송</button>
      		</div>
      		<div class="checkNum-input">
		      	<input type="text" name="checkNum" placeholder="인증번호 6자리 숫자 입력">
		        <div class="error">인증번호를 다시 확인해주세요.</div>
      		</div>
      		<div class="page-btns">
	      		<button id="backBtn" type="button">이전</button>
	      		<button type="submit">다음</button>
      		</div>
      	</form>
      </div>
    </div>
  </div>
  <script>
	  $("#backBtn").on("click",e=>{
			location.assign("${path}/login/loginpage.do");		
		});
  </script>
</body>
</html>