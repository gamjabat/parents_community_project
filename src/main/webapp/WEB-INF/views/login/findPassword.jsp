<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path }/resources/css/login/login.css">
<link rel="stylesheet" href="${path }/resources/css/login/signUp.css">
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="container">
    <div class="left-panel"></div>
    <div class="right-panel">
      <div class="title" >비밀번호 찾기</div>
      <div class="description">ID 입력<br>입력한 아이디의 비밀번호를 찾습니다.</div>
      <input type="text" placeholder="ID">
      
      <div class="description">본인확인 이메일로 인증<br>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</div>
      <input type="text" placeholder="name">
      <div class="flex-row">
        <input type="email" placeholder="email">
        <button>인증번호 받기</button>
      </div>
      
      <input type="text" placeholder="인증번호 6자리 숫자 입력">
      <!-- <div class="description" style="color: #ff9999;">인증번호를 확인해주세요.</div> -->
      
      <div class="flex-row">
        <button onclick="window.location.href='login.html'">이전</button>
        <button>다음</button>
      </div>
    </div>

  </div>
</body>
</html>