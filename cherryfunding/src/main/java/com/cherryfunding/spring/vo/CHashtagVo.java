package com.cherryfunding.spring.vo;

public class CHashtagVo {
	private int ctagNum; 
    private int cNum;
    private String hashtag;
    public CHashtagVo() {}
	public CHashtagVo(int ctagNum, int cNum, String hashtag) {
		super();
		this.ctagNum = ctagNum;
		this.cNum = cNum;
		this.hashtag = hashtag;
	}
	public int getCtagNum() {
		return ctagNum;
	}
	public void setCtagNum(int ctagNum) {
		this.ctagNum = ctagNum;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
    
}
