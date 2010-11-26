package com.lsxyz.baolu.core.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class Constants {
	public static final int DEFAULT_PAGE_SIZE = 5;
	
	public static final String DATE_FORMAT = "yyyy-MM-dd";
	public static final String DATE_FORMAT_TEMP = "MM/dd/yyyy";
	
	public static final String DATE_FORMAT_SHOWING = "yyyy-MM-dd HH:mm";
	
	public static final String SESSION_ORDER= "sessionOrder";
	
	public static final String ORDER_STARTING_VALUE = "0001";
	
	public static final String ORDER_SN_CODE_FORMAT = "000";
	
	public static final int ORDER_CACHE_NUMBER= 500;
	
	public static final int ORDER_WARN_LEVEL= 350;
	
	public static final String SITE = "##";
	
	public static final String PARSER = ",";
	
	public static final String PARSER_ZH = "，";
	
	public static final String SEARCH_TYPE_PRODUCT = "products";
	public static final String SEARCH_TYPE_SITE = "site";
	
	//@TODO for configuration file
	public static final int PRODUCTS_NUM_OF_INDEX_PAGE = 7;
	
	public static final int PRODUCTS_NUM_OF_NEW_RELEASE = 100;
	
	public static final int SITE_CONTENT_LENGTH = 100;
	
	//reference key separate
	public static final String REFERENCE_KEY_SEPERATE = ":";
	public static final String REFERENCE_CATEGORY_SEPERATE = "#";
	
	public static final String GENEID = "GeneID";
	public static final String UNIGENE_CLUSTER = "UniGene_Cluster";
	public static final String REFERENCE_CATEGORY_OTHER = "Other";
	
	public static final int NEWRELEASE_ENGTH = 36;
	
	public static final String DEFAULT_COUNTRY_CODE = "US";
	
	public static final String DEFAULT_CUNTRY_NAME = "United States";
	
	public static final String ANTIBODIES_TARGET_VIEW = "antibodies";
	public static final String TISSUE_ARRAYS_PRODUCT = "Tissue Arrays";
	
	public static final String DISTRIBUTOR_CONTENT_NAME = "Europe";
	
	public static final String BLANK_SPACE_CHAR_REGEX = "\\s+";
	
	public static final String BLANK_SPACE_CHAR = " ";
	
	public static final String APPLICATION_NOTE_REPLACE = "~~";
	
	public static final String APPLICATION_NOTE_REPLACE_VALUE = "&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;";
	
	public static final String ENTER_CHAR = "\\n";
	public static final String ENTER = "\r";
	public static final String ENTER_MULTI = "\r\n";
	
	public static final String SQL_OPERATE = " rlike ";
	
	public static final String STRING_SEPERATE = "/";
	
	public static final String STRING_PROTOCOLS = "Protocol";
	//the back url for reg or login
	public static final String FROM_URL_KEY="user.from.url";
	
	public static Map<String, String[]> ALL_LANGUAGES = new HashMap<String, String[]>();

	public static final String SAMPLER_KITS_SELECTED_KEY = "SAMPLER_KITS_SELECTED";
	
	public static final String CITATION_TOOLS_KEY = "Tools";
	public static final String CITATION_TOOLS_KEY_VALUE = "Sumoplot™";
	
	public static String HOME_URL = "";
	
	//export data
	public final static String TITLE_SHEET = "the first data of bio sheet";
	//Sets the width of the column on this sheet
	public static int XLS_COLUMN_WIDTH = 40;
	//Sets the height of the specified row
	public static int XLS_ROW_HEIGHT = 1000;
	public final static String DEFAULT_ASSAY_VALUE = "";
	
    public static List<String> getLetterIndexList(){
		
		String []letterArray = new String[]{"0-9","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
		List<String> indexList = new ArrayList<String>();
		for(String letter : letterArray){
			indexList.add(letter);
		}
		return indexList;
	}
  
}
