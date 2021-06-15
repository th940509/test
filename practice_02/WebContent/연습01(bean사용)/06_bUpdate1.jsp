<%@page import="연습01.BoardDAO"%>
<%@page import="연습01.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bUpdate</title>
</head>
<body>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO bdto = BoardDAO.getInstance().getOneUpdateBoard(num);
	%>	
	<form method="post" action="07_bUpdatePro.jsp">
		<h1>게시글 수정하기</h1>
		<table border="1">
			<tr>
				<td>작성자</td>
				<td><%=bdto.getWriter() %></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%=bdto.getRegDate() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%=bdto.getSubject() %></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><%=bdto.getPassword() %></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><%=bdto.getContent() %></td>
			</tr>
		</table>
		<p>
			<input type="hidden" name="num" value="<%=bdto.getNum() %>"> <!-- hidden -> 숨겨진 입력 필드이며, 웹페이지에는 보이지 않음 -->
			<input type="submit" value="글수정">
			<input type="button" onclick="location.href='04_bList1.jsp'" value="전체글보기">
		</p>
	</form>

</body>
</html>