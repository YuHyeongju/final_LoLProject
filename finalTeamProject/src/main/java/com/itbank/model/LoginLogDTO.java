package com.itbank.model;

import java.sql.Date;

public class LoginLogDTO {

	private String userid;
	private Date loginTime;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	
	
}
