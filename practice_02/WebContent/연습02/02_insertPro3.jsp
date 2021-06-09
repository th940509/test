<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert 회원가입2</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		//String id = request.getParameter("id");
		//String pwd = request.getParameter("pwd");
		//String name = request.getParameter("name");
		
		Connection conn = null;           //데이터 베이스 연결 객체
		PreparedStatement pstmt = null;   //쿼리문 실행 객체
		
		try{
			// DB 연결 정보 >   "jdbc:mysql://연결DB서버주소:프로토콜번호/DB명/시간동기화"
			String jdbcUrl = "jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC";
			// DB 연결 계정
			String dbId    = "root";
			// DB 연결 비밀번호
			String dbPass  = "1234";
						
			// forName 생성
			Class.forName("com.mysql.cj.jdbc.Driver");
						
			// 데이터 베이스 연동  *import 해야함.
			conn = DriverManager.getConnection(jdbcUrl , dbId , dbPass);
			
			pstmt = conn.prepareStatement("insert into member values(?,?,?,now())");
			pstmt.setString(1, request.getParameter("id"));
			pstmt.setString(2, request.getParameter("passwd"));
			pstmt.setString(3, request.getParameter("name"));
			
			pstmt.executeUpdate();
	%>
			<script>
				alert("회원가입이 완료 되었습니다.");
				location.href="00_main3.jsp";
			</script>
	<%
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			pstmt.close();
			conn.close();
		}
	%>
</body>
</html>