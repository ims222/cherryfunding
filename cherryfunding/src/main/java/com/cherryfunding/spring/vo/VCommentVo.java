package com.cherryfunding.spring.vo;

import java.sql.Date;

public class VCommentVo {
	private int vcNum; 
	private int vNum;
	private String id; 
	private String content;
	private Date regdate;   
	public VCommentVo() {}
	public VCommentVo(int vcNum, int vNum, String id, String content, Date regdate) {
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
