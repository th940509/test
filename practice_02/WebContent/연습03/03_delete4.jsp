<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id"); // 세션적용
	%>
 	<h2> Delete Member '<%=id %>' </h2>
 	<form method="post" action="04_deletePro4.jsp">
 		<fieldset>
	 		<p>
	 			<label for="id">Id: </label>
	 			<input type="text" value="<%=id %>" id="id" name="id" readonly>
	 		</p>
	 		<p>
	 			<label for="pwd">Password: </label>
	 			<input type="password" id="pwd" name="pwd">
	 		</p>
	 		<input type="submit" value="leave">
 		</fieldset>
 	</form>
</body>
</html>