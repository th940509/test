package practice_02;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.protocol.Resultset;

public class MemberDAO { // 데이터 접근 객체
	
	// singleton 패턴 만들기
	private MemberDAO() {}
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Connection getConnection() {
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
	
	// join DAO
	public boolean insertMember(MemberDTO mbto) {
		boolean isFirstMember = false;
		
		try { 
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from member where id=?");
			pstmt.setString(1, mbto.getId());
			rs = pstmt.executeQuery();
			
			if (!rs.next()) {
				pstmt = conn.prepareStatement("insert into member value(?,?,?,now())");
				pstmt.setString(1, mbto.getId());
				pstmt.setString(2, mbto.getPasswd());
				pstmt.setString(3, mbto.getName());
				pstmt.executeUpdate();
				isFirstMember = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)    try {rs.close();}    catch (SQLException e) {e.printStackTrace();}  
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null)  try {conn.close();}  catch (SQLException e) {e.printStackTrace();}
		}
		return isFirstMember;
	}
		
	//login DAO
	public boolean login(String id, String pwd) {
		
		boolean isValidMember = false;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from member where id=? and passwd=?");
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				isValidMember = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)    try {rs.close();}    catch (SQLException e) {e.printStackTrace();}  
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null)  try {conn.close();}  catch (SQLException e) {e.printStackTrace();}
		}
		return isValidMember;
	}

	//delete DAO
	public boolean leaveMember(String id, String pwd) {
		
		boolean isLeaveMember = false;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from member where id=? and passwd=?");
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pstmt = conn.prepareStatement("delete form member whrere id=?");
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				isLeaveMember = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null)    try {rs.close();}    catch (SQLException e) {e.printStackTrace();}  
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null)  try {conn.close();}  catch (SQLException e) {e.printStackTrace();}
		}
		return isLeaveMember;
	}
	

}
