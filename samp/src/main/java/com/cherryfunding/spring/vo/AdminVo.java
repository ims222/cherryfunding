package com.cherryfunding.spring.vo;

import java.sql.Date;

public class AdminVo {
	
	private String aid;
	private String pwd;
	private String nick;
	private Date regDate;
	
	public AdminVo() {}
	



	public AdminVo(String aid, String pwd, String nick, Date regDate) {
		super();
		this.aid = aid;
		this.pwd = pwd;
		this.nick = nick;
		this.regDate = regDate;
	}

	
	

	public String getAid() {
		return aid;
	}



	public void setAid(String aid) {
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



	public Date getRegDate() {
		return regDate;
	}



	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	
	


	@Override
	public String toString() {
		return "AdminVo [aid=" + aid + ", pwd=" + pwd + ", nick=" + nick + ", regDate=" + regDate + "]";
	}
	
	

}
