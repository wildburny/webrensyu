<%@page import="sebank.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext"
	rel="stylesheet" type="text/css">
<title>글읽기는 글읽기</title>
<style>
body {
	background-color: #588c7e;
}

#div_header {
	font-size: 30px;
	color: white;
	font-family: 'Lobster';
	background-color: #d96459;
	margin-top: 0;
	padding: 20px 20px 20px 40px;
}

#div_middle {
	background-color: #f2e394;
	padding: 20px 20px 20px 40px;
	overflow-x: auto;
}

#div_bot {
	text-align: center;
	padding: 2%;
	color: white;
	font-size: 50px;
	font-weight: bolder;
	color: white;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	font-weight: bolder;
	text-align: left;
	padding: 8px;
	text-align: left;
}

#tdtd {
	width: 200px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

a {
	font-weight: bolder;
}

a:VISITED {
	color: black;
}

textarea {
	font-weight: bolder;
	font-size: large;
}
</style>
</head>
<body>
	<%
		Board b = (Board) request.getAttribute("board");
	%>
	<div id="div_header">
		<h1>[게시판 글 읽기]</h1>
	</div>
	<br>
	<div id="div_middle">
		<table>
			<tr>
				<td id="tdtd">번호</td>
				<td><%=b.getBoardnum()%></td>
			</tr>
			<tr>
				<td id="tdtd">작성자</td>
				<td><%=b.getId()%></td>
			</tr>
			<tr>
				<td id="tdtd">작성일</td>
				<td><%=b.getInputdate()%></td>
			</tr>
			<tr>
				<td id="tdtd">조회수</td>
				<td><%=b.getHits()%></td>
			</tr>
			<tr>
				<td id="tdtd">제목</td>
				<td><%=b.getTitle()%></td>
			</tr>
			<tr>
				<td id="tdtd">내용</td>
				<td><textarea rows="20" cols="50" readonly="readonly"><%=b.getContent()%></textarea>
				</td>
			</tr>
		</table>
		<br> <span style="margin-left: 150px; margin-right: 150px;">
			<a href="BoardServlet?action=list">목록보기</a>&nbsp;&nbsp;<a href="#">수정</a>&nbsp;&nbsp;<a href="#">삭제</a>
		</span> <br>
		<br>
			<form action="BoardServlet?action=reply">
				<input type="text" name="reply" size="50">&nbsp;&nbsp;
				<input type="submit" value="리플달기">
			</form>
	</div>
	<div id="div_bot">읽어보자!</div>
</body>
</html>