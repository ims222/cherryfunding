package com.cherryfunding.spring.vo;

import java.sql.Date;

public class CPictureVo {
    private int cpNum;
    private int cNum;
    private String saveName;
    private String orgName;
    private String fileSize;
    private Date regdate;
    public CPictureVo(){}
	public CPictureVo(int cpNum, int cNum, String saveName, String orgName, String fileSize, Date regdate) {
		super();
		this.cpNum = cpNum;
		this.cNum = cNum;
		this.saveName = saveName;
		this.fileSize = fileSize;
		this.regdate = regdate;
	}
	public int getCpNum() {
		return cpNum;
	}
	public void setCpNum(int cpNum) {
		this.cpNum = cpNum;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
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
