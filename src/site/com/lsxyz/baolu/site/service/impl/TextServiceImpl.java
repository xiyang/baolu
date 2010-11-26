package com.lsxyz.baolu.site.service.impl;

import com.lsxyz.baolu.site.dao.INewsDAO;
import com.lsxyz.baolu.site.model.News;
import com.lsxyz.baolu.site.service.ITextService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Component(value = "textService")
@Transactional
public class TextServiceImpl implements ITextService {

	private static final Logger logger = Logger.getLogger(TextServiceImpl.class);
	
	@Resource(name = "newsDAO")
	private INewsDAO newsDAO;

	
	/**
	 * For news
	 */
	@Override
	public News getNewsById(Integer id) {
		if (id == null || id <= 0) {
			return new News();
		}
		return newsDAO.getObject(id);
	}
	

	@Override
	public Boolean addOrModifyNews(News news) {
		newsDAO.saveObject(news);
		return true;
	}

	@Override
	public Boolean removeNewsList(List<News> newsList) {
		newsDAO.deleteObjects(newsList);
		return true;
	}

	
	@Override
	public List<News> getAllNews() {
		return newsDAO.getAllNews();
	}
	
}
