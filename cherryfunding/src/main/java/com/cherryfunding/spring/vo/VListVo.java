package com.cherryfunding.spring.vo;

public class VListVo {
    private int vlNum;
    private int vNum;
    private String id;
    private String content;
    public VListVo() {}
    
	public VListVo(int vNum, String id) {
		super();
		this.vNum = vNum;
		this.id = id;
	}

	public VListVo(int vlNum, int vNum, String id, String content) {
		super();
		this.vlNum = vlNum;
		this.vNum = vNum;
		this.id = id;
		this.content = content;
	}
	public int getVlNum() {
		return vlNum;
	}
	public void setVlNum(int vlNum) {
		this.vlNum = vlNum;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
    
}
