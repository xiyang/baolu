package com.lsxyz.baolu.site.common;

import org.jmesa.limit.Filter;
import org.jmesa.limit.FilterSet;
import org.jmesa.limit.Sort;
import org.jmesa.limit.SortSet;

import java.util.Collection;

public class JmesaUtils {

	/**
	 * organize filter HQL by the FilterSet of the jmesa
	 * @param filterSet
	 * @return
	 */
	public static String organizeHQLStringByFilterSet(FilterSet filterSet) {
		StringBuilder hqlBuilder = new StringBuilder("");
		Collection<Filter> filters = filterSet.getFilters();
		
		for (Filter f : filters) {
			hqlBuilder.append(" and upper(" + f.getProperty() + ") like '%" + f.getValue().trim().toUpperCase() + "%' ");
		}

		return hqlBuilder.toString();
	}


	/**
	 * organize sort HQL by SortSet of the jmesa
	 * @param sortSet
	 * @return
	 */
	public static String organizeHQLStringBySortSet(SortSet sortSet) {
		StringBuilder hqlBuilder = new StringBuilder("");
		Collection<Sort> sorts = sortSet.getSorts();
		String result = "";
		
		if (sorts.size() > 0) {
			hqlBuilder.append(" order by ");
			for (Sort s : sorts) {
				hqlBuilder.append(s.getProperty() + " " + s.getOrder().toString() + ", ");
			}
			String sql = hqlBuilder.toString();
			result = sql.substring(0, sql.length()-2);
		}
		
		return result;
	}
	
}

