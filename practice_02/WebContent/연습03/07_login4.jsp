<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
	<h2>Login</h2>
	<form method="post" action="08_loginPro4.jsp">
		<fieldset>
			<p>
				<label for="id">ID: </label>
				<input type="text" id="id" name="id">
			</p>
			<p>
				<label for="passwd">password: </label>
				<input type="password" id="passwd" name="passwd">
			</p>
				<input type="submit" value="login">
		</fieldset>
	</form>
</body>
</html>