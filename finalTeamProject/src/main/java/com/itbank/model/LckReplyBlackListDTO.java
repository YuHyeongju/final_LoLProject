package com.itbank.model;

/*이름           널?       유형            
------------ -------- ------------- 
IDX          NOT NULL NUMBER        
REPORTUSER   NOT NULL VARCHAR2(300) 
REPORTEDUSER NOT NULL VARCHAR2(300) 
REPLYIDX     NOT NULL NUMBER  */

public class LckReplyBlackListDTO {
	private int idx;
	private String reportUser;
	private String reportedUser;
	private int replyIdx;
	
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
	public int getReplyIdx() {
		return replyIdx;
	}
	public void setReplyIdx(int replyIdx) {
		this.replyIdx = replyIdx;
	}
	
	
}
