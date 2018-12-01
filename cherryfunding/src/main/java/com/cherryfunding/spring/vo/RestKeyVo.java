package com.cherryfunding.spring.vo;

public class RestKeyVo {

	String keyName;
	String keyValue;

	public RestKeyVo() {
	} 

	public RestKeyVo(String keyName, String keyValue) {
		this.keyName = keyName;
		this.keyValue = keyValue;
	}

	public String getKeyName() {
		return keyName;
	}

	public void setKeyName(String keyName) {
		this.keyName = keyName;
	}

	public String getKeyValue() {
		return keyValue;
	}

	public void setKeyValue(String keyValue) {
		this.keyValue = keyValue;
	}

}
