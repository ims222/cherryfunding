package com.cherryfunding.spring.vo;

public class FRecommendVo {
	private int frNum;
	private int fnum;
	private String id;

	public FRecommendVo() {
	}

	public FRecommendVo(int frNum, int fnum, String id) {
		super();
		this.frNum = frNum;
		this.fnum = fnum;
		this.id = id;
	}

	public int getFrNum() {
		return frNum;
	}

	public void setFrNum(int frNum) {
		this.frNum = frNum;
	}

	public int getFnum() {
		return fnum;
	}

	public void setFnum(int fnum) {
		this.fnum = fnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
