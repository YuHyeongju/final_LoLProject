package com.itbank.model;

public class MatchPredictionDTO {

	private int gameIdx;
	private int bettingTeam;
	private String userid;
	
	
	public int getGameIdx() {
		return gameIdx;
	}
	public void setGameIdx(int gameIdx) {
		this.gameIdx = gameIdx;
	}
	public int getBettingTeam() {
		return bettingTeam;
	}
	public void setBettingTeam(int bettingTeam) {
		this.bettingTeam = bettingTeam;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
}
