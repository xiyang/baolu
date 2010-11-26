package com.lsxyz.baolu.site.dao;

import java.util.Date;
import java.util.List;

import org.jmesa.limit.FilterSet;
import org.jmesa.limit.SortSet;

import com.lsxyz.baolu.core.common.Page;
import com.lsxyz.baolu.core.dao.IBaseDAO;
import com.lsxyz.baolu.site.model.Product;

public interface IProductDAO extends IBaseDAO<Product> {
	
	/**
	 * get product by id
	 * @param id
	 * @return
	 */
	Product getProductById(Integer id);

	/**
	 * get the total row count of the product for jmesa
	 * @param filterSet
	 * @return
	 */
	Integer getTotalRowCount(FilterSet filterSet);
	
	/**
	 * get all products for jmesa
	 * @param filterSet
	 * @param sortSet
	 * @param rowStart
	 * @param rowEnd
	 * @return
	 */
	List<Product> getAllProducts(FilterSet filterSet, SortSet sortSet, int rowStart, int rowEnd);
}
