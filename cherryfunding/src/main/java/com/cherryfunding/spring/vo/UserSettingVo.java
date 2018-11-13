package com.cherryfunding.spring.vo;

public class UserSettingVo {
	private String id;
	private String lang;
	private String voice;
	private String alarm;
	private String profile;

	public UserSettingVo() {
	}

	public UserSettingVo(String id, String lang, String voice, String alarm, String profile) {
		super();
		this.id = id;
		this.lang = lang;
		this.voice = voice;
		this.alarm = alarm;
		this.profile = profile;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public String getVoice() {
		return voice;
	}

	public void setVoice(String voice) {
		this.voice = voice;
	}

	public String getAlarm() {
		return alarm;
	}

	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

}
