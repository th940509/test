<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>
	<h2>join form</h2>
	<form method="post" action="02_insertPro4.jsp">
		<fieldset>
				<p>
					<label for ="id">ID: </label>
					<input type="text" id="id" name="id" autofocus>
				</p>
				<p>
					<label for ="pwd">Password: </label>
					<input type="password" id="pwd" name="pwd">
				</p>
				<p>
					<label for ="confirmPwd">ConfirmPwd Password: </label>
					<input type="password" id="confirmPwd" name="confirmPwd">
				</p>
				<p>
					<label for ="name">Name: </label>
					<input type="text" id="name" name="name">
				</p>
				<input type="submit" value="join">
				<input type="reset" value="reset">
		</fieldset>
	</form>
</body>
</html>