<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete 회원탈퇴</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		Connection conn = null; // 데이터 베이스 연결 객체 생성
		PreparedStatement pstmt = null; // 쿼리문 실행 객체 생성
		
		ResultSet rs = null; // select문의 결과를 저장하는 객체 생성
		
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
			
			rs = pstmt.executeQuery();  // executeQuery(); : selct 실행 메서드
			
			if(rs.next()) {
				pstmt = conn.prepareStatement("delete from member where id=?");
				pstmt.setString(1, request.getParameter("id"));
				pstmt.executeUpdate();
	%>
			<script>
				alert("회원탈퇴가 완료되었습니다.")
				location.href="00_main3.jsp";
			</script>
	<%
			}
			else{
	%>
			<script>
				alert("아이디와 비밀번호를 다시 확인하세요!")
				history.go(-1); // 이전 페이지로 이동
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