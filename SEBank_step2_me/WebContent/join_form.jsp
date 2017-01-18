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
		window.open("check_id.jsp", null, "width=300, height=300, left=300, location=no, resizable=no");

	}
</script>
<title>회원가입은 회원가입</title>
<style>
#div_header {
	font-family: 'Lobster';
	background-color: #ff9400;
	margin-top: 0;
	margin-bottom: 15px;
	padding: 20px 20px 20px 40px;
}

#div_middle {
	background-color: #f2f2f2;
	padding-top: 30px;
	padding-bottom: 30px;
}

li {
	text-align: left;
}

td {
	font-weight: bold;
	text-align: left;
}
</style>
</head>
<body>
	<div id="div_header">
		<h1>[회원가입]</h1>
	</div>
	<div id="div_middle">
		<form action="" onsubmit="return check_form();">
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
					<td colspan="2">
					<input type="submit" value="가입"> <input type="reset" value="다시 쓰기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>