<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${path}/resources/css/member/mypageReportDetail.css">

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
            <li class="active-sidebar"><a href="${path}/member/mypagereport.do">나의 신고내역</a></li>
        </ul>
    </div>

    <div class="mypage-content">
        <h2>나의 신고 상세 내역</h2>
        <div class="report-content">
            <div>
                <span>신고 사유 :</span> ${report.reportReasonType}
            </div>
            <div>
                <span>신고 내용 :</span> ${report.reportContent}
            </div>
            <div>
                <span>신고일 :</span> ${fn:substring(report.createdAt, 0, 19)}
            </div>
            <div>
                <span>작성자 :</span> ${report.writerNickname == null ? '익명' : report.writerNickname}
            </div>
            <div>
                <span>신고 상태 :</span> ${report.reportStatus}
            </div>
            <c:if test="${report.reportStatus eq '신고처리완료'}">
                <div>
                    <span>처리 결과 :</span> ${report.reportResult}
                </div>
            </c:if>
            <c:choose>
                <c:when test="${report.boardIsDeleted eq 'Y' || report.commentBoardIsDeleted eq 'Y'}">
                    <div class="report-warning">해당 게시물은 삭제되어 이동할 수 없습니다.</div>
                </c:when>
                <c:otherwise>
                    <div class="page-btn">
                        <button type="button">
                            해당 게시물로 이동
                        </button>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
	
    



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>