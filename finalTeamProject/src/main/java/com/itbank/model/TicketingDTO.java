package com.itbank.model;

import java.sql.Date;

public class TicketingDTO {
	
	private int idx;
	private String title;
	private Date gameDate;
	private String gameTime;
	private String stadium;
	private String redTeam;
	private String blueTeam;
	
	private int gameIdx;
	private String seat;
	private String userid;
	private int deleted;
	
	
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	
	public String getStadium() {
		return stadium;
	}
	public void setStadium(String stadium) {
		this.stadium = stadium;
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
	public int getGameIdx() {
		return gameIdx;
	}
	public void setGameIdx(int gameIdx) {
		this.gameIdx = gameIdx;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	
	
}
