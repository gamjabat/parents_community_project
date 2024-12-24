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
        <button class="btn-category">전체글</button>
        <button class="btn-category hot">HOT</button>
        <span class="category-depth"></span>
    </div>
    <a href="${path}/boardwrite.do" class="write-btn">글쓰기</a>
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
			        <td><a href="${path}/board/boarddetail.do?boardNo=${board.boardNo}">${board.title}</a></td>
			        <td>${member.memberId}</td>
			        <td><fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			        <td>${board.likeCount}</td>
			        <td>${board.viewCount}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
 

 
<div class="pagination">
    <a href="#" class="page-link">&lt;&lt;</a>
    <a href="#" the class="page-link">&lt;</a>
    <a href="#" class="page-link active">1</a>
    <a href="#" class="page-link">2</a>
    <a href="#" class="page-link">3</a>
    <a href="#" class="page-link">&gt;</a>
    <a href="#" class="page-link">&gt;&gt;</a>
</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
