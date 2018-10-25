package com.cherryfunding.spring.vo;

import java.sql.Date;

public class CPictureVo {
    private int cpNum;
    private int cNum;
    private String saveName;
    private String orgName;
    private long fileSize;
    private Date regdate;
    private String cpinfo;
    public CPictureVo(){}
	public CPictureVo(int cpNum, int cNum, String saveName, String orgName, long fileSize, Date regdate, String cpinfo) {
		super();
		this.cpNum = cpNum;
		this.cNum = cNum;
		this.saveName = saveName;
		this.fileSize = fileSize;
		this.regdate = regdate;
		this.cpinfo = cpinfo;
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
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getCpinfo() {
		return cpinfo;
	}
	public void setCpinfo(String cpinfo) {
		this.cpinfo = cpinfo;
	}
    
}
