<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${path}/resources/css/board/board.css">


        <!-- 게시판 상단 카테고리 및 글쓰기 버튼 영역 -->
    <div class="board-header">
        <div class="board-category">
            <button class="btn-category">전체글</button>
            <button class="btn-category hot">HOT</button>
            <span class="category-depth">카테고리 div !@@!#!@</span>
        </div>
        <a href="${path}/boardwrite.do" class="write-btn">글쓰기</a>
    </div>

    <!-- 게시판 테이블 영역 -->
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
                <!-- 샘플 게시글 데이터 (작성자 모두 "감자밭") -->
                <tr><td>16</td><td>[잡담] 오늘 날씨 좋네요</td><td>감자밭</td><td>11.25</td><td>3</td><td>15</td></tr>
                <tr><td>15</td><td>[공지] 업데이트 공지</td><td>감자밭</td><td>11.24</td><td>8</td><td>50</td></tr>
                <tr><td>14</td><td>[질문] 질문 있습니다</td><td>감자밭</td><td>11.23</td><td>5</td><td>30</td></tr>
                <tr><td>13</td><td>[정보] 꿀팁 공유</td><td>감자밭</td><td>11.22</td><td>12</td><td>80</td></tr>
                <tr><td>12</td><td>[잡담] 안녕하세요!</td><td>감자밭</td><td>11.21</td><td>15</td><td>100</td></tr>
                <tr><td>11</td><td>[책] 추천 책 소개</td><td>감자밭</td><td>11.20</td><td>4</td><td>25</td></tr>
                <tr><td>10</td><td>[공지] 일정 안내</td><td>감자밭</td><td>11.19</td><td>10</td><td>70</td></tr>
                <tr><td>9</td><td>[질문] 도움 부탁드립니다</td><td>감자밭</td><td>11.18</td><td>6</td><td>40</td></tr>
                <tr><td>8</td><td>[잡담] 좋은 하루 되세요</td><td>감자밭</td><td>11.17</td><td>2</td><td>10</td></tr>
                <tr><td>7</td><td>[정보] 새 소식 공유</td><td>감자밭</td><td>11.16</td><td>9</td><td>60</td></tr>
                <tr><td>6</td><td>[질문] 해결책 궁금합니다</td><td>감자밭</td><td>11.15</td><td>8</td><td>55</td></tr>
                <tr><td>5</td><td>[공지] 이벤트 공지</td><td>감자밭</td><td>11.14</td><td>7</td><td>75</td></tr>
                <tr><td>4</td><td>[잡담] 오랜만이에요</td><td>감자밭</td><td>11.13</td><td>3</td><td>20</td></tr>
                <tr><td>3</td><td>[정보] 팁 나눔</td><td>감자밭</td><td>11.12</td><td>5</td><td>35</td></tr>
                <tr><td>2</td><td>[질문] 의견 부탁드립니다</td><td>감자밭</td><td>11.11</td><td>4</td><td>15</td></tr>
                <tr><td>1</td><td>[공지] 새 업데이트 내용</td><td>감자밭</td><td>11.10</td><td>12</td><td>95</td></tr>
            </tbody>
        </table>
    </div>

    <!-- 페이징바 영역 -->
    <div class="pagination">
        <a href="#" class="page-link">&lt;&lt;</a>
        <a href="#" class="page-link">&lt;</a>
        <a href="#" class="page-link active">1</a>
        <a href="#" class="page-link">2</a>
        <a href="#" class="page-link">3</a>
        <a href="#" class="page-link">&gt;</a>
        <a href="#" class="page-link">&gt;&gt;</a>
    </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

