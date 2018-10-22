package com.cherryfunding.spring.vo;

import java.sql.Date;

public class EventVo {
	private int eNum;
	private String name;
	private Date startTime;
	private Date endTime;

	public EventVo() {
	}

	public EventVo(int eNum, String name, Date startTime, Date endTime) {
		this.eNum = eNum;
		this.name = name;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	public int geteNum() {
		return eNum;
	}

	public void seteNum(int eNum) {
		this.eNum = eNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

}
