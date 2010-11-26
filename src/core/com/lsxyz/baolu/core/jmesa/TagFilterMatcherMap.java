package com.lsxyz.baolu.core.jmesa;

import org.jmesa.core.filter.DateFilterMatcher;
import org.jmesa.core.filter.FilterMatcher;
import org.jmesa.core.filter.FilterMatcherMap;
import org.jmesa.core.filter.MatcherKey;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class TagFilterMatcherMap implements FilterMatcherMap {
    public Map<MatcherKey, FilterMatcher> getFilterMatchers() {
        Map<MatcherKey, FilterMatcher> filterMatcherMap = new HashMap<MatcherKey, FilterMatcher>();
        filterMatcherMap.put(new MatcherKey(Date.class, "orderDate"), new DateFilterMatcher("yyyy-MM-dd HH:mm"));
        return filterMatcherMap;
    }
}
