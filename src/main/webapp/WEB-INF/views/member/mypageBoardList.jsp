<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
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
	            	<li class="active-sidebar"><a href="${path}/member/mypageboardlist.do">나의 게시글</a></li>
	            	<li><a href="${path}/member/mypagecomment.do">나의 댓글</a></li>
	            	<li><a href="${path}/member/mypagelike.do">나의 좋아요</a></li>
		     	</ul>
		 </div>
		 
    	 <div class="mypage-content">
     		<h2>나의 게시글</h2>
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
		       		 	<c:if test="${not empty myBoards }">
		       		 		<c:forEach var="b" items="${myBoards }" varStatus="idx">
				     		 	 <tr>
						            <td>${idx.index + 1}</td>
						            <td><a href="${path}/board/boarddetail.do?boardNo=${b.boardNo}">${b.title}</a></td>
						            <td>${b.memberNo }</td>
						            <td>${fn:substring(b.createdAt, 0, 10)}</td>
						            <td>${b.likeCount }</td>
						            <td>${b.viewCount }</td>
				       			 </tr>
		       		 		</c:forEach>
		       		 	</c:if>
		       		 	<c:if test="${empty myBoards }">
		       		 		<tr>
		       		 			<td colspan="6" class="no-content">작성하신 게시물이 없습니다.</td>
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