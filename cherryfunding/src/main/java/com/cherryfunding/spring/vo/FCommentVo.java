package com.cherryfunding.spring.vo;

import java.sql.Date;

public class FCommentVo {
	private int fcNum;
	private String id;
	private int fnum;
	private String content;
	private Date regdate;

	public FCommentVo() {
	}

	public FCommentVo(int fcNum, String id, int fnum, String content, Date regdate) {
		super();
		this.fcNum = fcNum;
		this.id = id;
		this.fnum = fnum;
		this.content = content;
		this.regdate = regdate;
	}

	public int getFcNum() {
		return fcNum;
	}

	public void setFcNum(int fcNum) {
		this.fcNum = fcNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getFnum() {
		return fnum;
	}

	public void setFnum(int fnum) {
		this.fnum = fnum;
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
