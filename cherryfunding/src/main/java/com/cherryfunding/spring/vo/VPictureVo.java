package com.cherryfunding.spring.vo;

import java.sql.Date;

public class VPictureVo {
	private int vpNum;
	private int vNum;
	private String saveName;
	private String orgName;
	private String fileSize;
	private Date regdate;
	private String vpInfo;
	public String getVpInfo() {
		return vpInfo;
	}
	public void setVpInfo(String vpInfo) {
		this.vpInfo = vpInfo;
	}
	public VPictureVo() {}
	public VPictureVo(int vpNum, int vNum, String saveName, String orgName, String fileSize, Date regdate, String vpInfo) {
		super();
		this.vpNum = vpNum;
		this.vNum = vNum;
		this.saveName = saveName;
		this.orgName = orgName;
		this.fileSize = fileSize;
		this.regdate = regdate;
		this.vpInfo = vpInfo;
	}
	public int getVpNum() {
		return vpNum;
	}
	public void setVpNum(int vpNum) {
		this.vpNum = vpNum;
	}
	public int getvNum() {
		return vNum;
	}
	public void setvNum(int vNum) {
		this.vNum = vNum;
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
