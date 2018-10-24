package com.cherryfunding.spring.vo;

public class SPictureVo {
	private int spNum;
	private int sNum;
	private int siNum; 
	private String saveName;
	private String orgName; 
	private String fileSize;
	public SPictureVo() {}
	public SPictureVo(int spNum, int sNum, int siNum, String saveName, String orgName, String fileSize) {
		super();
		this.spNum = spNum;
		this.sNum = sNum;
		this.siNum = siNum;
		this.saveName = saveName;
		this.orgName = orgName;
		this.fileSize = fileSize;
	}
	public int getSpNum() {
		return spNum;
	}
	public void setSpNum(int spNum) {
		this.spNum = spNum;
	}
	public int getsNum() {
		return sNum;
	}
	public void setsNum(int sNum) {
		this.sNum = sNum;
	}
	public int getSiNum() {
		return siNum;
	}
	public void setSiNum(int siNum) {
		this.siNum = siNum;
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
	
}
