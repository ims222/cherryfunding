package com.cherryfunding.spring.vo;

import java.sql.Date;

public class AdminVo {
	private String aid;
	private String pwd;
	private String nick;
	private Date regdate;

	public String getaid() {
		return aid;
	}

	public void setaid(String aid) {
		this.aid = aid;
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

	public AdminVo(String aid, String pwd, String nick, Date regdate) {
		this.aid = aid;
		this.pwd = pwd;
		this.nick = nick;
		this.regdate = regdate;
	}

	public AdminVo() {
	}
}
