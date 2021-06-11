<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id"); // 세션
		
		if(id == null) {
	%>
			<h1>JUST DO IT</h1>
			<p><a href="01_insert4.jsp">JOIN!</a></p>
			<p><a href="07_login4.jsp">LOGIN!</a></p>
	<%		
		} 
		else{
	%>
			<h1>welcome <%=id %></h1>
			<p><a href="03_delete4.jsp">DELETE!</a></p>
			<p><a href="05_update4.jsp">UPDATE!</a></p>
			<p><a href="03_logout4.jsp">LOGOUT!</a></p>
			
	<%
			
		}
	%>
</body>
</html>