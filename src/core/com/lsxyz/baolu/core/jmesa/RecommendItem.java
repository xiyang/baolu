package com.lsxyz.baolu.core.jmesa;

import org.jmesa.core.CoreContext;
import org.jmesa.limit.Limit;
import org.jmesa.view.html.toolbar.AbstractItemRenderer;
import org.jmesa.view.html.toolbar.ImageItemImpl;
import org.jmesa.view.html.toolbar.ToolbarItem;
import org.jmesa.web.WebContext;

public class RecommendItem extends ImageItemImpl {

	public RecommendItem(WebContext webContext, CoreContext coreContext, String toolTip) {
		super();
		setCode("recommend");
		setTooltip(toolTip);
		setAlt(toolTip);
		
		String contextPath = webContext.getContextPath();
		setImage(contextPath + "/images/table/active.gif");
		
		RecommendItemRenderer render = new RecommendItemRenderer(this, coreContext);
		render.setOnInvokeAction(coreContext.getPreference("html.onInvokeAction"));
		setToolbarItemRenderer(render);
	}
}


final class RecommendItemRenderer extends AbstractItemRenderer {

	public RecommendItemRenderer(ToolbarItem item, CoreContext coreContext) {
		setToolbarItem(item);
	    setCoreContext(coreContext);
	}
	
	@Override
	public String render() {
		Limit limit = getCoreContext().getLimit();
		ToolbarItem item = getToolbarItem();
		StringBuilder action = new StringBuilder("javascript:");
		action.append("jQuery.jmesa.setSaveToWorksheet('" + limit.getId() + "');" + getOnInvokeActionJavaScript(limit, item));
		item.setAction(action.toString());
		return item.enabled();}
	
}
