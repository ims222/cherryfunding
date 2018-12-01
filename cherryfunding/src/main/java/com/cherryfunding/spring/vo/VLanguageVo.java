package com.cherryfunding.spring.vo;

public class VLanguageVo {
	private String lang;
	private String div;
	private String saying;

	public VLanguageVo() {
	}
 
	public VLanguageVo(String lang, String div, String saying) {
		this.lang = lang;
		this.div = div;
		this.saying = saying;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public String getDiv() {
		return div;
	}

	public void setDiv(String div) {
		this.div = div;
	}

	public String getSaying() {
		return saying;
	}

	public void setSaying(String saying) {
		this.saying = saying;
	}

}
