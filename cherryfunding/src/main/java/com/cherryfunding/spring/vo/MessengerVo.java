package com.cherryfunding.spring.vo;

import java.sql.Date;

public class MessengerVo {
	private int mNum;
	private String aId;
	private String content;
	private String check;
	private Date senddate;

	public MessengerVo() {
	}

	public MessengerVo(int mNum, String aId, String content, String check, Date senddate) {
		this.mNum = mNum;
		this.aId = aId;
		this.content = content;
		this.check = check;
		this.senddate = senddate;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	public Date getSenddate() {
		return senddate;
	}

	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}

}
