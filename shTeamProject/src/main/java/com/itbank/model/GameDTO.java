package com.itbank.model;

import java.sql.Date;

public class GameDTO {

	private int idx;
	private String redTeam;
	private String blueTeam;
	private int redScore;
	private int blueScore;
	private int status;
	private Date gameDate;
	private String gameTime;
	private String title;
	private String stadium;
	private int redPer;
	private int bluePer;
	
	
	
	
	
	public int getRedPer() {
		return redPer;
	}
	public void setRedPer(int redPer) {
		this.redPer = redPer;
	}
	public int getBluePer() {
		return bluePer;
	}
	public void setBluePer(int bluePer) {
		this.bluePer = bluePer;
	}
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
	public String getStadium() {
		return stadium;
	}
	public void setStadium(String stadium) {
		this.stadium = stadium;
	}
	
	public String getGameTime() {
		return gameTime;
	}
	public void setGameTime(String gameTime) {
		this.gameTime = gameTime;
	}
	public Date getGameDate() {
		return gameDate;
	}
	public void setGameDate(Date gameDate) {
		this.gameDate = gameDate;
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
	
	
	
}
