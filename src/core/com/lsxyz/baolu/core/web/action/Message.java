package com.lsxyz.baolu.core.web.action;

public class Message {
    
    public static String success() {
	
	String value = Scope.Flash.current().getValue("success");
	Scope.Flash.current().remove("success");
	return value;
    }
    
    public static String error() {
	
	String value = Scope.Flash.current().getValue("error");
	Scope.Flash.current().remove("error");
	return value;
    }
    
    public static String get(String key) {
	String value = Scope.Flash.current().getValue(key);
	Scope.Flash.current().remove(key);
	return value;
    }

}
