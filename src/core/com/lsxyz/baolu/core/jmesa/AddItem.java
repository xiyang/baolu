package com.lsxyz.baolu.core.jmesa;

import org.jmesa.core.CoreContext;
import org.jmesa.limit.Limit;
import org.jmesa.view.html.toolbar.AbstractItemRenderer;
import org.jmesa.view.html.toolbar.ImageItemImpl;
import org.jmesa.view.html.toolbar.ToolbarItem;
import org.jmesa.web.WebContext;

public class AddItem extends ImageItemImpl {
	public AddItem(WebContext webContext, CoreContext coreContext, String toolTip) {
		super();
		setCode("add");
		setTooltip(toolTip);
		setAlt(toolTip);
		
		String contextPath = webContext.getContextPath();
		setImage(contextPath + "/images/table/add.gif");
		
		DeleteItemRenderer render = new DeleteItemRenderer(this,coreContext);
		render.setOnInvokeAction(coreContext.getPreference("html.onInvokeAction"));
		setToolbarItemRenderer(render);
	}
	
}




final class AddItemRenderer extends AbstractItemRenderer {
	public AddItemRenderer(ToolbarItem item, CoreContext coreContext) {
	    setToolbarItem(item);
	    setCoreContext(coreContext);
	}
	public String render() {
	    Limit limit = getCoreContext().getLimit();
	    ToolbarItem item = getToolbarItem();
	    StringBuilder action = new StringBuilder("javascript:");
	    action.append("jQuery.jmesa.setSaveToWorksheet('" + limit.getId() + "');" + getOnInvokeActionJavaScript(limit, item));
	    item.setAction(action.toString());
	    return item.enabled();
	}
}