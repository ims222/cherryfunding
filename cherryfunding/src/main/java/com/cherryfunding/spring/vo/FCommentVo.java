package com.cherryfunding.spring.vo;

public class FCommentVo {
	private int fcNum;
	private String id;
	private int fNum;
	private String content;
	private String regdate;

	public FCommentVo() {
	}

	public FCommentVo(int fcNum, String id, int fNum, String content, String regdate) {
		super();
		this.fcNum = fcNum;
		this.id = id;
		this.fNum = fNum;
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

	public int getfNum() {
		return fNum;
	}

	public void setfNum(int fNum) {
		this.fNum = fNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
