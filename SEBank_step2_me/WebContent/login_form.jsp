<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext"
	rel="stylesheet" type="text/css">
<style type="text/css">
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
<script type="text/javascript">
	function check_login() {
		var custid = document.getElementById("custid").value;
		if (custid.length < 3 || custid.length > 10) {
			alert("아이디를 확인해주세요!");
			return false;
		}
		var password = document.getElementById("password").value;
		if (password.length < 3 || password.length > 10) {
			alert("패스워드를 확인해주세요!");
			return false;
		}
		return true;
	}
	
	function login_msg(){
		var msg = ${custid} + '님 환영합니다!';
		alert(msg);
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인은 로그인</title>
</head>
<body>
	<div id="div_header">
		<h1>[ 로그인 ]</h1>
	</div>
	<br>
	<div id="div_middle">
		<form action="CustomerServlet" method="post"
			onsubmit="return check_login();">
			<input type="hidden" name="action" value="login">
			<table>
				<tbody>
					<tr height="50">
						<td>고객 ID</td>
						<td><input type="text" name="custid" id="custid"
							placeholder="ID 입력"></td>
					</tr>
					<tr height="50">
						<td>비밀번호</td>
						<td><input type="password" name="password" id="password"
							placeholder="비밀번호 입력"></td>
					</tr>
					<tr height="50">
						<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
							type="submit" value="로그인"> <input type="button"
							value="돌아가기" onclick="history.go(-1);">
						</td>
					</tr>

				</tbody>
			</table>
		</form>
	</div>
	<%
		if (request.getMethod().equalsIgnoreCase("GET"))
			return;
	%>

	<%
		String custid = (String) session.getAttribute("custid");
		if (custid.length() != 0) {
	%>
	<h1>${custid }</h1>
	<script>
	 	login_msg();
	 	window.close();
		opener.location.reload();
	</script>
	<%
		}
	%>
</body>
</html>