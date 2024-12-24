<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
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
		<svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="#5A8B63" class="bi bi-person-fill-check" viewBox="0 0 16 16">
		  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m1.679-4.493-1.335 2.226a.75.75 0 0 1-1.174.144l-.774-.773a.5.5 0 0 1 .708-.708l.547.548 1.17-1.951a.5.5 0 1 1 .858.514M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
		  <path d="M2 13c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4"/>
		</svg>
		<div class="login-message">아이디 찾기가 완료되었습니다.</div>
    </div>
    <div class="right-panel">
      <div class="title" >아이디 찾기</div>
      <div class="input-container">
      	<div class="description">입력하신 사용자 정보와 일치하는 아이디 정보입니다.</div>
      	<div class="id-info-container">
      		<div>아이디 : ${findIdMember.memberId }</div>
      		<div>가입일 : ${fn:substring(findIdMember.createdAt, 0, 10)}</div>
      	</div>
      	<div class="page-btns">
	      		<button id="loginPageBtn">로그인</button>
	      		<button id="findPasswordBtn">비밀번호 찾기</button>
      	</div>
      </div>
    </div>
  </div>
  <script>
	  $("#loginPageBtn").on("click",e=>{
			location.assign("${path}/login/loginpage.do");		
		});
	  
	  $("#findPasswordBtn").on("click",e=>{
			location.assign("${path}/login/findpassword.do");		
		});
  </script>
</body>
</html>