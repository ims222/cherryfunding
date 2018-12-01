package com.cherryfunding.spring.vo;

public class ERecommendVo {
	private int erNum; 
	private int eNum; 
	private String id;
	public ERecommendVo() {}
	public ERecommendVo(int erNum, int eNum, String id) {
		super();
		this.erNum = erNum;
		this.eNum = eNum; 
		this.id = id;
	}
	public int getErNum() {
		return erNum;
	}
	public void setErNum(int erNum) {
		this.erNum = erNum;
	}
	public int geteNum() {
		return eNum;
	}
	public void seteNum(int eNum) {
		this.eNum = eNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
