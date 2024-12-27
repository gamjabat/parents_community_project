<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${path}/resources/css/member/mypageLike.css">

	<div class="mypage-container">
	    <div class="mypage-sidebar">
		    <ul>
		    	<li class="mypage-texttitle">마이 페이지</li>
		    </ul>
	        	<ul>
			        <li><a href="${path}/member/mypagepwcheck.do">나의 정보 수정</a></li>
	            	<li><a href="${path}/member/mypageboardlist.do">나의 게시글</a></li>
	            	<li><a href="${path}/member/mypagecomment.do">나의 댓글</a></li>
	            	<li class="active-sidebar"><a href="${path}/member/mypagelike.do">나의 좋아요</a></li>
		     	</ul>
		 </div>
    	 <div class="mypage-content">
     		<h2>나의 좋아요</h2>
     		 <div class="like-content">
     		 		<table class="like-table" width="100%">
		     		  <thead>
		     		 	 <tr class="like-col">
				            <th scope="col">No</th>
				            <th scope="col">구분</th>
				            <th scope="col">내용</th>
				            <th scope="col">작성일</th>
				            <th scope="col">좋아요</th>
				            <th scope="col">조회수</th>
		       			 </tr>
		       		 </thead>
		       		 <tbody>
			       		 <c:if test="${not empty myLikes }">
			       		 		<c:forEach var="l" items="${myLikes }" varStatus="idx">
					     		 	 <tr>
							            <td>${idx.index + 1}</td>
							            <c:if test="${l.boardNo!=null }">
								            <td>게시글</td>
							            	<td><a href="${path}/board/boarddetail.do?boardNo=${l.boardNo}">${l.boardTitle}</a></td>
							            </c:if>
							            <c:if test="${l.boardNo==null }">
								            <td>댓글</td>
							            	<td><a href="${path}/board/boarddetail.do?boardNo=${l.commentBoardNo}">${l.commentContent}</a></td>
							            </c:if>
							            <td>${fn:substring(l.createdAt, 0, 19)}</td>
							            <td>${l.likeCount }</td>
							            <td>${l.viewCount==null?'':l.viewCount }</td>
					       			 </tr>
			       		 		</c:forEach>
			       		 	</c:if>
			       		 	<c:if test="${empty myLikes }">
			       		 		<tr>
			       		 			<td colspan="6" class="no-content">좋아요가 없습니다.</td>
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