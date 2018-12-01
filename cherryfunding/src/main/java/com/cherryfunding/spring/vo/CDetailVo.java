package com.cherryfunding.spring.vo;

import java.sql.Date;

public class CDetailVo {
	private int cdNum;
	private String id;
	private int cNum;
	private int amount;
	private String content;
	private Date regdate;

	public CDetailVo() { 
	}

	public CDetailVo(int cdNum, String id, int cNum, int amount, String content, Date regdate) {
		super();
		this.cdNum = cdNum;
		this.id = id;
		this.cNum = cNum;
		this.amount = amount;
		this.content = content;
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "CDetailVo [cdNum=" + cdNum + ", id=" + id + ", cNum=" + cNum + ", amount=" + amount + ", content="
				+ content + ", regdate=" + regdate + "]";
	}

	public int getCdNum() {
		return cdNum;
	}

	public void setCdNum(int cdNum) {
		this.cdNum = cdNum;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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
