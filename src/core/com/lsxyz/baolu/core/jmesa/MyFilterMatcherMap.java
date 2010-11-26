package com.lsxyz.baolu.core.jmesa;

import org.jmesa.core.filter.FilterMatcher;
import org.jmesa.core.filter.FilterMatcherMap;
import org.jmesa.core.filter.MatcherKey;

import java.util.HashMap;
import java.util.Map;


public class MyFilterMatcherMap implements FilterMatcherMap {

	@Override
	public Map<MatcherKey, FilterMatcher> getFilterMatchers() {
		Map<MatcherKey, FilterMatcher> filterMatcherMap = new HashMap<MatcherKey, FilterMatcher>();
		filterMatcherMap.put(new MatcherKey(Object.class, "status"), new MyFilterMatcher());
		return filterMatcherMap;
	}

}
