package com.cherryfunding.spring.util;

public class PageUtil {
	private int pageNum;// 현재페이지번호
	private int startRow;// 시작행
	private int endRow;// 끝행
	private int rowBlockCount = 6;// 나타날 행 숫자
	private int totalRowCount;// 총 행수

	public PageUtil() {
	}

	public PageUtil(int pageNum, int totalRowCount) {
		this.pageNum = pageNum;
		this.totalRowCount = totalRowCount;
		startRow = (pageNum - 1) * rowBlockCount + 1;
		endRow = startRow + rowBlockCount - 1;
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

	public int getRowBlockCount() {
		return rowBlockCount;
	}

	public void setRowBlockCount(int rowBlockCount) {
		this.rowBlockCount = rowBlockCount;
	}

	public int getTotalRowCount() {
		return totalRowCount;
	}

	public void setTotalRowCount(int totalRowCount) {
		this.totalRowCount = totalRowCount;
	}

}
