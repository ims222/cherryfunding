package com.cherryfunding.spring.vo;



public class VCommentVo {
	private int vcNum; 
	private int vNum;
	private String id; 
	private String content;
	private String regdate;   
	public VCommentVo() {}
	public VCommentVo(int vcNum, int vNum, String id, String content, String regdate) {
		super(); 
		this.vcNum = vcNum;
		this.vNum = vNum;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
	}
	public int getVcNum() {
		return vcNum;
	}
	public void setVcNum(int vcNum) {
		this.vcNum = vcNum;
	}
	public int getvNum() {
		return vNum;
	}
	public void setvNum(int vNum) {
		this.vNum = vNum;
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
	
}
