<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update 회원정보 수정2</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
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
			
			pstmt = conn.prepareStatement("select * from member where id=? and passwd=?");
			pstmt.setString(1, request.getParameter("id"));
			pstmt.setString(2, request.getParameter("passwd"));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pstmt = conn.prepareStatement("update member set name=? where id=?");
				pstmt.setString(1, request.getParameter("name"));
				pstmt.setString(2, request.getParameter("id"));
				pstmt.executeUpdate();
				
	%>
				<script>
					alert("회원정보 수정이 완료 되었습니다.");
					location.href="00_main3.jsp";
				</script>
	<%
			} else {
	%>
				<script>
					alert("아이디와 비밀번호를 다시 확이해주세요!");
					history.go(-1);
				</script>
	<%
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			rs.close();
			pstmt.close();
			conn.close();
		}
	%>
</body>
</html>