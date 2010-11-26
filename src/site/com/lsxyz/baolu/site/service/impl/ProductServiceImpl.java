package com.lsxyz.baolu.site.service.impl;

import com.lsxyz.baolu.site.dao.IProductCategoryDAO;
import com.lsxyz.baolu.site.dao.IProductDAO;
import com.lsxyz.baolu.site.model.Product;
import com.lsxyz.baolu.site.service.IProductService;
import org.apache.log4j.Logger;
import org.jmesa.limit.FilterSet;
import org.jmesa.limit.SortSet;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Component(value = "productService")
@Transactional
public class ProductServiceImpl implements IProductService {

	private static final Logger logger = Logger
			.getLogger(ProductServiceImpl.class);

	@Resource(name = "productDAO")
	private IProductDAO productDAO;

	@Resource(name = "productCategoryDAO")
	private IProductCategoryDAO productCategoryDAO;

	@Override
	public Product getProductById(Integer id) {

		if (id == null || id <= 0)
			return null;
		return productDAO.getProductById(id);
	}

	@Override
	public Product saveOrUpdateProduct(Product product) {

        return null;
	}

	@Override
	public List<Product> getAllProducts(FilterSet filterSet, SortSet sortSet, int rowStart, int rowEnd) {
		List<Product> products = productDAO.getAllProducts(filterSet, sortSet, rowStart, rowEnd);
		return products;
	}

	@Override
	public Integer getTotalRowCount(FilterSet filterSet) {
		Integer count = productDAO.getTotalRowCount(filterSet);
		return count;
	}

}
