package com.itbank.model;

import java.sql.Date;

public class LCKMVPDTO {
	private String title;
	private String gameTime;
	private Date gameDate;
	private String redTeam;
	private String blueTeam;
	private String  playerName;
	private String userId;
	private int gameIdx;
	private int idx;
	private int redTopCount;
	private int redJungleCount;
	private int redMidCount;
	private int redAdCarryCount;
	private int redSupporterCount;
	private int blueTopCount;
	private int blueJungleCount;
	private int blueMidCount;
	private int blueAdCarryCount;
	private int blueSupporterCount;
	private String redTop;
	private String redJungle;
	private String redMid;
	private String redAdCarry;
	private String redSupporter;
	private String blueTop;
	private String blueJungle;
	private String blueMid;
	private String blueAdCarry;
	private String blueSupporter;
	private int redTopPercent;
	private int redJunglePercent;
	private int redMidPercent;
	private int redAdCarryPercent;
	private int redSupporterPercent;
	private int blueTopPercent;
	private int blueJunglePercent;
	private int blueMidPercent;
	private int blueAdCarryPercent;
	private int blueSupporterPercent;
	private int result;
	
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
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
	public String getPlayerName() {
		return playerName;
	}
	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getGameIdx() {
		return gameIdx;
	}
	public void setGameIdx(int gameIdx) {
		this.gameIdx = gameIdx;
	}
	
	public int getRedTopCount() {
		return redTopCount;
	}
	public void setRedTopCount(int redTopCount) {
		this.redTopCount = redTopCount;
	}
	public int getRedJungleCount() {
		return redJungleCount;
	}
	public void setRedJungleCount(int redJungleCount) {
		this.redJungleCount = redJungleCount;
	}
	public int getRedMidCount() {
		return redMidCount;
	}
	public void setRedMidCount(int redMidCount) {
		this.redMidCount = redMidCount;
	}
	public int getRedAdCarryCount() {
		return redAdCarryCount;
	}
	public void setRedAdCarryCount(int redAdCarryCount) {
		this.redAdCarryCount = redAdCarryCount;
	}
	public int getRedSupporterCount() {
		return redSupporterCount;
	}
	public void setRedSupporterCount(int redSupporterCount) {
		this.redSupporterCount = redSupporterCount;
	}
	public int getBlueTopCount() {
		return blueTopCount;
	}
	public void setBlueTopCount(int blueTopCount) {
		this.blueTopCount = blueTopCount;
	}
	public int getBlueJungleCount() {
		return blueJungleCount;
	}
	public void setBlueJungleCount(int blueJungleCount) {
		this.blueJungleCount = blueJungleCount;
	}
	public int getBlueMidCount() {
		return blueMidCount;
	}
	public void setBlueMidCount(int blueMidCount) {
		this.blueMidCount = blueMidCount;
	}
	public int getBlueAdCarryCount() {
		return blueAdCarryCount;
	}
	public void setBlueAdCarryCount(int blueAdCarryCount) {
		this.blueAdCarryCount = blueAdCarryCount;
	}
	public int getBlueSupporterCount() {
		return blueSupporterCount;
	}
	public void setBlueSupporterCount(int blueSupporterCount) {
		this.blueSupporterCount = blueSupporterCount;
	}
	public String getRedTop() {
		return redTop;
	}
	public void setRedTop(String redTop) {
		this.redTop = redTop;
	}
	public String getRedJungle() {
		return redJungle;
	}
	public void setRedJungle(String redJungle) {
		this.redJungle = redJungle;
	}
	public String getRedMid() {
		return redMid;
	}
	public void setRedMid(String redMid) {
		this.redMid = redMid;
	}
	public String getRedAdCarry() {
		return redAdCarry;
	}
	public void setRedAdCarry(String redAdCarry) {
		this.redAdCarry = redAdCarry;
	}
	public String getRedSupporter() {
		return redSupporter;
	}
	public void setRedSupporter(String redSupporter) {
		this.redSupporter = redSupporter;
	}
	public String getBlueTop() {
		return blueTop;
	}
	public void setBlueTop(String blueTop) {
		this.blueTop = blueTop;
	}
	public String getBlueJungle() {
		return blueJungle;
	}
	public void setBlueJungle(String blueJungle) {
		this.blueJungle = blueJungle;
	}
	public String getBlueMid() {
		return blueMid;
	}
	public void setBlueMid(String blueMid) {
		this.blueMid = blueMid;
	}
	public String getBlueAdCarry() {
		return blueAdCarry;
	}
	public void setBlueAdCarry(String blueAdCarry) {
		this.blueAdCarry = blueAdCarry;
	}
	public String getBlueSupporter() {
		return blueSupporter;
	}
	public void setBlueSupporter(String blueSupporter) {
		this.blueSupporter = blueSupporter;
	}
	public int getRedTopPercent() {
		return redTopPercent;
	}
	public void setRedTopPercent(int redTopPercent) {
		this.redTopPercent = redTopPercent;
	}
	public int getRedJunglePercent() {
		return redJunglePercent;
	}
	public void setRedJunglePercent(int redJunglePercent) {
		this.redJunglePercent = redJunglePercent;
	}
	public int getRedMidPercent() {
		return redMidPercent;
	}
	public void setRedMidPercent(int redMidPercent) {
		this.redMidPercent = redMidPercent;
	}
	public int getRedAdCarryPercent() {
		return redAdCarryPercent;
	}
	public void setRedAdCarryPercent(int redAdCarryPercent) {
		this.redAdCarryPercent = redAdCarryPercent;
	}
	public int getRedSupporterPercent() {
		return redSupporterPercent;
	}
	public void setRedSupporterPercent(int redSupporterPercent) {
		this.redSupporterPercent = redSupporterPercent;
	}
	public int getBlueTopPercent() {
		return blueTopPercent;
	}
	public void setBlueTopPercent(int blueTopPercent) {
		this.blueTopPercent = blueTopPercent;
	}
	public int getBlueJunglePercent() {
		return blueJunglePercent;
	}
	public void setBlueJunglePercent(int blueJunglePercent) {
		this.blueJunglePercent = blueJunglePercent;
	}
	public int getBlueMidPercent() {
		return blueMidPercent;
	}
	public void setBlueMidPercent(int blueMidPercent) {
		this.blueMidPercent = blueMidPercent;
	}
	public int getBlueAdCarryPercent() {
		return blueAdCarryPercent;
	}
	public void setBlueAdCarryPercent(int blueAdCarryPercent) {
		this.blueAdCarryPercent = blueAdCarryPercent;
	}
	public int getBlueSupporterPercent() {
		return blueSupporterPercent;
	}
	public void setBlueSupporterPercent(int blueSupporterPercent) {
		this.blueSupporterPercent = blueSupporterPercent;
	}
	
	
	
	
	
}
