package com.cherryfunding.spring.vo;

public class AlarmVo {
	private int alarmNum;
	private String cases;
	private String msg;

	public AlarmVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AlarmVo(int alarmNum, String msg) {
		this.alarmNum = alarmNum;
		this.msg = msg;
	}
	public int getAlarmNum() {
		return alarmNum;
	}
	public void setAlarmNum(int alarmNum) {
		this.alarmNum = alarmNum;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getCases() {
		return cases;
	}
	public void setCases(String cases) {
		this.cases = cases;
	}
	
	
	
}
