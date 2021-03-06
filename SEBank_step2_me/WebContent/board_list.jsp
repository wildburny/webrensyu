<%@page import="sebank.vo.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Lobster&subset=latin,latin-ext"
	rel="stylesheet" type="text/css">
<title>게시판은 게시판</title>
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
	text-align: right;
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
	text-decoration: none;
}

a:HOVER{
	text-decoration: underline;
}

a:VISITED {
	color: black;
}
</style>
</head>
<body>
	<div id="div_header">
		<h1>[게시판]</h1>
	</div>
	<br>
	<div id="div_middle">
		<%
			int ipage = (int) request.getAttribute("page");
			String isOver = (String) request.getAttribute("isOver");
		%>
		<%
			if (session.getAttribute("custid") != null) {
		%>
		<a href="BoardServlet?action=writeForm"><span style="margin-right: 40px; font-size: large;">글쓰기</span></a>
		<%
			}
		%>
		<table>
			<tr>
				<td>번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>조회수</td>
				<td>작성일</td>
			</tr>
			<%
				List<Board> list = (List<Board>) request.getAttribute("list");
				if (list != null) {
					for (Board b : list) {
			%>
			<tr>
				<td><%=b.getBoardnum()%></td>
				<td><a href="BoardServlet?action=read&boardNum=<%=b.getBoardnum()%>"><%=b.getTitle()%></a></td>
				<td><%=b.getId()%></td>
				<td><%=b.getHits()%></td>
				<td><%=b.getInputdate()%></td>
				<%
						}
					}
				%>
			
		</table>

		<br> <br>
		<%
			if ((ipage - 1) == 0 && isOver.equals("false")) {
		%>
		<a href="BoardServlet?action=list&page=<%=ipage + 1%>">다음 페이지</a>&nbsp;
		<a href="index.jsp">홈으로</a>
		<%
			} else if ((ipage - 1) != 0 && isOver.equals("false")) {
		%>
		<a href="BoardServlet?action=list&page=<%=ipage - 1%>">이전 페이지</a>&nbsp;
		<a href="BoardServlet?action=list&page=<%=ipage + 1%>">다음 페이지</a>&nbsp;
		<a href="index.jsp">홈으로</a>
		<%
			} else if ((ipage - 1) != 0 && isOver.equals("true")) {
		%>
		<a href="BoardServlet?action=list&page=<%=ipage - 1%>">이전 페이지</a>&nbsp;
		<a href="index.jsp">홈으로</a>
		<%
			} else {
		%>
		<a href="index.jsp">홈으로</a>
		<%
			}
		%>
	</div>
	<div id="div_bot">기본적인 매너는 지킵시다.</div>
</body>
</html>