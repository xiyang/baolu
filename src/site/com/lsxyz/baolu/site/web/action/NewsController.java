package com.lsxyz.baolu.site.web.action;

import com.lsxyz.baolu.core.common.Page;
import com.lsxyz.baolu.core.common.PageHelper;
import com.lsxyz.baolu.site.service.ITextService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller                                 
@RequestMapping("/news")
public class NewsController {

	@Resource(name = "textService")
	private ITextService textService;
	
	@RequestMapping(value = "detail/{id}", method = RequestMethod.GET) 
	public String detail(@PathVariable("id") Integer id, Model model) { 
		model.addAttribute("news", textService.getNewsById(id));
		return "baolu.news.detail";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model, HttpServletRequest request) {
		
		Integer totalRows = textService.getAllNews().size();
		Page page = PageHelper.getPager(request, totalRows);
		return "baolu.news.list";
	}
	
}
