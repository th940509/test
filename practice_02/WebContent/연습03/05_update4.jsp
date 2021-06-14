<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
	%>
	
	<h2>Modify '<%=id %>'</h2>
	<form method="post" action="06_updatePro4.jsp">
		<fieldset>
			<p>
				<label for="id">id: </label>
				<input type="text" value="<%=id %>" id="id" name="id" readonly>
			</p>
			<p>
				<label for="pwd">password: </label>
				<input type="password" id="pwd" name="pwd">
			</p>
			<p>
				<label for="name">name: </label>
				<input type="text" id="name" name="name">
			</p>
			<input type="submit" value="update">
		</fieldset>
	</form>
</body>
</html>