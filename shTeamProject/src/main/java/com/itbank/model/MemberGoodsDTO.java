package com.itbank.model;

public class MemberGoodsDTO {
	
	private int idx;
	private int goodsIdx;
	private String userid;
	private int count;
	private String goodsName; // goods_name 필드에 대한 추가
    private String goodsImage; // goods_image 필드에 대한 추가
    
    
    
	private GoodsDTO goods; // GoodsDTO 객체 추가
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getGoodsIdx() {
		return goodsIdx;
	}
	public void setGoodsIdx(int goodsIdx) {
		this.goodsIdx = goodsIdx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public GoodsDTO getGoods() {
		return goods;
	}
	public void setGoods(GoodsDTO goods) {
		this.goods = goods;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsImage() {
		return goodsImage;
	}
	public void setGoodsImage(String goodsImage) {
		this.goodsImage = goodsImage;
	}
	
	
}
