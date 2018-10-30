package com.cherryfunding.spring.vo;

import java.sql.Date;

public class SCommentVo {
	private int scNum;
	private String id;
	private String content;
	private Date regdate;
	private int sNum;

	public SCommentVo() {
	}

	public SCommentVo(int scNum, String id, String content, Date regdate, int sNum) {
		this.scNum = scNum;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
		this.sNum = sNum;
	}

	public int getScNum() {
		return scNum;
	}

	public void setScNum(int scNum) {
		this.scNum = scNum;
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

	public int getsNum() {
		return sNum;
	}

	public void setsNum(int sNum) {
		this.sNum = sNum;
	}

}
