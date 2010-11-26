package com.lsxyz.baolu.admin.web.action;


import com.lsxyz.baolu.site.model.ProductCategory;
import org.jmesa.facade.TableFacade;
import org.jmesa.facade.TableFacadeFactory;
import org.jmesa.limit.FilterSet;
import org.jmesa.limit.Limit;
import org.jmesa.limit.SortSet;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/admin/category")
public class CategoryManageController extends BaseController {

	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		showCategoriesInJmesaView(request, response, model);
		
		return "admin.category.list";
	}
	
	@RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
	public String saveOrUpdateCategories(HttpServletRequest request, HttpServletResponse response, ProductCategory category, Model model) {
		
		return "admin.category.list";
	}
	
	@RequestMapping(value = "/toCreate")
	public String toCreateCategory(HttpServletRequest request, HttpServletResponse response, Model model) {
		return "admin.category.detail";
	}
	
	/**
	 * show categories in jmesa view
	 * @param request
	 * @param response
	 * @param model
	 */
	private void showCategoriesInJmesaView(HttpServletRequest request, HttpServletResponse response, Model model) {
		TableFacade tableFacade = TableFacadeFactory.createSpringTableFacade("productCategoriesTable", request);
		tableFacade.setMaxRows(50);
		Limit limit = tableFacade.getLimit();
		FilterSet filterSet = limit.getFilterSet();
		
		//Integer totalRowCount = productCategoryService.getTotalRowCount(filterSet);
		//tableFacade.setTotalRows(totalRowCount);
		
		SortSet sortSet = limit.getSortSet();
		int rowStart = limit.getRowSelect() == null ? 0 : limit.getRowSelect().getRowStart();
		int rowEnd = limit.getRowSelect() == null ? 10 : limit.getRowSelect().getRowEnd();
		
		//List<ProductCategory> categories = productCategoryService.getAllCategories(filterSet, sortSet, rowStart, rowEnd);
		
		//model.addAttribute("categories", categories);
		model.addAttribute("limit", limit);
	}

}
