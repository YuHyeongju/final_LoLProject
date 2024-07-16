package com.itbank.model;

import java.sql.Date;

//idx             number          generated as identity primary key,
//redTeam         varchar2(100)   not null,
//blueTeam        varchar2(100)   not null,
//redScore        number          not null,
//blueScore       number          not null,
//gameTime        date            not null,
//status          number          check(result in(0,1,2)),
//url             varchar2(300)   
public class LCKGameDTO {
	private int idx;
	private String title;
	private String redTeam;
	private String blueTeam;
	private int redScore;
	private int blueScore;
	private Date gameDate; // gameDate -> date =>날짜 
	private String gameTime;// String로 변환 =>시간
	private int status;
	private String url;
	private String redTeamImg;
	private String blueTeamImg;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getRedTeam() {
		return redTeam;
	}
	public void setRedTeam(String redTeam) {
		this.redTeam = redTeam;
	}
	public String getBlueTeam() {
		return blueTeam;
	}
	public void setBlueTeam(String blueTeam) {
		this.blueTeam = blueTeam;
	}
	public int getRedScore() {
		return redScore;
	}
	public void setRedScore(int redScore) {
		this.redScore = redScore;
	}
	public int getBlueScore() {
		return blueScore;
	}
	public void setBlueScore(int blueScore) {
		this.blueScore = blueScore;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	private Date time;
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
	public String getRedTeamImg() {
		return redTeamImg;
	}
	public void setRedTeamImg(String redTeamImg) {
		this.redTeamImg = redTeamImg;
	}
	public String getBlueTeamImg() {
		return blueTeamImg;
	}
	public void setBlueTeamImg(String blueTeamImg) {
		this.blueTeamImg = blueTeamImg;
	}
	public Date getGameDate() {
		return gameDate;
	}
	public void setGameDate(Date gameDate) {
		this.gameDate = gameDate;
	}
	public String getGameTime() {
		return gameTime;
	}
	public void setGameTime(String gameTime) {
		this.gameTime = gameTime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	
}
