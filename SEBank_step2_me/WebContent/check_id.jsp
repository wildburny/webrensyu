<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext"
	rel="stylesheet" type="text/css">
<style type="text/css">
#div_header {
	font-family: 'Lobster';
	background-color: #ff9400;
	margin-top: 0;
	padding: 20px 20px 20px 40px;
}

#div_middle {
	background-color: #f2f2f2;
	height: 200px;
}
</style>
<script type="text/javascript">
	function check_id() {
		var id = document.getElementById('id').value;
		var len = id.length;
		console.log(len);
		if (len < 3 || len > 10) {
			alert('아이디는 3~10자 !');
			return false;
		}
		return true;
	}

	function use_this_id(custid) {
		opener.document.getElementById("custid").value = custid;
		window.close();
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>중붥?</title>
</head>
<body>
	<div id="div_header">
		<h1>[ ID 중붥 확인 ]</h1>
	</div>
	<br>
	<div id="div_middle">
		<form action="CustomerServlet" method="post" onsubmit="return check_id();">
		<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="text" name="id" id="id" placeholder="아이디 입력" value="${custid }">
		&nbsp; <input type="submit" value="확인"> <input type="hidden" name="action" value="check_id">
		</form>
		
		<%
			if (request.getMethod().equalsIgnoreCase("GET"))
				return;
		%>

		<%
			String custid = (String) request.getAttribute("custid");
			if (custid != null) {
		%>
		<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${custid }은(는) 사용 가능합니다.</h3>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="사용" onclick='use_this_id("${custid }")'>
		<%
			} else {
		%>
		<h3>사용 불가능한 아이디입니다.</h3>
		<%
			}
		%>
	</div>
</body>
</html>