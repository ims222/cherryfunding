package com.cherryfunding.spring.vo;

public class FResultVo {
	private int frNum;
	private int fdNum;
	private String state;

	public FResultVo() {
	} 

	public FResultVo(int frNum, int fdNum, String state) {
		this.frNum = frNum;
		this.fdNum = fdNum;
		this.state = state;
	}

	public int getFrNum() {
		return frNum;
	}

	public void setFrNum(int frNum) {
		this.frNum = frNum;
	}

	public int getFdNum() {
		return fdNum;
	}

	public void setFdNum(int fdNum) {
		this.fdNum = fdNum;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
