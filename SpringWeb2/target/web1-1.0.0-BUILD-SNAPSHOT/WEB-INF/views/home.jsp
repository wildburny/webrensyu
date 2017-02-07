<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<h1>Hello world!</h1>

<P>The time on the server is ${serverTime}.</P>

<ol>
    <li><a href="res">마자용</a></li>
    <li><a href="jstl1">JSTLの使い方について確認しましょう！</a>
</ol>

<ol>
    <li><a href="param1?str=abcd&num=100">param1 사용</a></li>
    <li><a href="param2">param2 사용</a></li>
    <li><a href="param3">param3 사용</a></li>
</ol>
<ol>
    <li><a href="sessionTest">세션테스트</a></li>
    <li><a href="sessionTest2">세션테스트2</a></li>
    <li><a href="step1">세션어노테이션</a></li>
</ol>
<ol>
    <li><a href="cookie1">쿠키 값 저장</a></li>
    <li><a href="cookie2">쿠키 값 삭제</a></li>
    <li><a href="cookie3">모든 쿠키 읽기</a></li>
    <li><a href="cookie4">특정 쿠키 값 읽기</a></li>
</ol>

<p>${sessionScope.value1 }</p>

<c:if test="${sessionScope.id == null }">
    <form action="login" method="post">
        아이디 : <input type="text" name="id"> <br>
        비밀번호 : <input type="password" name="pw"> <br>
        <input type="submit" value="로그인">
    </form>
</c:if>

<c:if test="${sessionScope.id != null }">
    <h1>${sessionScope.id }님환영합니다.</h1>
    <a href="logout">로그아웃</a>
</c:if>

</body>
</html>
