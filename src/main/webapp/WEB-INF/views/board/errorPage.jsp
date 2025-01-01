<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오류 발생</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; padding: 50px; }
        h1 { color: red; }
        p { margin: 20px 0; }
        a { text-decoration: none; color: blue; }
    </style>
</head>
<body>
    <h1>오류 발생</h1>
    <h1>게시글 삭제는 본인만 가능합니다!</h1>
    <p>${errorMsg}</p>
    <a href="${pageContext.request.contextPath}/board.do">게시판으로 돌아가기</a>
</body>
</html>
