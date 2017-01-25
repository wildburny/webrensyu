<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext"
	rel="stylesheet" type="text/css">
<title>글 수정은 글 수정</title>
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

tr:nth-child(even) {
	background-color: #f2f2f2
}

a {
	font-weight: bolder;
}

a:VISITED {
	color: black;
}
</style>
</head>
<body>
	<div id="div_header">
		<h1>[글 수정]</h1>
	</div>
	<br>
	<div id="div_middle">
		<form action="BoardServlet" method="post">
			<input type="hidden" name="action" value="update">
			<input type="hidden" name="boardNum" value="${board.boardnum }">
			<table>
				<tr>
					<td>ID</td>
					<td>${board.id }</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" value="${board.title }"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="20" cols="50" name="content">${board.content }</textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정하기"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="div_bot">
		손가락 움직이기 전에<br>한 번 더 생각하고 움직이긔
	</div>
</body>
</html>