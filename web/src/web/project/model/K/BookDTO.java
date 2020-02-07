package web.project.model.K;

import java.sql.Timestamp;

public class BookDTO {

    private int num;			// 책 고유 번호
    private String name;		// 책 제목
    private String img;			// 책 이미지
    private int price;			// 책 가격
    private String genre;		// 책 장르
    private String writer;		// 책 저자
    private String publisher;	// 책 출판사
    private String content;		// 책 줄거리
    private String regs;		// 책 발행일
    private Timestamp reg;		// 책 등록일
    private int readcount;		// 조회수
	
    
    public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getRegs() {
		return regs;
	}
	public void setRegs(String regs) {
		this.regs = regs;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
    
 
    
    
    
    
}
