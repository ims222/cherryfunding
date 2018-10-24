package com.cherryfunding.spring.vo;

import java.sql.Date;

public class SCommentVo {
	private int sNum;
    private String id;
    private String content;
    private Date regdate;
    public SCommentVo() {}
	public SCommentVo(int sNum, String id, String content, Date regdate) {
		super();
		this.sNum = sNum;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
    
}
