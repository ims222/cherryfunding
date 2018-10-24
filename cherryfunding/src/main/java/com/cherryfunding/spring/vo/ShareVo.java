package com.cherryfunding.spring.vo;

import java.sql.Date;

public class ShareVo {
	private int sNum;
	private String id;
	private String content;
	private String category;
	private Date regdate;
	private int hit;
	public ShareVo() {}
	public ShareVo(int sNum, String id, String content, String category, Date regdate, int hit) {
		super();
		this.sNum = sNum;
		this.id = id;
		this.content = content;
		this.category = category;
		this.regdate = regdate;
		this.hit = hit;
	}
	public int getsNum() {
		return sNum;
	}
	public void setsNum(int sNum) {
		this.sNum = sNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
}
