<%@page import="sebank.vo.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext"
	rel="stylesheet" type="text/css">
<title>회원정보 수우정</title>
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
	<%
		Customer c = (Customer) request.getAttribute("customer");
		String custid = c.getCustid();
		
	%>

	<div id="div_header">
		<h1>[회원정보 수정]</h1>
	</div>
	<div id="div_middle">
		<form action="CustomerServlet" method="post">
			<input type="hidden" name="action" value="update">
			<table>
				<tr height="50">
					<td>고객ID</td>
					<td><input type="text" name="custid" id="custid"
						readonly="readonly" value="<%=custid %>">
				</tr>
				<tr height="50">
					<td>비밀번호</td>
					<td><input type="password" name="password" id="password"></td>
				</tr>
				<tr height="50">
					<td>비밀번호 확인</td>
					<td><input type="password" name="password_two"
						id="password_two"></td>
				</tr>
				<tr height="50">
					<td>이름</td>
					<td><input type="text" name="name" id="name" value="${customer.name }"></td>
				</tr>
				<tr height="50">
					<td>E-mail</td>
					<td><input type="text" name="email" id="email" value="${customer.email }"></td>
				</tr>
				<tr height="50">
					<td>회원구분</td>
					<td>
					<%
					String division = c.getDivision();
					if(division.equals("personal")){
					%>
					<input type="radio" name="division" value="personal" checked="checked" disabled="disabled"> 개인 
					<input type="radio" name="division"	value="company" disabled="disabled"> 법인
					<%
					} else {
					%>
					<input type="radio" name="division" value="personal" disabled="disabled"> 개인 
					<input type="radio" name="division"	value="company" checked="checked" disabled="disabled"> 법인
					<%
					}
					%>
					</td>
				</tr>
				<tr height="50">
					<td>식별번호</td>
					<td><input type="text" name="idno" id="idno" readonly="readonly" value="${customer.idno }" disabled="disabled"></td>
				</tr>
				<tr height="50">
					<td>주소</td>
					<td><input type="text" name="address" id="address" value="${customer.address }"></td>
				</tr>
				<tr height="50">
					<td colspan="2"><input type="submit" value="정보수정"> 
					<input type="reset" value="다시 쓰기"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>