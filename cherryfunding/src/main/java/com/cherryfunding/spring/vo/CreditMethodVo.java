package com.cherryfunding.spring.vo;

public class CreditMethodVo {
	private int cmNum;
	private String method;

	public CreditMethodVo() {
	}

	public CreditMethodVo(int cmNum, String method) {
		this.cmNum = cmNum;
		this.method = method;
	}

	public int getCmNum() {
		return cmNum;
	}

	public void setCmNum(int cmNum) {
		this.cmNum = cmNum;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

}
