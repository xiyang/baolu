package com.lsxyz.baolu.core.jmesa;

import org.apache.commons.lang.StringUtils;
import org.jmesa.core.filter.FilterMatcher;



/**
 * ignore the case type, start bland, end bland of string
 * @author xiao_xiyang
 */
public class StringFilterMatcher implements FilterMatcher {
	public boolean evaluate(Object itemValue, String filterValue) {
		String item = StringUtils.lowerCase(String.valueOf(itemValue).trim());
		String filter = StringUtils.lowerCase(String.valueOf(filterValue).trim());
		if (StringUtils.contains(item, filter)) {
			return true;
		}
		return false;
	}
}
