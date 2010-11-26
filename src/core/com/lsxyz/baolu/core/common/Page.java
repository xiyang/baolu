package com.lsxyz.baolu.core.common;

import java.util.ArrayList;
import java.util.List;

public class Page {
	private int totalRows; //总行数
	private int pageSize = 50; //每页显示的行数
	private int currentPage; //当前页号
	private int totalPages; //总页数
	private int startRow; //当前页在数据库中的起始行
	private List<Integer> pageList;//页码

	public Page() {
	}

	public Page(int _totalRows) {
		totalRows = _totalRows;
		totalPages = totalRows / pageSize;
		int mod = totalRows % pageSize;
		if (mod > 0) {
			totalPages++;
		}
		currentPage = 1;
		startRow = 0;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void first() {
		currentPage = 1;
		startRow = 0;
	}

	public void previous() {
		if (currentPage == 1) {
			return;
		}
		currentPage--;
		startRow = (currentPage - 1) * pageSize;
	}

	public void next() {
		if (currentPage < totalPages) {
			currentPage++;
		}
		startRow = (currentPage - 1) * pageSize;
	}

	public void last() {
		currentPage = totalPages > 0 ? totalPages : 1;
		startRow = (currentPage - 1) * pageSize;
	}

	public void refresh(int _currentPage) {
		currentPage = _currentPage;
		this.startRow = (currentPage - 1) * this.getPageSize();
		if (currentPage > totalPages) {
			last();
		}
	}

	public List<Integer> addPage(int showPages) {
		List<Integer> list = new ArrayList<Integer>();
		int begin = currentPage - 2;
		int end = currentPage + showPages - 3;

		if (begin <= 0) {
			begin = 1;
			end = showPages;
		}

		if (end >= totalPages) {
			begin = totalPages - showPages + 1;
			if (begin <= 0) {
				begin = 1;
			}
			end = totalPages;
		}
		for (int i = begin; i <= end; i++) {
			list.add(i);
		}
		return list;
	}

	public List<Integer> getPageList() {
		return pageList;
	}

	public void setPageList(List<Integer> pageList) {
		this.pageList = pageList;
	}

}
