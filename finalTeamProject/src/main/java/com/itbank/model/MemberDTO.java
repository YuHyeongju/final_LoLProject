package com.itbank.model;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {
	private int idx;
	private String userid;
	private String userpw;
	private String nickName;
	private String email;
	private String favoriteTeam;
	private int grade;
	private int locked;
	private String mainPosition;
	private String subPosition;
	private int point;
	private int ticket;
	private String profile;
	private String newPassword;
	private int denyNotice;
	
	private MultipartFile upload;
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFavoriteTeam() {
		return favoriteTeam;
	}
	public void setFavoriteTeam(String favoriteTeam) {
		this.favoriteTeam = favoriteTeam;
	}
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getLocked() {
		return locked;
	}
	public void setLocked(int locked) {
		this.locked = locked;
	}
	
	public String getMainPosition() {
		return mainPosition;
	}
	public void setMainPosition(String mainPosition) {
		this.mainPosition = mainPosition;
	}
	public String getSubPosition() {
		return subPosition;
	}
	public void setSubPosition(String subPosition) {
		this.subPosition = subPosition;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getTicket() {
		return ticket;
	}
	public void setTicket(int ticket) {
		this.ticket = ticket;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public int getDenyNotice() {
		return denyNotice;
	}
	public void setDenyNotice(int denyNotice) {
		this.denyNotice = denyNotice;
	}
	
	
	
}
