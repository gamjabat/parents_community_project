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
        
        #btn_container{
        	text-align: center;
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
        <p><strong>이름:</strong>${member.memberName}<span id="popup-id"></span></p>
        <p><strong>닉네임:</strong>${member.nickName}<span id="popup-id"></span></p>
        <p><strong>이메일:</strong>${member.email}<span id="popup-id"></span></p>
        <p><strong>연락처:</strong>${member.phone}<span id="popup-id"></span></p>
        <p><strong>주소:</strong>${member.address}<span id="popup-id"></span></p>
        <div id="btn_container">
        	<button onclick="window.close()">닫기</button>
        </div> 
    </main>
    
</body>
</html>
