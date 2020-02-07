package web.jsp1213.test;

public class SignupFormVO implements java.io.Serializable {

	private String id;
	private String pw;
//	private String Name;
	private String gender;
	private String email;
	private String job;
//	private String nothing;
	private String bio;
	
	public SignupFormVO() {}
	
	public String getId() {return id;}
	public String getPw() {return pw;}
//	public String getName() {return Name;}
	public String getGender() {return gender;}
	public String getEmail() {return email;}
	public String getJob() {return job;}
//	private String getNothing() {return nothing;}
	public String getBio() {return bio;}
	
	public void setId(String id) {this.id=id;}
	public void setPw(String pw) {this.pw=pw;}
//	public void setName(String Name) {this.Name=Name;}
	public void setGender(String gender) {this.gender=gender;}
	public void setEmail(String email) {this.email=email;}
	public void setJob(String job) {this.job=job;}
//	private void setNothing() {this.nothing=nothing;}
	public void setBio(String bio) {this.bio=bio;}
}


