package com.lsxyz.baolu.core.jmesa;

import org.jmesa.view.ViewUtils;
import org.jmesa.view.component.Row;
import org.jmesa.view.html.HtmlBuilder;
import org.jmesa.view.html.HtmlSnippetsImpl;
import org.jmesa.view.html.component.HtmlTable;
import org.jmesa.view.html.toolbar.AbstractToolbar;
import org.jmesa.view.html.toolbar.MaxRowsItem;
import org.jmesa.view.html.toolbar.ToolbarItem;
import org.jmesa.view.html.toolbar.ToolbarItemType;

import java.util.List;

public class ProductToolBar extends AbstractToolbar {

	public ProductToolBar() {
	}
	
	@Override
	public String render() {
		addToolbarItem(ToolbarItemType.SEPARATOR);
		addToolbarItem(ToolbarItemType.PAGE_NUMBER_ITEMS);
		addToolbarItem(ToolbarItemType.FIRST_PAGE_ITEM);
		addToolbarItem(ToolbarItemType.PREV_PAGE_ITEM);
		addToolbarItem(ToolbarItemType.NEXT_PAGE_ITEM);
		addToolbarItem(ToolbarItemType.LAST_PAGE_ITEM);
		addToolbarItem(ToolbarItemType.SEPARATOR);
		MaxRowsItem maxRowsItem = (MaxRowsItem) addToolbarItem(ToolbarItemType.MAX_ROWS_ITEM);
		if (getMaxRowsIncrements() != null) {
			maxRowsItem.setIncrements(getMaxRowsIncrements());
		}
		boolean exportable = ViewUtils.isExportable(getExportTypes());
		if (exportable) {
			addToolbarItem(ToolbarItemType.SEPARATOR);
			addExportToolbarItems(getExportTypes());
		}
		Row row = getTable().getRow();
		List columns = ((org.jmesa.view.component.Row) row).getColumns();
		boolean filterable = ViewUtils.isFilterable(columns);
		if (filterable) {
			addToolbarItem(ToolbarItemType.SEPARATOR);
			addToolbarItem(ToolbarItemType.FILTER_ITEM);
			addToolbarItem(ToolbarItemType.CLEAR_ITEM);
		}
		
		HtmlSnippetsImpl statusBar = new HtmlSnippetsImpl((HtmlTable)this.getTable(), this, this.getCoreContext());
		// super render
		HtmlBuilder html = new HtmlBuilder();
        html.table(2).width("99%").border("0").cellpadding("0").cellspacing("1").close();
        html.tr(3).close();
        
        html.td(4).width("65%").align("left").style("padding-left:16px;").close();
        html.tdEnd();
        
        html.td(4).nowrap().close();
        html.append(statusBar.statusBarText());
        html.tdEnd();
        for (ToolbarItem item : this.getToolbarItems()) {
        	html.td(4).nowrap().close();
            html.append(item.getToolbarItemRenderer().render());
            html.tdEnd();
        }
        html.trEnd(3);

        html.tableEnd(2);
        html.newline();
        html.tabs(2);

        return html.toString();
	}

}
