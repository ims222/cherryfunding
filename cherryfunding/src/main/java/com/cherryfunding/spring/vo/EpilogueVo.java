package com.cherryfunding.spring.vo;

import java.sql.Date;

public class EpilogueVo {
	private int eNum;
	private String id;
	private int cNum;
	private String title; 
	private String content;
	private Date regdate;
	private int hit;
	public EpilogueVo() {}
	public EpilogueVo(int eNum, String id, int cNum, String title, String content, Date regdate, int hit) {
		super();
		this.eNum = eNum;
		this.id = id;
		this.cNum = cNum;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.hit = hit;
	}
	public int geteNum() {
		return eNum;
	}
	public void seteNum(int eNum) {
		this.eNum = eNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
