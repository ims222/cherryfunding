package com.cherryfunding.spring.vo;

import java.sql.Date;

public class RewardVo {
	private int rnum;
	private int fnum;
	private String title;
	private int price;
	private Date regdate;

	public RewardVo() {
	}

	public RewardVo(int rnum, int fnum, String title, int price, Date regdate) {
		this.rnum = rnum;
		this.fnum = fnum;
		this.title = title;
		this.price = price;
		this.regdate = regdate;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getFnum() {
		return fnum;
	}

	public void setFnum(int fnum) {
		this.fnum = fnum;
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

}
