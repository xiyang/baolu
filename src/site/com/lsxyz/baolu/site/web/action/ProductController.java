package com.lsxyz.baolu.site.web.action;

import com.lsxyz.baolu.admin.web.action.BaseController;
import com.lsxyz.baolu.site.common.*;
import com.lsxyz.baolu.site.model.*;
import com.lsxyz.baolu.site.service.*;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/products")
public class ProductController extends BaseController {

	@Resource(name = "productService")
	private IProductService productService;
	
	private static final Logger logger = Logger.getLogger(ProductController.class);

	/**
	 * show the product detail by the catalog.
	 */
	@RequestMapping(value = "/catalog/{id}")
	public String showDetail(@PathVariable("id") Integer id,
			Model model,
			HttpServletRequest request, 
			HttpServletResponse response) {
		
		Product product = productService.getProductById(id);
		if(null == product){
			return "baolu.error";
		}

		return "baolu.product.detail";
	}
	
}
