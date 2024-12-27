<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${path}/resources/css/member/mypageReport.css">

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
     		<h2>나의 신고내역</h2>
     		 <div class="report-content">
     		 		<table class="report-table" width="100%">
		     		  <thead>
		     		 	 <tr class="report-col">
				            <th scope="col">No</th>
				            <th scope="col">신고 사유</th>
				            <th scope="col">신고일</th>
				            <th scope="col">신고 상태</th>
		       			 </tr>
		       		 </thead>
		       		 <tbody>
			       		 <c:if test="${not empty myReports }">
			       		 		<c:forEach var="r" items="${myReports }" varStatus="idx">
					     		 	 <tr>
							            <td>${idx.index + 1}</td>
							            <td><a href="${path }/member/reportdetail.do?reportNo=${r.REPORTNO }">${r.REPORTREASON }</a></td>
							            <td>${fn:substring(r.REPORTDATE, 0, 19)}</td>
							            <td>${r.STATUSTYPENAME }</td>
					       			 </tr>
			       		 		</c:forEach>
			       		 	</c:if>
			       		 	<c:if test="${empty myReports }">
			       		 		<tr>
			       		 			<td colspan="6" class="no-content">신고내역이 없습니다.</td>
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