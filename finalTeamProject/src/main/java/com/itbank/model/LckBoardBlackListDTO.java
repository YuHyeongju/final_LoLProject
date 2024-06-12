package com.itbank.model;

/*이름           널?       유형            
------------ -------- ------------- 
IDX          NOT NULL NUMBER        
REPORTUSER   NOT NULL VARCHAR2(300) 
REPORTEDUSER NOT NULL VARCHAR2(300) 
BOARDIDX     NOT NULL NUMBER  */

public class LckBoardBlackListDTO {
	private int idx;
	private String reportUser;
	private String reportedUser;
	private int boardIdx;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getReportUser() {
		return reportUser;
	}

	public void setReportUser(String reportUser) {
		this.reportUser = reportUser;
	}

	public String getReportedUser() {
		return reportedUser;
	}

	public void setReportedUser(String reportedUser) {
		this.reportedUser = reportedUser;
	}

	public int getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}

}
