package com.cherryfunding.spring.vo;

public class UsersSettingVo {
	private String id;
	private String lang;
	private String voice;
	private String alarm;

	public UsersSettingVo() {
	}

	public UsersSettingVo(String id, String lang, String voice, String alarm) {
		this.id = id;
		this.lang = lang;
		this.voice = voice;
		this.alarm = alarm;
	}

	String getId() {
		return id;
	}

	void setId(String id) {
		this.id = id;
	}

	String getLang() {
		return lang;
	}

	void setLang(String lang) {
		this.lang = lang;
	}

	String getVoice() {
		return voice;
	}

	void setVoice(String voice) {
		this.voice = voice;
	}

	String getAlarm() {
		return alarm;
	}

	void setAlarm(String alarm) {
		this.alarm = alarm;
	}

}
