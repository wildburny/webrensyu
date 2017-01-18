<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext"
	rel="stylesheet" type="text/css">
<title>타이틀은타이틀</title>
<style>
#div_header {
	font-family: 'Lobster';
	background-color: #ff9400;
	margin-top: 0;
	padding: 20px 20px 20px 40px;
}

#div_middle {
	background-color: #f2f2f2;
}

ul {
	color: #ff9400;
	font-weight: bolder;
}

a:VISITED {
	color: #ff9400;
}
</style>
</head>
<body>
	<div id="div_header">
		<h1>[SES Bank Step 2 (Model 2)]</h1>
	</div>
	<div id="div_middle">
		<ul>
			<li><a href="CustomerServlet?action=join_form">회원가입</a></li>
			<br>
			<li><a href="CustomerServlet?action=login_form">로그인</a></li>
			<br>
			<li><a href="CustomerServlet?action=logout">로그아웃</a></li>
			<br>
			<li><a href="CustomerServlet?action=update_form">개인정보수정</a></li>
			<br>
			<li><a href="#">게시판</a></li>
		</ul>
	</div>


</body>
</html>