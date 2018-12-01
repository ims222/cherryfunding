package com.cherryfunding.spring.vo;

import java.sql.Date;

public class PaymentVo {
	private int pNum;
	private String id;
	private int amount;
	private Date payDate;
	private String method; 

	public PaymentVo() {
	}

	public PaymentVo(int pNum, String id, int amount, Date payDate, String method) {
		this.pNum = pNum;
		this.id = id;
		this.amount = amount;
		this.payDate = payDate;
		this.method = method;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

}
