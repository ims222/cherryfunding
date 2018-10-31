package com.cherryfunding.spring.vo;

import java.sql.Date;

public class FDetailVo {
	private int fdNum;
	private String id;
	private int fNum;
	private int rNum;
	private Date regdate;
	private String state;
	private int amount;

	public FDetailVo() {
	}

	public FDetailVo(int fdNum, String id, int fNum, int rNum, Date regdate, String state, int amount) {
		this.fdNum = fdNum;
		this.id = id;
		this.fNum = fNum;
		this.rNum = rNum;
		this.regdate = regdate;
		this.state = state;
		this.amount = amount;
	}

	public int getFdNum() {
		return fdNum;
	}

	public void setFdNum(int fdNum) {
		this.fdNum = fdNum;
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

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

}
