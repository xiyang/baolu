package com.lsxyz.baolu.site.common;

import com.lsxyz.baolu.core.common.Constants;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;

public class UploadHelper {
	
	
	/**
	 * gets local file if upload file success
	 * @param mf MultipartFile 
	 * @return file of local if upload successful
	 * @throws 
	 */
	public static File uploadFile(MultipartFile mf, String uploadType) throws Exception {
		if (mf.isEmpty() || mf.getSize() <= 0) {
			return null;
		}
		
		CommonsMultipartFile cmf = (CommonsMultipartFile)mf;
		DiskFileItem fileItem = (DiskFileItem) cmf.getFileItem();
		String fileType = StringUtils.substringAfterLast(fileItem.getName(), ".");
		
		if (fileType.equalsIgnoreCase(uploadType)) {
			File file = fileItem.getStoreLocation();
			fileItem.write(file);
			return file;
		}
		
		return null;
	}
	
	
	public static String uploadFile(MultipartFile multipartFile, File storeFile) {
		
		if (null == storeFile || null == multipartFile) {
			return null;
		}
		
		if (!storeFile.isDirectory()) {
			boolean isSuccess = storeFile.mkdirs();
			if (!isSuccess) {
				return null;
			}
		}
		
		CommonsMultipartFile cmf = (CommonsMultipartFile)multipartFile;
		DiskFileItem fileItem = (DiskFileItem) cmf.getFileItem();
		String fileName = fileItem.getName();
		if(fileName.indexOf("\\") != -1 || fileName.indexOf(File.separator) != -1){
			if(fileName.indexOf("\\") != -1){
				fileName = fileName.substring(fileItem.getName().lastIndexOf("\\")+1);
			}else{
				fileName = fileName.substring(fileItem.getName().lastIndexOf(File.separator)+1);
			}
		}
		File storeNewFile = new File(storeFile.getAbsolutePath() + File.separator + fileName);
		try {
			fileItem.write(storeNewFile);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			fileItem.delete();
		}
		return storeNewFile.getAbsolutePath();
	}

	/**
	 * upload file to disk path
	 * @param multipartFile MultipartFile
	 * @return upload file absolute path
	 */
	public static String uploadFileToStorePath(MultipartFile multipartFile, File storeFile, String prefix) {
		
		if (null == storeFile || null == multipartFile) {
			return null;
		}
		
		if (!storeFile.isDirectory()) {
			boolean isSuccess = storeFile.mkdirs();
			if (!isSuccess) {
				return null;
			}
		}
		
		CommonsMultipartFile cmf = (CommonsMultipartFile)multipartFile;
		DiskFileItem fileItem = (DiskFileItem) cmf.getFileItem();
		String fileName = fileItem.getName();
		if(fileName.indexOf("\\") != -1 || fileName.indexOf(File.separator) != -1){
			if(fileName.indexOf("\\") != -1){
				fileName = fileName.substring(fileItem.getName().lastIndexOf("\\")+1);
			}else{
				fileName = fileName.substring(fileItem.getName().lastIndexOf(File.separator)+1);
			}
		}
		String fileType = StringUtils.substringAfterLast(fileName, ".");
		String newFileName = generateFileName(StringUtils.substringBeforeLast(fileName, "."),fileType, prefix);
		File storeNewFile = new File(storeFile.getAbsolutePath() + File.separator + newFileName);
		try {
			fileItem.write(storeNewFile);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			fileItem.delete();
		}
		return storeNewFile.getAbsolutePath();
	}
	
    private static String generateFileName(String fileName, String fileTypeName, String prefix) {
    	prefix = "";
    	fileName = fileName.replaceAll(Constants.BLANK_SPACE_CHAR_REGEX, "-"); 
//    	prefix = prefix.replaceAll(Constants.BLANK_SPACE_CHAR_REGEX, "-"); 
//    	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
        StringBuilder sb = new StringBuilder();
//        sb.append(prefix+"-");
        sb.append(fileName);
//        sb.append(sf.format(System.currentTimeMillis()));
        sb.append("."+fileTypeName);
        return sb.toString();
    }
    
    public static String parseInputTagFile(MultipartHttpServletRequest multiRequest, String inputTagName, String destPath, String prefix){
    	
		MultipartFile msdsFile = multiRequest.getFile(inputTagName);
		if (msdsFile != null && msdsFile.getSize() > 0) {
			File storeFileFolder = new File(destPath);
			String msdsStorePath = uploadFileToStorePath(msdsFile, storeFileFolder, prefix);
			
			return msdsStorePath;
		}
		
    	return "";
    }
    
   public static String uploadFileToStorePathReplace(MultipartFile multipartFile, File storeFile, String prefix) {
	   
		if (null == storeFile || null == multipartFile) {
			return null;
		}
		
		if (!storeFile.isDirectory()) {
			boolean isSuccess = storeFile.mkdirs();
			if (!isSuccess) {
				return null;
			}
		}
		
		CommonsMultipartFile cmf = (CommonsMultipartFile)multipartFile;
		DiskFileItem fileItem = (DiskFileItem) cmf.getFileItem();
		String fileName = fileItem.getName();
		if(fileName.indexOf("\\") != -1 || fileName.indexOf(File.separator) != -1){
			if(fileName.indexOf("\\") != -1){
				fileName = fileName.substring(fileItem.getName().lastIndexOf("\\")+1);
			}else{
				fileName = fileName.substring(fileItem.getName().lastIndexOf(File.separator)+1);
			}
		}
		String fileType = StringUtils.substringAfterLast(fileName, ".");
		String newFileName = fileName.replaceAll(Constants.BLANK_SPACE_CHAR_REGEX, "-"); 
		File storeNewFile = new File(storeFile.getAbsolutePath() + File.separator + newFileName);
		try {
			fileItem.write(storeNewFile);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			fileItem.delete();
		}
		return storeNewFile.getAbsolutePath();
	}
}
