package com.lsxyz.baolu.admin.web.action;

import com.lsxyz.baolu.site.model.News;
import com.lsxyz.baolu.site.model.Product;
import com.lsxyz.baolu.site.service.IProductService;
import com.lsxyz.baolu.site.service.ITextService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.jmesa.web.HttpServletRequestWebContext;
import org.jmesa.web.WebContext;
import org.jmesa.worksheet.Worksheet;
import org.jmesa.worksheet.WorksheetRow;
import org.jmesa.worksheet.state.SessionWorksheetState;
import org.jmesa.worksheet.state.WorksheetState;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

/**
 * To manage news
 * 
 * @author jinag_haiying
 * @version 2010-04-08
 */
@Controller
@RequestMapping("/admin/news")
public class AdminNewsController extends BaseController {

	@Resource(name = "textService")
	private ITextService textService;
	
	@Resource(name = "productService")
	private IProductService productService;
	
	/**
	 * If the id of distributor is not null, return the detail of distributor.
	 * 
	 * @param model Model
	 * @return the detail page of distributor
	 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET) 
	public String detail(News news,Model model) { 
		
		if (news.getId() == null) return "admin.news.detail";
		
		News newsa = textService.getNewsById(news.getId());
		
		model.addAttribute("news", newsa);
		return "admin.news.detail";
	}
	
	/**
	 * To get all Meeting
	 * 
	 * @param model Model
	 * @return the list page of the v
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET) 
	public String list(Model model) { 
		List<News> newsList = textService.getAllNews();
		model.addAttribute("news", newsList);
		return "admin.news.list"; 
	}
	
	/**
	 * To add or modify the object of Meeting
	 * 
	 * @param model Model
	 * @param news News
	 * @return the name of method that to show the right url
	 */
	@RequestMapping(value = "/addOrModify", method = RequestMethod.GET) 
	public String addOrModify(Model model, News news, String countryNames,
			String addDate, HttpServletRequest request) {

		return "redirect:result";
	}
	
	/**
	 * To delete the object of News
	 * 
	 * @param model Model
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @return the name of method that to show the right url
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.GET) 
	public String delete(Model model, HttpServletRequest request, HttpServletResponse response) {
		WebContext webContext = new HttpServletRequestWebContext(request);
		WorksheetState state = new SessionWorksheetState("newsTable", webContext);
		Worksheet worksheet = state.retrieveWorksheet();
		Collection<WorksheetRow> rows = worksheet.getRows();
		List<News> newsList = new ArrayList<News>();
		StringBuffer buffer = new StringBuffer();
		
		for (WorksheetRow row : rows) {
			String idStr = row.getUniqueProperty().getValue();
			News news = new News();
			if(!StringUtils.isEmpty(idStr) && StringUtils.isNumeric(idStr)) {
				news.setId(Integer.parseInt(idStr));
				newsList.add(news);
			}
			buffer.append(idStr);
		}
		boolean isSuccess = false;

		if (CollectionUtils.isNotEmpty(newsList)) {
			isSuccess = textService.removeNewsList(newsList);
		}
		
		return "redirect:result";
	}

	/**
	 * To get the right url
	 * 
	 * @param model Model
	 * @return the right url
	 */
	@RequestMapping(value="/result")
	private String result (Model model) {
		model.addAttribute("news", textService.getAllNews());
		return "redirect:/admin/news/list"; 
	}
	
	private Set<Product> getProductListByIds(String productIds) {
		
		Set<Product> products = new HashSet<Product>();
		
		if (StringUtils.isEmpty(productIds)) return null;
		String[] idArray = StringUtils.split(productIds, ',');
		
		for (String id : idArray) {
			products.add(productService.getProductById(Integer.valueOf(id)));
		}
		
		return products;
	}

}
