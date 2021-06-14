<%@page import="연습03.MemberDTO"%>
<%@page import="연습03.MemberDAO"%>
<%@page import="sun.security.jca.GetInstance"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinpro</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
	
		boolean isFirstMember = MemberDAO.getInstance().insertMember(new MemberDTO(id,pwd,name));
	
		if(isFirstMember) {
	%>
			<script>
				alert("your are sign up!");
				location.href = "00_main4.jsp";
			</script>		
	<%
		} 
		else{
	%>
			<script>
				alert("try other id");
				history.go(-1);
			</script>
	<%	
		}
	%>
</body>
</html>