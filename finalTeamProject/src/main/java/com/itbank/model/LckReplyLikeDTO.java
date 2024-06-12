package com.itbank.model;

//이름       널?       유형            
//-------- -------- ------------- 
//IDX      NOT NULL NUMBER        
//REPLYIDX NOT NULL NUMBER        
//LIKEY             NUMBER        
//HATE              NUMBER        
//USERID   NOT NULL VARCHAR2(100)

public class LckReplyLikeDTO {
	private int idx;
	private int replyIdx;
	private int likey;
	private int hate;
	private String userid;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getReplyIdx() {
		return replyIdx;
	}

	public void setReplyIdx(int replyIdx) {
		this.replyIdx = replyIdx;
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

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

}
