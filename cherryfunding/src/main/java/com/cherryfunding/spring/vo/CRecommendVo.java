package com.cherryfunding.spring.vo;

public class CRecommendVo {
	private int crNum;
	private int cNum;
	private String id;

	public CRecommendVo() {
	}

	public CRecommendVo(int crNum, int cNum, String id) {
		this.crNum = crNum;
		this.cNum = cNum; 
		this.id = id;
	}

	public int getCrNum() {
		return crNum;
	}

	public void setCrNum(int crNum) {
		this.crNum = crNum;
	}

	public int getcNum() {
		return cNum;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
