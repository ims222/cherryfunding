package com.cherryfunding.spring.vo;

public class CategoryVo {
	private String group;
	private String category;

	public CategoryVo() {
	}

	public CategoryVo(String group, String category) {
		this.group = group;
		this.category = category;
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
