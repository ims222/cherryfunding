package com.cherryfunding.spring.vo;

import java.sql.Date;

public class FDetailVo {
	private int fdNum;
	private String id;
	private int fNum;
	private int rNum; 
	private Date fDate;
	private Date regdate;   
	private String state;
	public FDetailVo() {}
	public FDetailVo(int fdNum, String id, int fNum, int rNum, Date fDate, Date regdate, String state) {
		super();
		this.fdNum = fdNum;
		this.id = id;
		this.fNum = fNum;
		this.rNum = rNum;
		this.fDate = fDate;
		this.regdate = regdate;
		this.state = state;
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
	public Date getfDate() {
		return fDate;
	}
	public void setfDate(Date fDate) {
		this.fDate = fDate;
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
	
}
