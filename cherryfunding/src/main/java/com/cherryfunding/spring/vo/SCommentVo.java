package com.cherryfunding.spring.vo;

public class SCommentVo {
	private int scNum;
	private String id;
	private String content;
	private String regdate;
	private int sNum;

	public SCommentVo() {
	}

	public SCommentVo(int scNum, String id, String content, String regdate, int sNum) {
		super();
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getsNum() {
		return sNum;
	}

	public void setsNum(int sNum) {
		this.sNum = sNum;
	}

}
