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
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.min.js"></script>
<title>회원가입</title>
</head>
<body>
	<div class="container">
		<div class="left-panel"></div>
		<div class="right-panel">
			<input type="text" id="userId" placeholder="ID"> <input
				type="password" id="userPwd" placeholder="PASSWORD"> <span
				id="inputEmptyCheck"></span>
			<div class="text-right small-text">
				<a href="#">ID찾기</a> <a href="${path }/login/findpassword.do">비밀번호
					찾기</a> <a href="${path }/login/signup.do">회원가입</a>
			</div>
			<button id="loginBtn">LOGIN</button>
		</div>
	</div>
	<script>
		$("#loginBtn").on("click",e=>{
			
		    const userId = $("#userId").val();
		    const userPwd =$("#userPwd").val();
		    
			
			if(userId==''|| userPwd==''){
				$("#inputEmptyCheck").text('아이디/비밀번호를 입력하세요');
				$("#inputEmptyCheck").css('color','red');
				
			}else{
				location.assign("${path}/login/loginCheck.do?userId="+userId+"&userPwd"+userPwd);			
			}
		});
  </script>
</body>
</html>