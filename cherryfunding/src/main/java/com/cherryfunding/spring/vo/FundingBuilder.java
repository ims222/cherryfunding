package com.cherryfunding.spring.vo;

import java.sql.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class FundingBuilder {

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

	public FundingBuilder setfNum(int fNum) {
		this.fNum = fNum;
		return this;
	}

	public FundingBuilder setTitle(String title) {
		this.title = title;
		return this;
	}

	public FundingBuilder setContent(String content) {
		this.content = content;
		return this;
	}

	public FundingBuilder setAmount(int amount) {
		this.amount = amount;
		return this;
	}

	public FundingBuilder setCamout(int camout) {
		this.camout = camout;
		return this;
	}

	public FundingBuilder setSdate(Date sdate) {
		this.sdate = sdate;
		return this;
	}

	public FundingBuilder setEdate(Date edate) {
		this.edate = edate;
		return this;
	}

	public FundingBuilder setCategory(String category) {
		this.category = category;
		return this;
	}

	public FundingBuilder setConfirm(String confirm) {
		this.confirm = confirm;
		return this;
	}

	public FundingBuilder setAid(String aid) {
		this.aid = aid;
		return this;
	}

	public FundingBuilder setAddr(String addr) {
		this.addr = addr;
		return this;
	}

	public FundingBuilder setRegdate(Date regdate) {
		this.regdate = regdate;
		return this;
	}

	public FundingBuilder setId(String id) {
		this.id = id;
		return this;
	}

	public FundingBuilder setHit(int hit) {
		this.hit = hit;
		return this;
	}

	public FundingBuilder setSavename(String savename) {
		this.savename = savename;
		return this;
	}

	public FundingBuilder setFpinfo(String fpinfo) {
		this.fpinfo = fpinfo;
		return this;
	}

	public FundingVo builder() {
		return new FundingVo(fNum, title, content, amount, camout, sdate, edate, category, confirm, aid, addr, regdate,
				id, hit, savename, fpinfo);
	}

}
