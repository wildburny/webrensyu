<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is ${serverTime}.</P>

	<ol>
		<li><a href="res">마자용</a></li>
		<li><a href= "jstl1">JSTLの使い方について確認しましょう！</a>
	</ol>
	
	<ol>
		<li><a href="param1?str=abcd&num=100">param1 사용</a></li>
	</ol>
</body>
</html>
