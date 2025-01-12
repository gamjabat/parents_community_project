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
    	<c:if test="${categoryName != null }">
        	<div class="btn-category">${categoryName } 게시판</div>
        </c:if>
        <c:if test="${categoryName == null }">
        	<div class="btn-category">${board[0].categoryName } 게시판</div>
        </c:if>
    </div>
    <c:if test="${sessionScope.loginMember!=null }">
    	<a href="${path}/boardwrite.do" class="write-btn">글쓰기</a>
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
			         <td>${board.writerNickname==null?"익명":board.writerNickname}</td>		      
			        <td><fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			        <td>${board.likeCount}</td>
			        <td>${board.viewCount}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>


<div class="pagination">
    <c:out value="${pageBar}" escapeXml="false"/>
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
