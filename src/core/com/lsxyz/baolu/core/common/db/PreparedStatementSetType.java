package com.lsxyz.baolu.core.common.db;

/**
 * The class <strong>PreparedStatementSetType<strong> be used for set PreparedStatement parameter type
 *
 * @author GaoFei
 * @version 1.0.0 2009-06-14 
 */
public enum PreparedStatementSetType {
	SETINT("setInt"),
	SETLONG("setLong"),
	SETSTRING("setString"),
	SETFLOAT("setFloat"),
	SETDOUBLE("setDouble"),
	SETDATE("setDate");
	
	private String type;
	
	private PreparedStatementSetType(String type) {
		this.type = type;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
}
