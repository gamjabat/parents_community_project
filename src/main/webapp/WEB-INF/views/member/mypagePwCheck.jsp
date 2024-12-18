<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${path}/resources/css/member/mypagePwCheck.css">
<section id="main-container">

<div class="mypage-container">
    <div class="mypage-sidebar">
    <ul>
    	<li class="mypage-texttitle">마이 페이지</li>
    </ul>
        <ul>
            <li><a href="${path}/member/mypageinfoupdate.do">나의 정보 수정</a></li>
            <li><a href="${path}/member/mypageboardlist.do">나의 게시글</a></li>
            <li><a href="${path}/member/mypagecomment.do">나의 댓글</a></li>
            <li><a href="${path}/member/mypagelike.do">나의 좋아요</a></li>
        </ul>
    </div>
	
	 <div class="mypage-content">
	        <h2>나의 정보 수정</h2>
		        <div class="mypage-form">
		        <h3>비밀번호 재확인</h3>
		        <p>회원 정보를 안전하게 보호하기 위해 회원 비밀번호를 다시 확인합니다.</p>
		            <form action="${path}/member/mypageinfoupdate.do" method="post">
		           <label class="idlabel">
		           		아이디<input type="text" class="myId" value="useruser1" readonly/>
		           </label>
		           <label class="pwlabel">
		           		비밀번호<input type="password" class="myPw" placeholder="비밀번호 입력" required />
		           </label>
		           <div class="bt">
		           <button type="submit" >확인</button>
		           </div>
		           </form>
    		</div>
</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>