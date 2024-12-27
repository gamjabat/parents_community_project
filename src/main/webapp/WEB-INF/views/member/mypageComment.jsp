<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${path}/resources/css/member/mypageComment.css">

	<div class="mypage-container">
	    <div class="mypage-sidebar">
		    <ul>
		    	<li class="mypage-texttitle">마이 페이지</li>
		    </ul>
	        	<ul>
			        <li><a href="${path}/member/mypagepwcheck.do">나의 정보 수정</a></li>
	            	<li><a href="${path}/member/mypageboardlist.do">나의 게시글</a></li>
	            	<li class="active-sidebar"><a href="${path}/member/mypagecomment.do">나의 댓글</a></li>
	            	<li><a href="${path}/member/mypagelike.do">나의 좋아요</a></li>
	            	<li><a href="${path}/member/mypagereport.do">나의 신고내역</a></li>
		     	</ul>
		 </div>
    	 
    	 <div class="mypage-content">
     		<h2>나의 댓글</h2>
     		 <div class="comment-content">
     		 		<table class="comment-table" width="100%">
		     		  <thead>
		     		 	 <tr class="comment-col">
				            <th scope="col">No</th>
				            <th scope="col">게시글 제목</th>
				            <th scope="col">댓글 내용</th>
				            <th scope="col">작성일</th>
				            <th scope="col">좋아요</th>
		       			 </tr>
		       		 </thead>
		       		 <tbody>
		       		 	<c:if test="${not empty myComments }">
		       		 		<c:forEach var="c" items="${myComments }" varStatus="idx">
				     		 	 <tr>
						            <td>${idx.index + 1}</td>
						            <td><a href="${path}/board/boarddetail.do?boardNo=${c.BOARDNO}">${c.BOARDTITLE}</a></td>
						            <td><a href="${path}/board/boarddetail.do?boardNo=${c.BOARDNO}">${c.COMMENTCONTENT}</a></td>
						            <td>${fn:substring(c.COMMENTCREATEDAT, 0, 19)}</td>
						            <td>${c.COMMENTLIKECOUNT }</td>
				       			 </tr>
		       		 		</c:forEach>
		       		 	</c:if>
		       		 	<c:if test="${empty myComments }">
		       		 		<tr>
		       		 			<td colspan="6" class="no-content">작성하신 댓글이 없습니다.</td>
		       		 		</tr>
		       		 	</c:if>
		       		 </tbody>
	     		 </table>
     		 </div>
     		 <div id="pageBar">
	        	${pageBar }
	         </div>
     	</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>