<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSTLの使い方</title>
</head>
<body>
	<c:set var="n" value="100" />
	n = ${n }
	<br>

	<c:remove var="n" />
	n = ${n }
	<br>

	<c:if test="${str == '문자열' }">
	str의 값은 '문자열'이다.
	<br>
	</c:if>

	<c:if test="${number > 0 }">
	num의 값은 0보다 크다.
	<br>
	</c:if>

	<c:choose>
		<c:when test="${number == 1 }">
		number의 값은 1이다.<br>
		</c:when>
		<c:when test="${number == 2 }">
		number의 값은 2이다.<br>
		</c:when>
		<c:otherwise>
		number의 값은 뭘까.<br>
		</c:otherwise>
	</c:choose>

	<c:forEach var="cnt" begin="1" end="5">
	반복 ${cnt } <br>
	</c:forEach>

	<c:forEach var="i" begin="0" end="${strlist.size() - 1 }">
	${strlist.get(i) } <br>
	</c:forEach>

	<c:forEach var="i" begin="0" end="${strlist.size() - 1 }">
	${strlist[i] } <br>
	</c:forEach>

	<c:forEach var="value" items="${strlist }">
	${value } <br>
	</c:forEach>
	<br>

	<c:forTokens var="token" items="${phone }" delims="-">
	${token }<br>
	</c:forTokens>

	EL로 출력 : ${data }
	<br>
	<c:out value="${data }" />
	<br>

	<fmt:formatDate value="${date }" type="date" />
	<br>
	<fmt:formatDate value="${date }" type="time" />
	<br>
	<fmt:formatDate value="${date }" type="both" />
	<br>
	<fmt:formatDate value="${date }" type="date" pattern="yyyy년 MM월 dd일 E요일" />
	<br>
	<fmt:formatDate value="${date }" type="time" pattern="hh시 mm분 ss초" />
	<br>
	<fmt:formatNumber value="${num1 }" pattern="#,###.00" />
	<br>
	<fmt:formatNumber value="${num2 }" pattern="#,###.00" />
	<br>
	<fmt:formatNumber value="${num3 }" pattern="0.0%" />
	<br> 원본 문자열 : ${str2 }
	<br> subString : ${fn:substring(str2,2,5) }
	<br> toUpperCase : ${fn:toUpperCase(str2) }
	<br> toLowerCase : ${fn:toLowerCase(str2) }
	<br> length : ${fn:length(str2) }
	<br> split : <br>
	<c:set var="ar" value="${fn:split(str2,' ') }" />
	<c:forEach var="item" items="${ar }">
		${item }<br>
	</c:forEach>
</body>
</html>