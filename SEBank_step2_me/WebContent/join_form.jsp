<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원가입은 회원가입</title>
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
	<div id="div1">
		<h1 style="text-align: center">[회원가입]</h1>
		<div id="div2">
		<form action="" onsubmit="return check_form();">
			<table align="center">
				<tr>
					<td>고객ID</td>
					<td><input type="text" name="id" placeholder="ID는 3~10자"> <input type="button" value="중복확인"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password" placeholder="비밀번호는 3~10자"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="password_two" placeholder="비밀번호 한 번 더!"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder="오나마에와?"></td>
				</tr>
				<tr>
					<td>E-mail</td>
					<td><input type="text" name="email" placeholder="메-루아도레수와?"></td>
				</tr>
				<tr>
					<td>회원구분</td>
					<td><input type="radio" name="division" value="personal" checked="checked"> 개인
						<input type="radio" name="division" value="company"> 법인
					</td>
				</tr>
				<tr>
					<td>식별번호</td>
					<td><input type="text" name="idno" placeholder="개인:주민번호 / 법인:사업자번호"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address" placeholder="쥬쇼와난데스까?"></td>
				</tr>
				<tr>
					<td></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="가입"> <input type="reset" value="다시 쓰기"></td>
				</tr>
			</table>
		</form>
		</div>
	</div>
</body>
</html>