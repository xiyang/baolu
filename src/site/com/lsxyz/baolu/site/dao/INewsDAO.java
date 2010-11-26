package com.lsxyz.baolu.site.dao;

import java.util.List;

import com.lsxyz.baolu.core.common.Page;
import com.lsxyz.baolu.core.dao.IBaseDAO;
import com.lsxyz.baolu.site.model.News;

public interface INewsDAO extends IBaseDAO<News> {

	List<News> getAllNews();

}
