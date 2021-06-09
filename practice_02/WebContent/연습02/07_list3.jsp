<%@page import="java.text.SimpleDateFormat"%>
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
<title>회원정보 확인</title>
</head>
<body>
	<%
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
		
		pstmt = conn.prepareStatement("selet * from member");
		rs = pstmt.executeQuery();
			
	%>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>PASSWORD</th>
				<th>NAME</th>
				<th>JOINDATE</th>
			</tr>
	<%
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	
		
			while(rs.next()) {
				String id = rs.getString("id");
				String passwd = rs.getString("passwd");
				String name = rs.getString("name");
				String joindate = sdf.format(rs.getTimestamp("jaindate"));
			}
		
	%>	</table>
			
		
		
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