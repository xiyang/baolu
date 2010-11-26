package com.lsxyz.baolu.core.jmesa;

import org.jmesa.view.editor.AbstractHeaderEditor;

public class MultiJemsaCheckboxHeaderEditor extends AbstractHeaderEditor {

	@Override
	public Object getValue() {
		return "<input onclick=\"selectAllItems(this.checked, this.name)\" id=\"checkall\" name=\""+this.getColumn().getProperty()+"\" type=\"checkbox\" />";
	}

}
