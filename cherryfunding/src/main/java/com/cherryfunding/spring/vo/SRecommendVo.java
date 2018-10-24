package com.cherryfunding.spring.vo;

public class SRecommendVo {
    private int srNum;
    private int sNum;
    private String id;
    public SRecommendVo() {}
	public SRecommendVo(int srNum, int sNum, String id) {
		super();
		this.srNum = srNum;
		this.sNum = sNum;
		this.id = id;
	}
	public int getSrNum() {
		return srNum;
	}
	public void setSrNum(int srNum) {
		this.srNum = srNum;
	}
	public int getsNum() {
		return sNum;
	}
	public void setsNum(int sNum) {
		this.sNum = sNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
    
}
