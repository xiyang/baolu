package com.lsxyz.baolu.core.jmesa;

import org.jmesa.core.CoreContext;
import org.jmesa.limit.Limit;
import org.jmesa.view.html.toolbar.AbstractItemRenderer;
import org.jmesa.view.html.toolbar.ImageItemImpl;
import org.jmesa.view.html.toolbar.ToolbarItem;
import org.jmesa.web.WebContext;



/**
 * Class DeleteItem for jmesa toolbar
 * @author Zhou xuehua
 * @version 1.0, 2009-07-17
 */
public class DeleteItem extends ImageItemImpl{
	
	public DeleteItem(WebContext webContext, CoreContext coreContext, String toolTip) {
		super();
		setCode("delete");
		setTooltip(toolTip);
		setAlt(toolTip);
		
		String contextPath = webContext.getContextPath();
		setImage(contextPath + "/images/table/delete.gif");
		
		DeleteItemRenderer render = new DeleteItemRenderer(this,coreContext);
		render.setOnInvokeAction(coreContext.getPreference("html.onInvokeAction"));
		setToolbarItemRenderer(render);
	}
	
}

/**
 * class item renderer for delete item in toolbar
 * @author Zhou xuehua
 * @version 1.0, 2009-07-17
 * 
 */
final class DeleteItemRenderer extends AbstractItemRenderer {
	public DeleteItemRenderer(ToolbarItem item, CoreContext coreContext) {
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