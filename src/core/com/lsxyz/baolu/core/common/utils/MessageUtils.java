package com.lsxyz.baolu.core.common.utils;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.List;

public class MessageUtils {
	public static void outputJSONResult(String result, HttpServletResponse response) {
		try {
			response.setHeader("ContentType", "text/json");
			response.setCharacterEncoding("utf-8");
			PrintWriter pw = response.getWriter();
			pw.write(result);
			pw.flush();
			pw.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void outputXMLResult(String result, HttpServletResponse response) {
		try {
			response.setHeader("ContentType", "xml");
			response.setCharacterEncoding("utf-8");
			PrintWriter pw = response.getWriter();
			pw.write(result);
			pw.flush();
			pw.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void outputJSONResultGBK(String result, HttpServletResponse response) {
		try {
			response.setHeader("ContentType", "text/json");
			response.setCharacterEncoding("gbk");
			PrintWriter pw = response.getWriter();
			pw.write(result);
			pw.flush();
			pw.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static String autoWordWrap(String valueStr, Integer charNum){
		
        if(valueStr.length()<charNum){
        	return valueStr;
        }
        
        String retValue = "";
        while(valueStr.length() >= charNum){
        	retValue = retValue + valueStr.substring(0,charNum) + "<br>";
        	valueStr = valueStr.substring(charNum);
        	if(StringUtils.isEmpty(valueStr)){
        		break;
        	}
        	
        	if(valueStr.length() < charNum){
        		retValue = retValue + valueStr;
        	}
        }
        
        return retValue;
	}
	
	/**
	 * parse the Model to JSON string
	 * @param list: the collection that need be parsed
	 * @param needField: the field that need be selected
	 * @param clazz: the list's element's type
	 * @return
	 * @throws Exception
	 */
	public static String parseModelToJSON(List list, String[] needField, Class clazz) throws Exception{
		return ModelToJSON.parseModelToJSON(list, needField, clazz);
	}
	
	/**
	 * Class for Model to Json by reflecting
	 * @author xiao_xiyang
	 *
	 */
	private static class ModelToJSON{
		
		private ModelToJSON(){}
		
		/**
		 * parse the Model to JSON string
		 * @param list
		 * @param needField
		 * @param clazz
		 * @return
		 * @throws Exception
		 */
		public static String parseModelToJSON(List list, String[] needField, Class clazz) throws Exception{
			
			if(null == list || list.isEmpty() || null == needField || needField.length <=0 || null == clazz) return null;
			
			Field[] fields = clazz.getDeclaredFields();
			for(Field field : fields){
				if ( null != field && ArrayUtils.contains(needField, field.getName()) ){
					
					//Method m = clazz.getMethod("get"+StringUtils.capitalise(str)field.getName());
				}
			}
			
			return null;
		}
	}
	
}
