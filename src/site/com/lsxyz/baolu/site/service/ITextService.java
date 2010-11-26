package com.lsxyz.baolu.site.service;

import com.lsxyz.baolu.site.model.News;

import java.util.List;

public interface ITextService {

	News getNewsById(Integer id);
	
	List<News> getAllNews();
	
	Boolean addOrModifyNews(News news);

	Boolean removeNewsList(List<News> newsList);

}
