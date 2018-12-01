package com.cherryfunding.spring.vo;

import java.sql.Date;

public class ECommentVo {
	private int ecNum; 
	private int eNum;
	private String id; 
	private String content;
	private Date regdate;   
	public ECommentVo() {} 
	public ECommentVo(int ecNum, int eNum, String id, String content, Date regdate) {
		super();
		this.ecNum = ecNum;
		this.eNum = eNum;
		this.id = id;
		this.content = content;
		this.regdate = regdate;
	}
	public int getEcNum() {
		return ecNum;
	}
	public void setEcNum(int ecNum) {
		this.ecNum = ecNum;
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
