package com.cherryfunding.spring.vo;

import java.sql.Date;

import org.hibernate.validator.constraints.Email;

public class UsersVo {
	private String id;
	private String pwd;
	@Email(message = "이메일 형식이 아닙니다")
	private String email;
	private String nick;
	private String addr;
	private String gender;
	private String phone;
	private Date birth;
	private Date regdate;
	private int balance;

	public UsersVo() {
	}

	public UsersVo(String id, String pwd, String email, String nick, String addr, String gender, String phone,
			Date birth, Date regdate, int balance) {
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.nick = nick;
		this.addr = addr;
		this.gender = gender;
		this.phone = phone;
		this.birth = birth;
		this.regdate = regdate;
		this.balance = balance;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

}
