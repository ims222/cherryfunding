package com.cherryfunding.spring.vo;

import java.sql.Date;

public class CCommentVo {
	 private int ccNum;
	 private String id; 
	 private int cNum;
	 private String content;
	 private Date regdate;
	 public CCommentVo() {}
	 public CCommentVo(int ccNum, String id, int cNum, String content, Date regdate) {
		 super();
		 this.ccNum = ccNum;
		 this.id = id;
		 this.cNum = cNum;
		 this.content = content;
		 this.regdate = regdate;
	 }
	public int getCcNum() {
		return ccNum;
	}
	public void setCcNum(int ccNum) {
		this.ccNum = ccNum;
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
