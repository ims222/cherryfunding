package com.cherryfunding.spring.util;

public class PageUtil2 {
	private int pageNum; // 현재페이지 번호
	private int startRow; // 시작 게시물 행
	private int endRow; // 끝 게시물 행
	
	private int totalPageCount; //총 페이지
	private int startPageNum; // 시작 페이지 번호
	private int endPageNum;// 끝 페이지 번호
	
	private int rowBlockCount; // 나타낼 게시물수
	private int pageBlockCount; // 나타낼 페이지 
	private int totalRowCount; // 총 게시물 갯수
	
	public PageUtil2() {}

	public PageUtil2(int pageNum, int totalRowCount,int rowBlockCount, int pageBlockCount) {
		super();
		this.pageNum = pageNum;
		this.rowBlockCount = rowBlockCount;
		this.pageBlockCount = pageBlockCount;
		
		
		startRow=(pageNum-1)*rowBlockCount+1;//시작 게시물 번호
		endRow=startRow+rowBlockCount-1; // 마지막 게시물 번호
		totalPageCount= (int)Math.ceil(totalRowCount/(double)rowBlockCount);//총 페이지 갯수
		startPageNum=(pageNum-1)/pageBlockCount*pageBlockCount+1;
		endPageNum=startPageNum+pageBlockCount-1;
		
		if(totalPageCount < endPageNum) {
			endPageNum=totalPageCount;
		}
		
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}

	public int getRowBlockCount() {
		return rowBlockCount;
	}

	public void setRowBlockCount(int rowBlockCount) {
		this.rowBlockCount = rowBlockCount;
	}

	public int getPageBlockCount() {
		return pageBlockCount;
	}

	public void setPageBlockCount(int pageBlockCount) {
		this.pageBlockCount = pageBlockCount;
	}

	public int getTotalRowCount() {
		return totalRowCount;
	}

	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}
	
	

}
