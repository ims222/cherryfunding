package com.cherryfunding.spring.vo;

public class SPictureVo {
	private int spNum;
	private int sNum;
	private String saveName;
	private String orgName;
	private long fileSize;
	private String sPinfo;

	public SPictureVo() {
	} 

	public SPictureVo(int spNum, int sNum, String saveName, String orgName, long fileSize, String sPinfo) {
		super();
		this.spNum = spNum;
		this.sNum = sNum;
		this.saveName = saveName;
		this.orgName = orgName;
		this.fileSize = fileSize;
		this.sPinfo = sPinfo;
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

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public String getsPinfo() {
		return sPinfo;
	}

	public void setsPinfo(String sPinfo) {
		this.sPinfo = sPinfo;
	}

}
