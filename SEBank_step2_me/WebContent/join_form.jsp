<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext"
	rel="stylesheet" type="text/css">
<script type="text/javascript">
	function check_id() {
		window.open("check_id.jsp", null, "width=300, height=380, left=300, location=no, resizable=no");
	}

	function check_form() {
		var custid = document.getElementById("custid").value;
		if (custid.length < 3 || custid.length > 10) {
			alert("아이디는 3~10자 입니다!");
			return false;
		}
		var password = document.getElementById("password").value;
		if (password.length < 3 || password.length > 10) {
			alert("패스워드는 3~10자 입니다!");
			return false;
		}
		var password_two = document.getElementById("password_two").value;
		if (password_two.length < 3 || password_two.length > 10) {
			alert("패스워드는 3~10자 입니다!");
			return false;
		}

		if (password != password_two) {
			alert("비밀번호가 일치하지 않습니다!");
			return false;
		}

		var name = document.getElementById("name").value;
		if (name.length < 3 || name.length > 10) {
			alert("이름을 확인해주세요!");
			return false;
		}
		var email = document.getElementById("email").value;
		if (email.length < 3) {
			alert("이메일 주소를 확인해주세요!");
			return false;
		}
		var idno = document.getElementById("idno").value;
		if (idno.length < 3) {
			alert("식별번호를 확인해주세요!");
			return false;
		}
		var address = document.getElementById("address").value;
		if (address.length < 3) {
			alert("주소를 확인해주세요!");
			return false;
		}
		return true;
	}
</script>
<title>회원가입은 회원가입</title>
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
		<h1>[회원가입]</h1>
	</div>
	<div id="div_middle">
		<form action="CustomerServlet" method="post"
			onsubmit="return check_form();">
			<input type="hidden" name="action" value="join">
			<table>
				<tr height="50">
					<td>고객ID</td>
					<td><input type="text" name="custid" id="custid"
						readonly="readonly" placeholder="ID는 3~10자"> <input
						type="button" value="중복확인" onclick="check_id();"></td>
				</tr>
				<tr height="50">
					<td>비밀번호</td>
					<td><input type="password" name="password" id="password"
						placeholder="비밀번호는 3~10자"></td>
				</tr>
				<tr height="50">
					<td>비밀번호 확인</td>
					<td><input type="password" name="password_two"
						id="password_two" placeholder="비밀번호 한 번 더!"></td>
				</tr>
				<tr height="50">
					<td>이름</td>
					<td><input type="text" name="name" id="name"
						placeholder="오나마에와?"></td>
				</tr>
				<tr height="50">
					<td>E-mail</td>
					<td><input type="text" name="email" id="email"
						placeholder="메-루아도레수와?"></td>
				</tr>
				<tr height="50">
					<td>회원구분</td>
					<td><input type="radio" name="division" value="personal"
						checked="checked"> 개인 <input type="radio" name="division"
						value="company"> 법인</td>
				</tr>
				<tr height="50">
					<td>식별번호</td>
					<td><input type="text" name="idno" id="idno"
						placeholder="개인:주민번호 / 법인:사업자번호"></td>
				</tr>
				<tr height="50">
					<td>주소</td>
					<td><input type="text" name="address" id="address"
						placeholder="쥬쇼와난데스까?"></td>
				</tr>
				<tr height="50">
					<td colspan="2"><input type="submit" value="가입"> <input
						type="reset" value="다시 쓰기"></td>
				</tr>
			</table>
		</form>
	</div>
	<%
		if (request.getMethod().equalsIgnoreCase("GET"))
			return;
	%>

	<%
		String isNotOK = (String) request.getAttribute("isNotOK");
		if (isNotOK.equals("true")) {
	%>
	<script>alert("회원가입 실패!")</script>
	<%
		} else {
	%>
	<script>alert("회원가입 성공!"); location.href='index.jsp';</script>
	<%
		}
	%>
</body>
</html>