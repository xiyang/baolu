package com.lsxyz.baolu.core.common;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class PageHelper {
	public static Page getPager(HttpServletRequest httpServletRequest,
			int totalRows) {

		// 定义pager对象，用于传到页面
		Page page = new Page(totalRows);

		// 从Request对象中获取当前页号
		String currentPage = httpServletRequest.getParameter("currentPage");

		// 如果当前页号为空，表示为首次查询该页
		// 如果不为空，则刷新page对象，输入当前页号等信息
		if (currentPage != null) {
			page.refresh(Integer.parseInt(currentPage));
		}

		// 获取当前执行的方法，首页，前一页，后一页，尾页。
		String pagerMethod = httpServletRequest.getParameter("pageMethod");

		if (pagerMethod != null) {
			if (pagerMethod.equals("first")) {
				page.first();
			} else if (pagerMethod.equals("previous")) {
				page.previous();
			} else if (pagerMethod.equals("next")) {
				page.next();
			} else if (pagerMethod.equals("last")) {
				page.last();
			}
		}
		// 设置页码
		List<Integer> pageList = page.addPage(Constants.DEFAULT_PAGE_SIZE);
		page.setPageList(pageList);
		return page;
	}
}
