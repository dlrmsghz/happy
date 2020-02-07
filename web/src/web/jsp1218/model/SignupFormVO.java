package web.jsp1218.model;

import java.sql.Timestamp;

public class SignupFormVO{

	private String id;
	private String pw;
	private String name;
	private int age;
	private String gender;
	private String email;
	private String job;
	private String bio;
	private Timestamp reg;
	
	public String getId() {return id;}
	public String getPw() {return pw;}
	public String getName() {return name;}
	public int getAge() {return age;}
	public String getGender() {return gender;}
	public String getEmail() {return email;}
	public String getJob() {return job;}
	public String getBio() {return bio;}
	public Timestamp getReg() {return reg;}
	
	public void setId(String id) {this.id=id;}
	public void setPw(String pw) {this.pw=pw;}
	public void setName(String name) {this.name=name;}
	public void setAge(int age) {this.age=age;}
	public void setGender(String gender) {this.gender=gender;}
	public void setEmail(String email) {this.email=email;}
	public void setJob(String job) {this.job=job;}
	public void setBio(String bio) {this.bio=bio;}
	public void setReg(Timestamp reg) {this.reg=reg;}
}


