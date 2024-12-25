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
			        <li><a href="${path}/member/mypagepwcheck.do">나의 정보 수정</a></li>
	            	<li><a href="${path}/member/mypageboardlist.do">나의 게시글</a></li>
	            	<li><a href="${path}/member/mypagecomment.do">나의 댓글</a></li>
	            	<li><a href="${path}/member/mypagelike.do">나의 좋아요</a></li>
		     	</ul>
		 </div>
		 
    	 <div class="mypage-content">
     		<h2>나의 게시물</h2>
     		 <div class="board-content">
	     		 <table class="board-table" width="100%">
		     		  <thead>
		     		 	 <tr class="board-col">
				            <th scope="col">No</th>
				            <th scope="col">제목</th>
				            <th scope="col">작성자</th>
				            <th scope="col">작성일</th>
				            <th scope="col">좋아요</th>
				            <th scope="col">조회수</th>
		       			 </tr>
		       		 </thead>
		       		 <tbody>
		     		 	 <tr>
				            <td>1</td>
				            <td>프로젝트 기간 너무 빡빡한거 아니에요 ?</td>
				            <td>감자</td>
				            <td>2024-12-18</td>
				            <td>2</td>
				            <td>3</td>
		       			 </tr>
		       			 <tr>
				            <td>2</td>
				            <td>포기하고 싶어질 때 보는 글....</td>
				            <td>감자</td>
				            <td>2024-12-18</td>
				            <td>2</td>
				            <td>3</td>
		       			 </tr>
		       			 <tr>
				            <td>3</td>
				            <td>나는 가끔 눈물을 흘린다....</td>
				            <td>감자</td>
				            <td>2024-12-18</td>
				            <td>242955</td>
				            <td>3904494</td>
		       			 </tr>
		       		 </tbody>
	     		 </table>
     		 </div>
     	</div>
	</div>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>