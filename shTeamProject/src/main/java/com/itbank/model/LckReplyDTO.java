package com.itbank.model;



//이름       널?       유형             

//-------- -------- -------------- 
//IDX      NOT NULL NUMBER         
//BOARDIDX NOT NULL NUMBER         
//WRITER   NOT NULL VARCHAR2(300)  
//CONTENT  NOT NULL VARCHAR2(1000) 
//IMAGE    NOT NULL VARCHAR2(500)

public class LckReplyDTO {
	private int idx;
	private int boardIdx;
	private String writer;
	private String content;
	private int replyLikeCount;
	private int replyHateCount;
	private int likey;
	private int hate;
	private int replyCount;
	
	
	
	
	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	private int resultReplyReport;

	public int getResultReplyReport() {
		return resultReplyReport;
	}

	public void setResultReplyReport(int resultReplyReport) {
		this.resultReplyReport = resultReplyReport;
	}

	public int getLikey() {
		return likey;
	}

	public void setLikey(int likey) {
		this.likey = likey;
	}

	public int getHate() {
		return hate;
	}

	public void setHate(int hate) {
		this.hate = hate;
	}

	public int getReplyHateCount() {
		return replyHateCount;
	}

	public void setReplyHateCount(int replyHateCount) {
		this.replyHateCount = replyHateCount;
	}

	public int getReplyLikeCount() {
		return replyLikeCount;
	}

	public void setReplyLikeCount(int replyLikeCount) {
		this.replyLikeCount = replyLikeCount;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
