package com.lsxyz.baolu.site.dao.hibernate;

import com.lsxyz.baolu.core.dao.hibernate.BaseDAOHibernate;
import com.lsxyz.baolu.site.dao.INewsDAO;
import com.lsxyz.baolu.site.model.News;
import com.lsxyz.baolu.site.model.StatusEnum;
import org.springframework.stereotype.Component;

import java.util.List;

@Component(value="newsDAO")
public class NewsDAOHibernate extends BaseDAOHibernate<News> implements INewsDAO {

	@Override
	public List<News> getAllNews() {
		
		String hql = "select distinct news from News news left join fetch news.areas area where news.status = ?";
		
		return find(hql, StatusEnum.Y);
	}



}
