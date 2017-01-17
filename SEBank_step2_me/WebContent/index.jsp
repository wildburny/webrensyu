<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>타이틀은타이틀</title>
<style>
#div1 {
	margin-top: 10%;
	margin-left: 36%;
	margin-right: 36%;
	margin-bottom: 10%;
}

#div2 {
	background-color: honeydew;
	text-align: center;
	border: double;
	width: 100%;
	height: 50%;
}

span {
	font-size: 150%;
	font-weight: bold;
	color: cadetblue;
}

li {
	text-align: left;
}
</style>
</head>
<body>
	<div id="div1">
		<h1 style="text-align: center">웰컴웰컴</h1>
		<div id="div2">
			<br> <span>[SES Bank Step 2 (Model 2)]</span><br> <br>
			<br>
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
	</div>

</body>
</html>