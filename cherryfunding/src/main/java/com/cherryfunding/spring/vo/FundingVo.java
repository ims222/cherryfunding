package com.cherryfunding.spring.vo;

import java.sql.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class FundingVo {
	private int fNum;
	@Size(min = 10, max = 100, message = "{min}자에서 {max}자 사이로 입력하세요")
	private String title;
	@NotEmpty(message = "내용을 입력하세요")
	private String content;
	private int amount;
	private int camout;
	private Date sdate;
	private Date edate;
	private String category;
	private String confirm;
	private String aid;
	private String addr;
	private Date regdate;
	@NotEmpty
	private String id;
	private int hit;
	private String savename;
	private String fpinfo;

	public FundingVo() {
	}

	public FundingVo(int fNum, String title, String content, int amount, int camout, Date sdate, Date edate,
			String category, String confirm, String aid, String addr, Date regdate, String id, int hit, String savename,
			String fpinfo) {
		this.fNum = fNum;
		this.title = title;
		this.content = content;
		this.amount = amount;
		this.camout = camout;
		this.sdate = sdate;
		this.edate = edate;
		this.category = category;
		this.confirm = confirm;
		this.aid = aid;
		this.addr = addr;
		this.regdate = regdate;
		this.id = id;
		this.hit = hit;
		this.savename = savename;
		this.fpinfo = fpinfo;
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

	public int getCamout() {
		return camout;
	}

	public void setCamout(int camout) {
		this.camout = camout;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}

	public Date getEdate() {
		return edate;
	}

	public void setEdate(Date edate) {
		this.edate = edate;
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

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getFpinfo() {
		return fpinfo;
	}

	public void setFpinfo(String fpinfo) {
		this.fpinfo = fpinfo;
	}

	@Override
	public String toString() {
		return "FundingVo [fNum=" + fNum + ", title=" + title + ", content=" + content + ", amount=" + amount
				+ ", camout=" + camout + ", sdate=" + sdate + ", edate=" + edate + ", category=" + category
				+ ", confirm=" + confirm + ", aid=" + aid + ", addr=" + addr + ", regdate=" + regdate + ", id=" + id
				+ ", hit=" + hit + ", savename=" + savename + ", fpinfo=" + fpinfo + "]";
	}

}
