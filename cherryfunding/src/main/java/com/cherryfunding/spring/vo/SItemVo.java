package com.cherryfunding.spring.vo;

public class SItemVo {
	private int siNum;
	private int sNum;
	private String title;
	private int amount;
	public SItemVo() {}
	public SItemVo(int siNum, int sNum, String title, int amount) {
		super();
		this.siNum = siNum;
		this.sNum = sNum;
		this.title = title;
		this.amount = amount;
	}
	public int getSiNum() {
		return siNum;
	}
	public void setSiNum(int siNum) {
		this.siNum = siNum;
	}
	public int getsNum() {
		return sNum;
	}
	public void setsNum(int sNum) {
		this.sNum = sNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
