package com.lsxyz.baolu.site.dao.hibernate;

import com.lsxyz.baolu.core.dao.hibernate.BaseDAOHibernate;
import com.lsxyz.baolu.site.dao.IProductCategoryDAO;
import com.lsxyz.baolu.site.model.ProductCategory;
import org.springframework.stereotype.Component;

@Component(value="productCategoryDAO")
public class ProductCategoryDAOHibernate extends BaseDAOHibernate<ProductCategory> implements IProductCategoryDAO {

}
