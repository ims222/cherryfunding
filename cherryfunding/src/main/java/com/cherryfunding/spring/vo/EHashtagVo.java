package com.cherryfunding.spring.vo;

public class EHashtagVo {
    private int ctagNum; 
    private int eNum;
    private String hashtag;
    public EHashtagVo() {}
	public EHashtagVo(int ctagNum, int eNum, String hashtag) {
		super();
		this.ctagNum = ctagNum;
		this.eNum = eNum; 
		this.hashtag = hashtag;
	}
	public int getCtagNum() {
		return ctagNum;
	}
	public void setCtagNum(int ctagNum) {
		this.ctagNum = ctagNum;
	}
	public int geteNum() {
		return eNum;
	}
	public void seteNum(int eNum) {
		this.eNum = eNum;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
    
}
