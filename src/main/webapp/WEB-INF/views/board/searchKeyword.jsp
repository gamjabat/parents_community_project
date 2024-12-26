<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${path}/resources/css/board/board.css">

<div class="board-header">
    <div class="board-category">
        <h5>"${keyword }"로 검색한 총 ${boardCount }개의 결과입니다.</h2>
    </div>
    
    <c:if test="${sessionScope.loginMember!=null }">
    <a href="${path}/boardwrite.do" class="write-btn">글쓰기</a>
    </c:if>    
    <c:if test="${sessionScope.loginMember == null}">
    <p class="info-message">로그인 상태에서만 게시글을 작성할 수 있습니다.</p>
	</c:if>
    
  
</div>



<div class="board-container">
    <table class="board-table">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>좋아요</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="board" items="${board}">
                <tr>
                    <td>${board.boardNo}</td>
			        <td><a href="${path}/board/boarddetail.do?boardNo=${board.boardNo}">[${board.categoryName}]  ${board.title}</a></td>
			        <td>${board.writerNickname!=null?board.writerNickname:'익명' }</td>		      
			        <td><fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			        <td>${board.likeCount}</td>
			        <td>${board.viewCount}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
 

 
<div id="pageBar">
	        	${pageBar }
	        	</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
