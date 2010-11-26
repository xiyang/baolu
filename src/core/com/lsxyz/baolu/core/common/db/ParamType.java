package com.lsxyz.baolu.core.common.db;

public enum ParamType {

	SETLONG("setLong"),
	SETINT("setInt"),
	SETSTRING("setString"),
	REGISTEROUTPARAMETER("registerOutParameter");
	
	private String type;
	
	private ParamType(String type){
		this.type = type;
	}
	
	public String getType(){
		return type;
	}
}
