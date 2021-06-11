<%@page import="practice_02.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("pwd");
		
		boolean isLeave = MemberDAO.getInstance().leaveMember(id, passwd);
		
		if(isLeave) {
			session.invalidate(); //세션삭제
			
	%>
			<script>
				alert("your account has been deleted successfully");
				location.href="00_main4.jsp";
			</script>
	<%
		}
		else {
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