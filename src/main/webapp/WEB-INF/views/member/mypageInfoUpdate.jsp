<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${path}/resources/css/member/mypageinfoUpdate.css">


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
	    <div class="mypageinfo-content">
	   <h2>나의 정보 수정</h2>
		<div class="memberinfo-container">
			<div class="member-idbox">
				<label class="member-id">아이디</label>
				<label class="member-id">유저아이디</label>
				<button class="member-id-btn">변경</button>
			</div>
			
			<div class="member-namebox">
				<label class="member-name">이름</label>
				<label class="member-name">유저이름</label>
			</div>
			
			<div class="member-pwbox">
				<label class="member-pw">비밀번호</label>
				<button class="member-pw-btn">변경</button>
			</div>
			
			<div class="member-emailbox">
				<label class="member-email">이메일</label>
				<label class="member-email">유저이메일</label>
				<button class="member-email-btn">변경</button>
			</div>
			
			<div class="member-phonebox">
				<label class="member-phone">전화번호</label>
				<label class="member-phone">010-5403-2139</label>
			</div>
			
			<div class="member-addressbox">
				<label class="member-address">주소</label>
				<label class="member-address">인천 부평구 덤벼.</label>
				<button class="member-address-btn">변경</button>
			</div>
			
			<div class="member-btdaybox">
				<label class="member-btday">생일</label>
				<label class="member-btday">0805</label>
			</div>
		</div>
		<button class="member-end-btn">회원 정보 수정</button>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>