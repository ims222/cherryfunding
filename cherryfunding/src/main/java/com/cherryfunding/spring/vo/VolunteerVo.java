package com.cherryfunding.spring.vo;

import java.sql.Date;

public class VolunteerVo {
	private int vNum;
	private String id;
	private String content;
	private Date dDay;
	private String title;
	private int members;
	private Date regdate;
	private String category;
	private String place;
	private int hit;
	private String saveName;
	private String vpInfo;
	private int recommend;

	public VolunteerVo() {
	}

	public VolunteerVo(int vNum, String id, String content, Date dDay, String title, int members, Date regdate,
			String category, String place, int hit, String saveName, String vpInfo, int recommend) {
		super();
		this.vNum = vNum;
		this.id = id;
		this.content = content;
		this.dDay = dDay;
		this.title = title;
		this.members = members;
		this.regdate = regdate;
		this.category = category;
		this.place = place;
		this.hit = hit;
		this.saveName = saveName;
		this.vpInfo = vpInfo;
		this.recommend = recommend;
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

	public Date getdDay() {
		return dDay;
	}

	public void setdDay(Date dDay) {
		this.dDay = dDay;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getMembers() {
		return members;
	}

	public void setMembers(int members) {
		this.members = members;
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

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public String getVpInfo() {
		return vpInfo;
	}

	public void setVpInfo(String vpInfo) {
		this.vpInfo = vpInfo;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	

}
