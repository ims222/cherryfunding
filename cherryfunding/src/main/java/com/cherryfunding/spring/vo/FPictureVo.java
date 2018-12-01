package com.cherryfunding.spring.vo;

import java.sql.Date;

public class FPictureVo {
	private int fpNum;
	private int fNum;
	private String savename; 
	private String orgname;
	private long filesize;
	private Date regdate;
	private String fpinfo;

	public FPictureVo() {
	}

	public FPictureVo(int fpNum, int fNum, String savename, String orgname, long filesize, Date regdate,
			String fpinfo) {
		this.fpNum = fpNum;
		this.fNum = fNum;
		this.savename = savename;
		this.orgname = orgname;
		this.filesize = filesize;
		this.regdate = regdate;
		this.fpinfo = fpinfo;
	}

	public int getFpNum() {
		return fpNum;
	}

	public void setFpNum(int fpNum) {
		this.fpNum = fpNum;
	}

	public int getfNum() {
		return fNum;
	}

	public void setfNum(int fNum) {
		this.fNum = fNum;
	}

	public String getSavename() {
		return savename;
	}

	public void setSavename(String savename) {
		this.savename = savename;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getFpinfo() {
		return fpinfo;
	}

	public void setFpinfo(String fpinfo) {
		this.fpinfo = fpinfo;
	}

}
