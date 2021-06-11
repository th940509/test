<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate(); // 세션 모두 지우기
	%>
		<script>
			alert("you are logged out!")
			location.href="00_main4.jsp";
		</script>
</body>
</html>