package com.cherryfunding.spring.vo;

public class SListVo {
	private int slNum;
	private int sNum;
	private String id;
	private String confirm;
	private String content;
	public SListVo() {}
	public SListVo(int slNum, int sNum, String id, String confirm, String content) {
		super();
		this.slNum = slNum;
		this.sNum = sNum;
		this.id = id;
		this.confirm = confirm;
		this.content = content;
	}
	public int getSlNum() {
		return slNum;
	}
	public void setSlNum(int slNum) {
		this.slNum = slNum;
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
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
