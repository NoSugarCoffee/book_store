package com.dll.entity;

import java.util.List;

public class PageBean<T>{
	private int currentPage=1;
	private int totalCount;
	private int pageCount=6;
	private int totalPages;
	private boolean hasPre;
	private boolean hasNext;
	private List<T> pageData;
	private int prePage;
	private int nextPage;
	private Condition condition;
	
	

	public Condition getCondition() {
		return condition;
	}

	public void setCondition(Condition condition) {
		this.condition = condition;
	}

	public int getPrePage() {
		if(isHasPre()){
			return currentPage-1;
		}
		return currentPage;
	}

	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}

	public int getNextPage() {
		if(isHasNext()){
			return currentPage+1; 
		}
		return currentPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getTotalPages() {	
		if(totalCount%pageCount==0){
			totalPages=totalCount/pageCount;
		}else{
			totalPages=totalCount/pageCount+1;
		}
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		
		this.totalPages = totalPages;
	}
	
	public boolean isHasPre() {
		if(currentPage>1){
			return true;
		}
		return false;
	}
	
	public void setHasPre(boolean hasPre) {
		this.hasPre = hasPre;
	}

	public boolean isHasNext() {
		if(currentPage<getTotalPages()){
			return true;
		}
		return false;
	}

	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}

	public List<T> getPageData() {
		return pageData;
	}

	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
	}
	
	public PageBean(int currentPage) {
		this.currentPage=currentPage;
	}
	
}