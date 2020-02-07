package web.jsp1218.model;

public class Bean implements java.io.Serializable{ // implements java.io.Serializable 다형성 때문에 해주는데 안해줘도 된다 Serializable 을 부모로 사용할때만 붙여줘도 된다

	//변수
	private String id;
	private String pw;
	private String name;
	private int age;
	//기본생성자
	public Bean() {}
		
	//getter
	public String getId() {return id;}
	public String getPw() {return pw;}
	public String getName() {return name;}
	public int getAge() {return age;}
	
		
	//setter
	public void setId(String id) {this.id=id;}
	public void setPw(String pw) {this.pw=pw;}
	public void setName(String name) {this.name=name;}
	public void setAge(int age ) {this.age=age;}

	



	
}
