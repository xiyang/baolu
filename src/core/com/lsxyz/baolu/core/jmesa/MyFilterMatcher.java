package com.lsxyz.baolu.core.jmesa;

import org.apache.commons.lang.StringUtils;
import org.jmesa.core.filter.FilterMatcher;

public class MyFilterMatcher implements FilterMatcher {

	@Override
	public boolean evaluate(Object itemValue, String filterValue) {
		  String item = StringUtils.lowerCase(String.valueOf(itemValue));
	      String filter = StringUtils.lowerCase(String.valueOf(filterValue));

	      if (StringUtils.equalsIgnoreCase(item, filter)) {
	            return true;
	      }

	      return false;

	}

}
