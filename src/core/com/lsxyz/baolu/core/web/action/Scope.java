package com.lsxyz.baolu.core.web.action;

import java.util.HashMap;
import java.util.Map;

public class Scope {
    
    public static class Flash {

        Map<String, Object> data = new HashMap<String, Object>();
        static ThreadLocal<Flash> current = new ThreadLocal<Flash>();
        
        private static Flash flash = new Flash();
        
        public static Flash current() {
            /*if( null == current.get()) {
        	current.set(new Flash());
            }
            return current.get();*/
            return flash;
            
        }
        
        public void put(String key, Object value) {
            if (key.contains(":")) {
                throw new IllegalArgumentException("Character ':' is invalid in a flash key.");
            }
            data.put(key, value);
        }
        
        public void success(String value, Object... args) {
            put("success", String.format(value, args));
        }
        
        public void error(String value, Object... args) {
            put("error", String.format(value, args));
        }
        
        public boolean remove(String key) {
            return data.remove(key) != null;
        }
        
        public String getValue(String key) {
            return (String) data.get(key);
        }
        
        public Object getObjectInfo(String key) {
        	return data.get(key);
        }
        
        public void clear(){
        	for(String key : data.keySet()){
        		data.remove(key);
        	}
        }
        
    }
}
