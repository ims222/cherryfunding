package com.cherryfunding.spring.vo;

import java.sql.Date;

public class VolunteerVo {
	private int vNum;
	private String id;
	private String content;
	private Date date;
	private String title;
	private int size;
	private Date regdate;
	private String category;
	private String place;
	private int hit;
	public VolunteerVo() {}
	public VolunteerVo(int vNum, String id, String content, Date date, String title, int size, Date regdate,
			String category, String place, int hit) {
		super();
		this.vNum = vNum;
		this.id = id;
		this.content = content;
		this.date = date;
		this.title = title;
		this.size = size;
		this.regdate = regdate;
		this.category = category;
		this.place = place;
		this.hit = hit;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
}
