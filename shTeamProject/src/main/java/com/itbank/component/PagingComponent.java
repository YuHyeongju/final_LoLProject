package com.itbank.component;

import org.springframework.stereotype.Component;

@Component
public class PagingComponent {
	private int page;
	private int perPage;
	private int boardCount;
	private int offset;
	private int fetch;
	private String search;
	private String category;
	private int pageCount;
	private int section;
	private boolean prev;
	private boolean next;
	private int begin;
	private int end;

	public PagingComponent() {

	}

	
//	public static PagingComponent newInstance(int page, int boardCount,String search) {
//		return new PagingComponent(page,boardCount,search);
//	}

	public static PagingComponent newInstance(int page, int boardCount, String search,String category) {
		return new PagingComponent(page, boardCount, search, category);
	}


//	private PagingComponent(int page,int boardCount, String search) {
//		this.page = page;
//		this.search = search;
//		this.boardCount = boardCount;
//		
//		
//		perPage = 20;
//		offset = (page - 1) * perPage;
//		fetch = perPage * page;
//		
//		pageCount = boardCount / perPage;
//		pageCount += (boardCount % perPage != 0) ? 1 : 0;
//		section = (page - 1) / perPage;
//		
//		prev = section != 0;
//		next = pageCount > end;
//		begin = section * perPage + 1;
//		end = begin + 9;
//		if (end > pageCount) {
//			end = pageCount;
//			next = false;
//		}
//	}

	private PagingComponent(int page, int boardCount, String search, String category) {
		this.page = page;
		this.boardCount = boardCount;
		this.search = search;
		this.category = category;
		perPage = 20;
		offset = (page - 1) * perPage;
		System.out.println("offset:" + offset);
		fetch = perPage;
		System.out.println("fetch:" + fetch);

		pageCount = boardCount / perPage;
		System.out.println("review:" + boardCount);
		System.out.println("perPage:" + perPage);
		pageCount += (boardCount % perPage != 0) ? 1 : 0;
		System.out.println("pageCount: " + pageCount);
		section = (page - 1) / 10;
		System.out.println("section: " + section);

		prev = section != 0;
		next = pageCount > end;
		begin = (section * 10) + 1;
		System.out.println("begin:" + begin);
		end = begin + 9;
		System.out.println("end:" + end);
		if (end > pageCount) {
			end = pageCount;
			next = false;
			System.out.println("end > pageCount: " + end);
		}
	}


	public String getCategory() {
		return category;
	}
	
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setReviewCount(int boardCount) {
		this.boardCount = boardCount;
	}
	
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public int getFetch() {
		return fetch;
	}

	public void setFetch(int fetch) {
		this.fetch = fetch;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getSection() {
		return section;
	}

	public void setSection(int section) {
		this.section = section;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

}
