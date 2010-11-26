package com.lsxyz.baolu.admin.web.action;

import com.lsxyz.baolu.site.model.Product;
import com.lsxyz.baolu.site.service.IProductService;
import org.apache.commons.collections.CollectionUtils;
import org.jmesa.facade.TableFacade;
import org.jmesa.facade.TableFacadeFactory;
import org.jmesa.limit.FilterSet;
import org.jmesa.limit.Limit;
import org.jmesa.limit.SortSet;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping(value = "/admin/product")
public class ProductManageController extends BaseController {
	
	@Resource(name = "productService")
	private IProductService productService;
	
	@RequestMapping(value = "/{id}")
	public String detail(HttpServletRequest request, HttpServletResponse response, @PathVariable("id") Integer id, Model model) {

		Product product = productService.getProductById(id);
		model.addAttribute("product", product);
		return "admin.product.detail";
	}
	
	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request, HttpServletResponse response, Model model) {
		showProductInJmesaView(request, response, model);
		return "admin.product.list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET) 
	public String delete(Model model, HttpServletRequest request, HttpServletResponse response){
		
		List<Integer> productIdList = getIdListByJmesaCheckBox(request, "productsTable");
		
		boolean isSuccess = false;
		if (CollectionUtils.isNotEmpty(productIdList)){
			//isSuccess = productService.removeProductsByIds(productIdList);
		} 
		
		showProductInJmesaView(request, response, model);
		
		return "admin.product.list";
	}
	
	/**
	 * show the products in jmesa view
	 * @param request
	 * @param response
	 * @param model
	 */
	private void showProductInJmesaView(HttpServletRequest request, HttpServletResponse response, Model model) {
		TableFacade tableFacade = TableFacadeFactory.createSpringTableFacade("productsTable", request);
		tableFacade.setMaxRows(50);
		Limit limit = tableFacade.getLimit();
		FilterSet filterSet = limit.getFilterSet();
		
		Integer totalRowCount = productService.getTotalRowCount(filterSet);
		tableFacade.setTotalRows(totalRowCount);
		
		SortSet sortSet = limit.getSortSet();
		int rowStart = limit.getRowSelect() == null ? 0 : limit.getRowSelect().getRowStart();
		int rowEnd = limit.getRowSelect() == null ? 10 : limit.getRowSelect().getRowEnd();
		
		List<Product> products = productService.getAllProducts(filterSet, sortSet, rowStart, rowEnd);
		
		model.addAttribute("products", products);
		model.addAttribute("limit", limit);
	}

}
