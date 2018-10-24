package com.cherryfunding.spring.vo;

public class FRecommendVo {
	private int frNum; 
    private int fNum;
    private String id;
    public FRecommendVo() {}
	public FRecommendVo(int frNum, int fNum, String id) {
		super();
		this.frNum = frNum;
		this.fNum = fNum;
		this.id = id;
	}
	public int getFrNum() {
		return frNum;
	}
	public void setFrNum(int frNum) {
		this.frNum = frNum;
	}
	public int getfNum() {
		return fNum;
	}
	public void setfNum(int fNum) {
		this.fNum = fNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
    
}
