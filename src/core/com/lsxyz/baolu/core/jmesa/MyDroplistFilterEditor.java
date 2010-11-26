package com.lsxyz.baolu.core.jmesa;

import org.apache.commons.lang.StringUtils;
import org.jmesa.view.html.editor.DroplistFilterEditor;

import java.util.ArrayList;
import java.util.List;

public class MyDroplistFilterEditor extends DroplistFilterEditor {
	
	@Override
	   protected List<Option> getOptions() {
	      List<Option> options = new ArrayList<Option>();
	      String tableId = this.getCoreContext().getLimit().getId();
	      if(StringUtils.equalsIgnoreCase(tableId, "productFeedBackTable")){
	    	  options.add(new Option("UNTREATED","UNTREATED"));
		      options.add(new Option("AUDITED", "AUDITED"));
	      }else if(StringUtils.equalsIgnoreCase(tableId, "customProjectTable")){
	    	  options.add(new Option("NOT_CREATED","Unpaid"));
		      options.add(new Option("CREATED", "Paid"));
	      }
		  else if(StringUtils.equalsIgnoreCase(tableId, "ordersTable")){
			  options.add(new Option("GENERAL","Unpaid"));
		      options.add(new Option("DELIVERING", "Paid"));
		      options.add(new Option("DELIVERED", "Delivered"));
	      }else{
		      options.add(new Option("Y","Y"));
		      options.add(new Option("N", "N"));
	      }
	      //options.add(new Option("RECOMMEND", "RECOMMEND"));
	      //options.add(new Option("FREE", "FREE"));
	      return options;
	   }
}
