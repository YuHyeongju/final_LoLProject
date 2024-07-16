package com.itbank.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

//이름        널?       유형             
//--------- -------- -------------- 
//IDX       NOT NULL NUMBER         
//TITLE     NOT NULL VARCHAR2(300)  
//WRITER    NOT NULL VARCHAR2(300)  
//CONTENT   NOT NULL VARCHAR2(4000) 
//CATEGORY  NOT NULL VARCHAR2(200)  
//WRITEDATE          DATE           
//IMAGE              VARCHAR2(500)

public class LckBoardDTO {
	private int idx;
	private String title;
	private String writer;
	private String content;
	private String category;
	private Date WriteDate;
	private String image;
	private int isNotice;

	private int resultBoardReport;
	
	private int ReplyCount;
	

	public int getReplyCount() {
		return ReplyCount;
	}

	public void setReplyCount(int replyCount) {
		ReplyCount = replyCount;
	}

	public int getResultBoardReport() {
		return resultBoardReport;
	}

	public void setResultBoardReport(int resultBoardReport) {
		this.resultBoardReport = resultBoardReport;
	}

	private MultipartFile upload;

	public int getIsNotice() {
		return isNotice;
	}

	public void setIsNotice(int isNotice) {
		this.isNotice = isNotice;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Date getWriteDate() {
		return WriteDate;
	}

	public void setWriteDate(Date writeDate) {
		WriteDate = writeDate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

}
