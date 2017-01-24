<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext"
	rel="stylesheet" type="text/css">
<title>타이틀은 타이틀</title>
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
	
}

#div_bot {
	text-align: center;
	padding: 2%;
	color: white;
	font-size: 50px;
	font-weight: bolder;
	color: white;
}

ul {
	font-size: 20px;
	font-weight: bolder;
	color: white;
}

a {
	font-weight: bolder;
	text-decoration: none;
}

a:HOVER{
	text-decoration: underline;
}

a:VISITED {
	color: black;
}

h3 {
	color: #d96459;
}
</style>
</head>
<body>
	<div id="div_header">
		<h1>[SES Bank Step 2 (Model 2)]</h1>
	</div>
	<%
		String custid = (String) session.getAttribute("custid");
	%>
	<br>
	<div id="div_middle">
		<%
			if (custid != null) {
		%>
		<h3>★${custid }님 접속중★</h3>
		<%-- <h3><%= custid %>님 접속중...!</h3> --%>
		<%
			}
		%>
		<ul>
			<%
				if (custid == null) {
			%>
			<li><a href="CustomerServlet?action=join_form">회원가입</a></li>
			<br>
			<li><a href="CustomerServlet?action=login_form">로그인</a></li>
			<%
				} else {
			%>
			<br>
			<li><a href="CustomerServlet?action=logout">로그아웃</a></li>
			<br>
			<li><a href="CustomerServlet?action=update_form">개인정보수정</a></li>
			<br>
			<li><a href="BoardServlet?action=list">게시판</a></li>
			<%
				}
			%>
		</ul>
	</div>
	<div id="div_bot">
		<p>
			가나다라마바사<br>아자차카타파하<br>하파타카차자아<br>사바마라다나가
		</p>
	</div>


</body>
</html>