package com.lsxyz.baolu.core.common.db;

/**
 * The class <strong>ResultType<strong> be used for gets result type of execute query SQL
 *
 * @author GaoFei
 * @version 1.0.0 2009-06-14 
 */
public enum ResultType {
	GETLONG("getLong"), 
	GETSTRING("getString"), 
	GETFLOAT("getFloat"), 
	GETDOUBLE("getDouble"),
	GETINT("getInt");

	private String type;

	private ResultType(String type) {
		this.type = type;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
