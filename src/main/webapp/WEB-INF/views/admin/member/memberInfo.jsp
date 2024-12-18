<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 상세정보</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 2rem;
            background-color: #f9f9f9;
            color: #333;
        }
        .popup-header {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            margin-bottom: 1rem;
        }
        .user-icon {
            width: 50px;
            height: 50px;
            margin-right: 1rem;
        }
        p {
            margin: 0.8rem 0;
        }
        button {
            background-color: #d7c9a6;
            color: white;
            border: none;
            padding: 0.7rem 1.5rem;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #bba78a;
        }
    </style>


</head>
<body>
    <header class="popup-header">
        <h3>사용자 상세 정보</h3>
    </header>
    <main>
        <p><strong>사용자번호:</strong>${member.memberNo}<span id="popup-id"></span></p>
        <p><strong>아이디:</strong>${member.memberId}<span id="popup-id"></span></p>
        <p><strong>이름:</strong>${member.name}<span id="popup-id"></span></p>
        <p><strong>닉네임:</strong>${member.nickName}<span id="popup-id"></span></p>
        <p><strong>이메일:</strong>${member.email}<span id="popup-id"></span></p>
        <p><strong>연락처:</strong>${member.phone}<span id="popup-id"></span></p>
        <p><strong>주소:</strong>${member.address}<span id="popup-id"></span></p>
        <p><strong>생일:</strong>${member.birthday}<span id="popup-id"></span></p>
        <p><strong>가입일:</strong>${member.createDate}<span id="popup-id"></span></p>
        <p><strong>정보수정일:</strong>${member.updateDate}<span id="popup-id"></span></p>
        <%-- <p><strong>탈퇴여부:</strong>${member.isDelete?"탈퇴":"미탈퇴"}<span id="popup-id"></span></p> --%>
        <p><strong>탈퇴일:</strong>${member.deleteDate!=null?member.deleteDate:""}<span id="popup-id"></span></p>
        
        <button onclick="window.close()">닫기</button>
    </main>
    <script>
   /*      // URL에서 데이터 가져오기
        const params = new URLSearchParams(window.location.search);
    
        // 데이터 추출 및 HTML 요소에 삽입
         document.getElementById("popup-id").innerText += params.get("id");
         document.getElementById("popup-name").textContent = params.get("name");
         document.getElementById("popup-email").textContent = params.get("email");
        document.getElementById("popup-join-date").textContent = params.get("joinDate");
         document.getElementById("popup-status").textContent = params.get("status");
         document.getElementById("popup-posts").textContent = params.get("posts");
         document.getElementById("popup-comments").textContent = params.get("comments"); */
    </script>
    
</body>
</html>
