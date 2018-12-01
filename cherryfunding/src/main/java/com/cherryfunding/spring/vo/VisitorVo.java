package com.cherryfunding.spring.vo;

import java.sql.Date;

public class VisitorVo {
	
	private String v_ip;
	private String v_refer;
	private Date v_date;
	 
	public VisitorVo() {}
	
	

	public VisitorVo(String v_ip, String v_refer, Date v_date) {
		super();
		this.v_ip = v_ip;
		this.v_refer = v_refer;
		this.v_date = v_date;
	}



	public String getV_ip() {
		return v_ip;
	}

	public void setV_ip(String v_ip) {
		this.v_ip = v_ip;
	}

	public String getV_refer() {
		return v_refer;
	}

	public void setV_refer(String v_refer) {
		this.v_refer = v_refer;
	}

	public Date getV_date() {
		return v_date;
	}

	public void setV_date(Date v_date) {
		this.v_date = v_date;
	}



	@Override
	public String toString() {
		return "VisitorVo [v_ip=" + v_ip + ", v_refer=" + v_refer + ", v_date=" + v_date + "]";
	};
	
	

	
	
	

}
