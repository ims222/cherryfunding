package com.cherryfunding.spring.vo;

import java.sql.Date;

public class AdminVo {
	private String aId;
	private String pwd;
	private String nick;
	private Date regdate;

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public AdminVo(String aId, String pwd, String nick, Date regdate) {
		this.aId = aId;
		this.pwd = pwd;
		this.nick = nick;
		this.regdate = regdate;
	}

	public AdminVo() {
	}
}
