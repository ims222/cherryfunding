package com.cherryfunding.spring.vo;

public class FHashtagVo {
	private int ftagNum;
	private int fnum;
	private String hashtag;

	public FHashtagVo() {
	}

	public FHashtagVo(int ftagNum, int fnum, String hashtag) {
		this.ftagNum = ftagNum;
		this.fnum = fnum;
		this.hashtag = hashtag;
	}

	public int getFtagNum() {
		return ftagNum;
	}

	public void setFtagNum(int ftagNum) {
		this.ftagNum = ftagNum;
	}

	public int getFnum() {
		return fnum;
	}

	public void setFnum(int fnum) {
		this.fnum = fnum;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

}
