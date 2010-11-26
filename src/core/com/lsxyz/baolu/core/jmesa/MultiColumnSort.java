package com.lsxyz.baolu.core.jmesa;

import org.apache.commons.beanutils.BeanComparator;
import org.apache.commons.collections.comparators.ComparatorChain;
import org.apache.commons.collections.comparators.NullComparator;
import org.jmesa.core.sort.ColumnSort;
import org.jmesa.limit.Limit;
import org.jmesa.limit.Order;
import org.jmesa.limit.Sort;
import org.jmesa.limit.SortSet;

import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 * @author Xiao xiyang
 */
public class MultiColumnSort implements ColumnSort {
    public Collection<?> sortItems(Collection<?> items, Limit limit) {
        ComparatorChain chain = new ComparatorChain();

        SortSet sortSet = limit.getSortSet();
        for (Sort sort : sortSet.getSorts()) {
            if (sort.getOrder() == Order.ASC) {
                chain.addComparator(new BeanComparator(sort.getProperty(), new NullComparator()));
            } else if (sort.getOrder() == Order.DESC) {
                chain.addComparator(new BeanComparator(sort.getProperty(), new NullComparator()), true);
            }
        }

        if (chain.size() > 0) {
            Collections.sort((List<?>) items, chain);
        }

        return items;
    }
}
