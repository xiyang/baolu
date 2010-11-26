package com.lsxyz.baolu.core.common.utils;

import com.lsxyz.baolu.core.common.Constants;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class MyStringUtils {
	
	protected static Logger logger = LoggerFactory.getLogger(MyStringUtils.class);
	
	/**
	 * Get current date string from date according to the date format
	 * @param  date format
	 * @return date string
	 */
	public static String getCurrentDateStr(String format) {
		java.util.Date current = new java.util.Date();
        java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat(format); 
        String dateStr = simpleDateFormat.format(current);
		return dateStr;
	}
	
	/**
	 * Get string from number according to the number format
	 * @param num
	 * @param format
	 * @return number string
	 */
	public static String getNumberStringFromNumberForFillingZeroByFormat(Integer num, String format){
		java.text.DecimalFormat decimalFormat = new java.text.DecimalFormat(format);   
        return decimalFormat.format(num);
	}
	
	/**
	 * To convert StringData to the Data format
	 * 
	 * @param stringData String
	 * @param DataFormat String
	 * @return a date of Data type 
	 */
	public static Date convertStringDateToDateFormat(String stringDate, String dateFormat) throws ParseException {
		
		
		if (StringUtils.isEmpty(stringDate) || StringUtils.isEmpty(dateFormat)) {
			return null;
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);  
		java.sql.Date newDate = null;
		
		try {
			Date date = (Date) sdf.parse(stringDate);
			newDate = new java.sql.Date(date.getTime());
			
		} catch (ParseException parseEx) {
			logger.error(parseEx.getMessage(), parseEx);
			throw parseEx;
		}
		return newDate;
	}
	
	/**
	 * To get the English of month
	 * 
	 * @param month int
	 * @return the English of month
	 */
	public static String getFullNameByMonth(int month) {
		
		if(month < 1 || month > 12) {
			return null;
		}
		if(month == 1 ) {
			return "January";
		} else if(month == 2) {
			return "February";
		} else if(month == 3) {
			return "January";
		} else if(month == 4) {
			return "April";
		} else if(month == 5) {
			return "May";
		}  else if(month == 6) {
			return "June";
		}  else if(month == 7) {
			return "July";
		}  else if(month == 8) {
			return "August";
		}  else if(month == 9) {
			return "September";
		}  else if(month == 10) {
			return "October";
		}  else if(month == 11) {
			return "November";
		}  else if(month == 12) {
			return "December";
		} 
		return null;
	}
	
	public static String encryptMD5(String input) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		md.update(input.getBytes());
		byte[] b = md.digest();
		return new BigInteger(1, b).toString(16);
	}
	
	public static Integer toInteger(String source){
		
		try{
			int sourceId = Integer.parseInt(source);
			return sourceId;
		}catch(NumberFormatException ex){
			return -1;
		}
	}
	
	public static Double toDouble(String source){
		
		try{
			double sourceId = Double.parseDouble(source);
			return sourceId;
		}catch(Exception ex){
			return 0.0;
		}
	}
	
	/**
	 * Generate the random password by the length.
	 * @param length
	 * @return
	 */
	public static String generateRandomPassword(int length) {

		int i;
		int count = 0;
		char[] str = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
				'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w',
				'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

		StringBuffer pwd = new StringBuffer("");
		Random random = new Random();
		while (count < length) {
			i = Math.abs(random.nextInt(str.length - 1));

			if (i >= 0 && i < str.length) {
				pwd.append(str[i]);
				count++;
			}
		}
		return pwd.toString();
	}

	public static String removeHtmlTag(String source){
		
		if(StringUtils.isEmpty(source)){
			return "";
		}
		Pattern pattern = Pattern.compile("<.+?>", Pattern.DOTALL);
		
		/**
		 * like this: <html><a href=\"index.html\">index</a><div>I love you</div>HHHHa<b/></html>
		 */
		Matcher matcher = pattern.matcher(source);
		String string = matcher.replaceAll("");
		string = string.replaceAll("\r", "").trim();
		string = string.replaceAll("\n", "").trim();
		return string;
	}
	
	public static String convertSpecialCharForUrl(String source, String destChar){
		
		String regEx = "[ ()/,\\[\\]~`!@#$%^&*;:\\\"\\\'<>?.-]";
		Pattern p = Pattern.compile(regEx, Pattern.DOTALL);
		Matcher m = p.matcher(source);
		
		String destStr = m.replaceAll("_");
		regEx = "_+";
		Pattern p1 = Pattern.compile(regEx, Pattern.DOTALL);
		Matcher m1 = p1.matcher(destStr);
		
		destStr = m1.replaceAll("_");
		
		String temp = StringUtils.removeEnd(destStr, "_");
		
		return StringUtils.removeStart(temp, "_");
	}
	
	public static String getFromArray(String[] sourceArray, String dest){
		if( null == sourceArray || sourceArray.length <=0 || StringUtils.isEmpty(dest))
			return null;
		
		for(String one : sourceArray){
			if(StringUtils.endsWithIgnoreCase(one, dest))
				return one;
		}
		return null;
	}
	
	public static Boolean containsAny(Object[] array, String searchValue){
		
		if(array == null || StringUtils.isEmpty(searchValue) || array.length == 0){
			return false;
		}
		
		for(Object str : array){
			if(StringUtils.equalsIgnoreCase(((String)str).trim(), searchValue.trim())){
				return true;
			}
		}
		return false;
	}
	

    public static String splitValueByLength(String content, String keyword, int length){
		
    	if(StringUtils.isEmpty(content)){
    		return "";
    	}
		String tempStr = content.toLowerCase();
		tempStr = tempStr.replaceAll("\n", " ");
		tempStr = tempStr.replaceAll("\t", " ");
		tempStr = tempStr.replaceAll(Constants.BLANK_SPACE_CHAR_REGEX, " ");
		
		int index = tempStr.indexOf(keyword.toLowerCase());
		if(index == -1){
			return tempStr.substring(0, length);
		}
		int start = 0;
		int end = length;
		
		if(index < length){
			start = 0;
		}else{
			start = index - length;
			String temp = tempStr.substring(0, start);
			start = temp.lastIndexOf(" ")+1;
		}
		
		if((index + keyword.length() + length) >= tempStr.length()){
			end = tempStr.length();
		}else{
			String temp = tempStr.substring(index+1, index+length);
			end = index + temp.lastIndexOf(" ")+1;
		}
		
		content = content.replaceAll("\n", " ");
		content = content.replaceAll("\t", " ");
		content = content.replaceAll(Constants.BLANK_SPACE_CHAR_REGEX, " ");
		
		return content.substring(start, end);
	}
    
    public static String transferredValue(String value){
    	
    	if(StringUtils.isEmpty(value)){
    		return "";
    	}
       	value = value.replaceAll("%", "\\\\%");
//    	value = value.replaceAll("_", "\\\\_");
    	value = value.replaceAll("'", "\\\\'");
    	value = value.replaceAll("\\\\", "\\\\\\\\");

    	value = value.replaceAll("\\[", "\\\\\\\\[");
    	value = value.replaceAll("\\]", "\\\\\\\\]");
    	value = value.replaceAll("\\^", "\\\\^");
    	value = value.replaceAll("\\?", "\\\\\\\\?");


    	value = value.replaceAll("\\.", "\\\\\\\\.");
    	value = value.replaceAll("\\+", "\\\\\\\\+");
//    	value = value.replaceAll("\\$", "\\\\\\\\$");
    	
    	return value;
    }
    
    public static String revertTransferredValue(String value){
    	
    	if(StringUtils.isEmpty(value)){
    		return "";
    	}
       	value = value.replaceAll("\\\\\\\\%", "%");
    	value = value.replaceAll("\\\\\\\\'", "'");
    	value = value.replaceAll("\\\\\\\\", "\\\\");

    	value = value.replaceAll("\\\\\\[", "\\[");
    	value = value.replaceAll("\\\\\\]", "\\]");
    	value = value.replaceAll("\\\\\\^", "^");
    	value = value.replaceAll("\\\\\\?", "?");
//
//
    	value = value.replaceAll("\\\\\\.", ".");
    	value = value.replaceAll("\\\\\\+", "+");
    	
    	return value;
    }

    public static String sha1(String str){
    	return new SHA1().getDigestOfString(str.getBytes());
    }
    
    public static int countMacths(String source, String str){
    	int i = 0;
    	String sourceTmp = source;
    	while(sourceTmp.indexOf(str) != -1){
    		i++;
    		sourceTmp = StringUtils.substringAfter(sourceTmp, str);
    	}
    	return i;
    }
    
    /**
     * Validation the date.
     * @param source
     * @param dateFormat
     * @return
     */
 public static boolean checkDate(String source, String dateFormat)   { 
    	
        boolean ret = true; 
        try { 
            DateFormat df = new SimpleDateFormat(dateFormat); 
            df.setLenient(false);
            ret = StringUtils.containsAny(df.format(df.parse(source)), source); 
        } 
        catch (ParseException e) { 
            ret = false; 
        } 
        return ret; 
    }
    
	public static Date toDate(String source, String dateFormat){
    	
    	Date dateTemp = toDateByFormat(source);
    	if(dateTemp != null){
    		java.sql.Date dateSql = new java.sql.Date(dateTemp.getTime());
    		return dateSql;
    	}
		
    	Date date = null;
		SimpleDateFormat format=new SimpleDateFormat(dateFormat);
		 try {
			 date = format.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
    }
    
    public static Date toDateByFormat(String source){
    	
		SimpleDateFormat sdf=new SimpleDateFormat(Constants.DATE_FORMAT_TEMP);
		try {
			Date date = sdf.parse(source);
			return date;
		} catch (ParseException e) {
			return null;
		}
    }
	public static void main(String[] args){
		 System.out.println(checkDate("2010-09-5","yyyy-MM-dd"));
	}

	
}
