package com.cherryfunding.spring.vo;

import java.sql.Date;

public class CharityVo {
	private int cNum;
	private String id;
	private String title; 
	private String content;    
	private int amount;
	private int cAmount;
	private Date sDate;
	private Date eDate;
	private String category;
	private String confirm;
	private String aId; 
	private String addr;
	private Date regdate; 
	private int hit;
	private String savename;
	private String cpinfo;
	
	public CharityVo() {}
	public CharityVo(int cNum, String id, String title, String content, int amount, int cAmount, Date sDate, Date eDate,
			String category, String confirm, String aId, String addr, Date regdate, int hit, String savename, String cpinfo) {
		super();
		this.cNum = cNum;
		this.id = id;
		this.title = title;
		this.content = content;
		this.amount = amount;
		this.cAmount = cAmount;
		this.sDate = sDate;
		this.eDate = eDate;
		this.category = category;
		this.confirm = confirm;
		this.aId = aId;
		this.addr = addr;
		this.regdate = regdate;
		this.hit = hit;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getcAmount() {
		return cAmount;
	}
	public void setcAmount(int cAmount) {
		this.cAmount = cAmount;
	}
	public Date getsDate() {
		return sDate;
	}
	public void setsDate(Date sDate) {
		this.sDate = sDate;
	}
	public Date geteDate() {
		return eDate;
	}
	public void seteDate(Date eDate) {
		this.eDate = eDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getaId() {
		return aId;
	}
	public void setaId(String aId) {
		this.aId = aId;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getCpinfo() {
		return cpinfo;
	}
	public void setCpinfo(String cpinfo) {
		this.cpinfo = cpinfo;
	}
}
