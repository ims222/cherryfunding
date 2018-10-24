package com.cherryfunding.spring.vo;

import java.sql.Date;

public class EPictureVo {
	private int epNum;
	private int eNum;
	private String saveName;
	private String orgName;
	private String fileSize;
	private Date regdate;
	public EPictureVo() {}
	public EPictureVo(int epNum, int eNum, String saveName, String orgName, String fileSize, Date regdate) {
		super();
		this.epNum = epNum;
		this.eNum = eNum;
		this.saveName = saveName;
		this.orgName = orgName;
		this.fileSize = fileSize;
		this.regdate = regdate;
	}
	public int getEpNum() {
		return epNum;
	}
	public void setEpNum(int epNum) {
		this.epNum = epNum;
	}
	public int geteNum() {
		return eNum;
	}
	public void seteNum(int eNum) {
		this.eNum = eNum;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
