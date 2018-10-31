package com.cherryfunding.spring.vo;

public class FHashtagVo {
	private int ftagNum;
	private int fNum;
	private String hashtag;

	public FHashtagVo() {
	}

	public FHashtagVo(int ftagNum, int fNum, String hashtag) {
		this.ftagNum = ftagNum;
		this.fNum = fNum;
		this.hashtag = hashtag;
	}

	public int getFtagNum() {
		return ftagNum;
	}

	public void setFtagNum(int ftagNum) {
		this.ftagNum = ftagNum;
	}

	public int getfNum() {
		return fNum;
	}

	public void setfNum(int fNum) {
		this.fNum = fNum;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

}
