package com.cherryfunding.spring.vo;

public class VRecommendVo {
    private int vrNum;
    private int vNum;
    private String id;
    public VRecommendVo() {}
	public VRecommendVo(int vrNum, int vNum, String id) {
		super();
		this.vrNum = vrNum;
		this.vNum = vNum;
		this.id = id;
	}
	public int getVrNum() {
		return vrNum;
	}
	public void setVrNum(int vrNum) {
		this.vrNum = vrNum;
	}
	public int getvNum() {
		return vNum;
	}
	public void setvNum(int vNum) {
		this.vNum = vNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
    
}
