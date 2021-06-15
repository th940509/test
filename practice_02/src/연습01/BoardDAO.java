package 연습01;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class BoardDAO { // 데이터 접근 객체
	
	// 1. 싱글턴 패턴 만들기 (*암기)
	private BoardDAO() {}
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	Connection conn;              // 데이터 베이스를 연결하기 위한 객체
	PreparedStatement pstmt;      // 쿼리문을 실행하기 위한 객체
	ResultSet rs;                 // select 문의 결과를 담는 객체
	
	public Connection getConnection () { // 메서드 명은 관용적으노 getConnection 사용하며 반환타입은 Connection
		
		try {
				String jdbcUrl = "jdbc:mysql://localhost:3306/login_ex?serverTimezone=UTC";
				String dbId    = "root";
				String dbPass  = "1234";
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				conn = DriverManager.getConnection(jdbcUrl , dbId , dbPass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	

}
