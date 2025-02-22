package mybatis;

import org.springframework.stereotype.Component;

// 클래스 객체 연결
@Component
public class Member {

	private String id;
	private String password;
	
	public Member() {
	}

	public Member(String id, String password) {
		this.id = id;
		this.password = password;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + "]";
	}

}
