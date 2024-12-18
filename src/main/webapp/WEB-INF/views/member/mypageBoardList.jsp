<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${path}/resources/css/member/mypageBoardList.css">

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
     		<h2>나의 게시물</h2>
     		 <div class="board-content">
     		 <table class="board-table">
     		 	 <tr class="board-colums">
		            <td class="board-no">번호</td>
		            <td class="board-title">제목</td>
		            <td class="board-writer">작성자</td>
		            <td class="board-startwriter">작성일</td>
		            <td class="board-like">좋아요</td>
		            <td class="board-viewcount">조회수</td>
       			 </tr>
     		 </table>
     		 </div>
     	</div>
     	
	</div>
    



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>