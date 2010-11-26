package com.lsxyz.baolu.admin.web.action;

import com.lsxyz.baolu.site.service.IProductService;
import org.apache.commons.collections.CollectionUtils;
import org.jmesa.web.HttpServletRequestWebContext;
import org.jmesa.web.WebContext;
import org.jmesa.worksheet.Worksheet;
import org.jmesa.worksheet.WorksheetRow;
import org.jmesa.worksheet.state.SessionWorksheetState;
import org.jmesa.worksheet.state.WorksheetState;
import org.springframework.context.support.DelegatingMessageSource;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class BaseController {

	@Resource(name = "messageSource")
	protected DelegatingMessageSource messageSource;
	
	@Resource(name = "productService")
	protected IProductService productService;

	/**
	 * get Object's id collection that is show in jmesa view
	 * 
	 * @param request
	 * @param tableId
	 * @return
	 */
	protected List<Integer> getIdListByJmesaCheckBox(
			HttpServletRequest request, String tableId) {
		WebContext webContext = new HttpServletRequestWebContext(request);
		WorksheetState state = new SessionWorksheetState(tableId, webContext);

		List<Integer> ids = new ArrayList<Integer>();

		Worksheet worksheet = state.retrieveWorksheet();
		if (null == worksheet) {
			return ids;
		}

		Collection<WorksheetRow> rows = worksheet.getRows();
		if (CollectionUtils.isEmpty(rows)) {
			return ids;
		}

		for (WorksheetRow worksheetRow : rows) {
			ids.add(Integer
					.valueOf(worksheetRow.getUniqueProperty().getValue()));
		}

		return ids;

	}

}
