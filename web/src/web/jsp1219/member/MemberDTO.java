package web.jsp1219.member;

import java.sql.Timestamp;

public class MemberDTO {


	private String id;
	public String getId() {return id;}
	public void setId(String id) {this.id = id;}

	private String pw;
	public String getPw() {	return pw;	}
	public void setPw(String pw) {this.pw = pw;	}

	private String name;
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	
	private String birth;
	public String getBirth() {return birth;}
	public void setBirth(String birth) {this.birth = birth;}
	
	private String email;
	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}

	private Timestamp reg;
	public Timestamp getReg() {return reg;}
	public void setReg(Timestamp reg) {this.reg = reg;}
}
