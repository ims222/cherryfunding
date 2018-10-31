package com.cherryfunding.spring.vo;

import java.sql.Date;

public class MypageVo {
	private String title;
	private String category;
	private int amount;
	private int price;
	private Date regdate;
	MypageVo(){}

	public MypageVo(String title, String category, int amount, Date regdate) {
		super();
		this.title = title;
		this.category = category;
		this.amount = amount;
		this.regdate = regdate;
	}

	public MypageVo(String title, String category, Date regdate, int price) {
		super();
		this.title = title;
		this.category = category;
		this.regdate = regdate;
		this.price = price;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
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
