package com.cherryfunding.spring.vo;

import java.sql.Date;

public class RewardVo {
	private int rNum;
	private int fNum;
	private String title;
	private int price;
	private Date regdate; 
	private int amount;

	public RewardVo() {
	}

	public RewardVo(int rNum, int fNum, String title, int price, Date regdate, int amount) {
		this.rNum = rNum;
		this.fNum = fNum;
		this.title = title;
		this.price = price;
		this.regdate = regdate;
		this.amount = amount;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getfNum() {
		return fNum;
	}

	public void setfNum(int fNum) {
		this.fNum = fNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

}
