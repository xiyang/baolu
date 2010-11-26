package com.lsxyz.baolu.site.service;

import com.lsxyz.baolu.site.model.Product;
import org.jmesa.limit.FilterSet;
import org.jmesa.limit.SortSet;

import java.util.List;


public interface IProductService {
	
	/**
	 * get product by id
	 * @param id
	 * @return
	 */
	Product getProductById(Integer id);

	/**
	 * get the total row count of the product
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
	
	/**
	 * save the product to different category
	 * @param product
	 * @return
	 */
	Product saveOrUpdateProduct(Product product);
    
}
