package practice_02;

import java.util.Date;

public class MemberDTO { // 데이터 전송 객제

	private String id;
	private String passwd;
	private String name;
	private Date joindate;
	
	public MemberDTO(String id, String passwd, String name) {  // 생성자
		super();
		this.id = id;
		this.passwd = passwd;
		this.name = name;
	}

	public String getId() { // private 변수  getter 가져오기
		return id;          // 메뉴 -> source
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}


	
	
	
}
