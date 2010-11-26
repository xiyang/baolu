package com.lsxyz.baolu.core.jmesa;

import org.jmesa.view.html.editor.DroplistFilterEditor;

import java.util.ArrayList;
import java.util.List;

public class ProductRealeaseDroplistFilterEditor extends DroplistFilterEditor {
	
	@Override
	   protected List<Option> getOptions() {
	      List<Option> options = new ArrayList<Option>();
	      options.add(new Option("online","online"));
	      options.add(new Option("offline", "offline"));
	      return options;
	   }

}
