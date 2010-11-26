package com.lsxyz.baolu.site.dao.hibernate;

import com.lsxyz.baolu.core.dao.hibernate.BaseDAOHibernate;
import com.lsxyz.baolu.site.common.JmesaUtils;
import com.lsxyz.baolu.site.dao.IProductDAO;
import com.lsxyz.baolu.site.model.Product;
import org.jmesa.limit.FilterSet;
import org.jmesa.limit.SortSet;
import org.springframework.stereotype.Component;

import java.util.List;

@Component(value="productDAO")
public class ProductDAOHibernate extends BaseDAOHibernate<Product> implements IProductDAO {

    @Override
    public Product getProductById(Integer id) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
	public List<Product> getAllProducts(FilterSet filterSet, SortSet sortSet, int rowStart, int rowEnd) {//1
		String hql = "from Product where 1=1 ";
		String filterHQL = JmesaUtils.organizeHQLStringByFilterSet(filterSet);
		String sortHQL = JmesaUtils.organizeHQLStringBySortSet(sortSet);
		
		List<Product> products = createQuery(hql + filterHQL + sortHQL).setFirstResult(rowStart).setMaxResults(rowEnd - rowStart).list();
		
		return products;
	}

	@Override	
	public Integer getTotalRowCount(FilterSet filterSet) {
		String countHQL = "select count(id) from Product where 1=1 ";
		String filterHQL = JmesaUtils.organizeHQLStringByFilterSet(filterSet);
		Integer count = Integer.valueOf(createQuery(countHQL + filterHQL).uniqueResult().toString());
		return count;
	}

}
