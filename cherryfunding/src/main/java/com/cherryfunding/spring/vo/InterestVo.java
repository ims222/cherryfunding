package com.cherryfunding.spring.vo;

public class InterestVo {
	private int iNum;
	private String id;
	private String group;
	private String category;

	public InterestVo() {
	}

	public InterestVo(int iNum, String id, String group, String category) {
		this.iNum = iNum;
		this.id = id;
		this.group = group;
		this.category = category;
	}

	public int getiNum() {
		return iNum;
	}

	public void setiNum(int iNum) {
		this.iNum = iNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
