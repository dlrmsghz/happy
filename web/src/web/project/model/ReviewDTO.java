package web.project.model;

import java.sql.Timestamp;

public class ReviewDTO {
	private int num;
	private String id;
	private int bk_num;
	private String recontent;
	private String star;
	
	public String getStar1() {
		return star1;
	}
	public void setStar1(String star1) {
		this.star1 = star1;
	}
	public String getStar2() {
		return star2;
	}
	public void setStar2(String star2) {
		this.star2 = star2;
	}
	public String getStar3() {
		return star3;
	}
	public void setStar3(String star3) {
		this.star3 = star3;
	}
	public String getStar4() {
		return star4;
	}
	public void setStar4(String star4) {
		this.star4 = star4;
	}
	public String getStar5() {
		return star5;
	}
	public void setStar5(String star5) {
		this.star5 = star5;
	}
	private String star1;
	private String star2;
	private String star3;
	private String star4;
	private String star5;
	
	
	private int read_recount;
	private Timestamp bk_rereg;
	
	
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBk_num() {
		return bk_num;
	}
	public void setBk_num(int bk_num) {
		this.bk_num = bk_num;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
		//System.out.println(this.star+"reviewDto에서 star");
	}
	public int getRead_recount() {
		return read_recount;
	}
	public void setRead_recount(int read_recount) {
		this.read_recount = read_recount;
	}
	public Timestamp getBk_rereg() {
		return bk_rereg;
	}
	public void setBk_rereg(Timestamp bk_rereg) {
		this.bk_rereg = bk_rereg;
	}
}
