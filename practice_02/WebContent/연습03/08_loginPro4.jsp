<%@page import="practice_02.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	 <%
	 	request.setCharacterEncoding("utf-8");
	 	
	 	String id = request.getParameter("id");
	 	String passwd = request.getParameter("passwd");
	 	
	 	boolean isValidMember = MemberDAO.getInstance().login(id,passwd);
	 	
	 	if(isValidMember) {
	 		session.setAttribute("id", id);
	 		session.setMaxInactiveInterval(60 * 10);
	 		response.sendRedirect("00_main4.jsp");
	 	}
	 	else{
	%>
		<script>
			alert("check your id or password");
			history.go(-1);
		</script>
	<% 		
	 	}
	 %>
</body>
</html>