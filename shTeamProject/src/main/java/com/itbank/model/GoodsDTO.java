package com.itbank.model;

import org.springframework.web.multipart.MultipartFile;

//	이름       널?       유형            
//	-------- -------- ------------- 
//	IDX      NOT NULL NUMBER        
//	NAME     NOT NULL VARCHAR2(100) 
//	IMAGE    NOT NULL VARCHAR2(200) 
//	PRICE    NOT NULL NUMBER        
//	QUANTITY          NUMBER 


//	IDX          NOT NULL NUMBER        
//	NAME         NOT NULL VARCHAR2(300) 
//	IMAGE        NOT NULL VARCHAR2(500) 
//	TICKETCOUNT  NOT NULL NUMBER        
//	PRODUCTCOUNT NOT NULL NUMBER        
//	DELETED               NUMBER   
//	SALED                 NUMBER        

public class GoodsDTO {
	private int idx;
	private String name;
	private String image;
	private int ticketCount;
	private int productCount;
	private int deleted;
	private int saled;
	
	private MultipartFile upload;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getTicketCount() {
		return ticketCount;
	}

	public void setTicketCount(int ticketCount) {
		this.ticketCount = ticketCount;
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	public int getSaled() {
		return saled;
	}

	public void setSaled(int saled) {
		this.saled = saled;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	

	
	
	
}
