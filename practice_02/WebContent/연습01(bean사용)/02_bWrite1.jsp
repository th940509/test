<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_bWrite</title>
</head>
<body>
	<form method="post" action="03_bWrtiePro1.jsp">
		<h2>게시글 쓰기</h2>
		<table style="width:700px" border="1">
			<colgroup> <!-- td에 적용(열에 적용) -->
				<col width="20%"> <!-- 모든행의 1열에 적용 -->
				<col width="80%"> <!-- 모든행의 2열에 적용 -->
			</colgroup>
		<tr>
			<td>작성자</td>
			<td><input type="text" id="wrtier" name="writer"/></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" id="subject" name="subject"/></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="email" id="eamil" name="email"/></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="password" name="password"/></td>
		</tr>
		<tr>
			<td align="center">글내용</td>
			<td><textarea rows="10" cols="50" id="content" name="content"></textarea></td>
		</tr>
		</table>
		<p>
		<input type="submit" value="글쓰기"/>
		<input type="button" onclick="location.href='04_bList.jsp'" value="전체게시글보기">
		</p>
	</form>
</body>
</html>