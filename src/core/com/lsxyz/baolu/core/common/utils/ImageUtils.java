package com.lsxyz.baolu.core.common.utils;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public class ImageUtils {

	public static void reduceImg(String imgsrc, String imgdist, int widthdist, int heightdist) {
		try {
			File srcfile = new File(imgsrc);
			if (!srcfile.exists()) {
				return;
			}
			Image src = javax.imageio.ImageIO.read(srcfile);
			
			System.out.println(src.getHeight(null));
			System.out.println(src.getWidth(null));
			
			BufferedImage tag = new BufferedImage((int) widthdist, (int) heightdist, BufferedImage.TYPE_INT_RGB);

			tag.getGraphics().drawImage(src.getScaledInstance(widthdist, heightdist,Image.SCALE_SMOOTH), 0, 0, null);

			FileOutputStream out = new FileOutputStream(imgdist);
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			encoder.encode(tag);
			out.close();

		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
	
//	public static void convertImg(String imgsrc, String imgdist, int widthdist, int heightdist) {
//		try {
//			File srcfile = new File(imgsrc);
//			if (!srcfile.exists()) {
//				return;
//			}
//			Image image = javax.imageio.ImageIO.read(srcfile);
//			BufferedImage tag = new BufferedImage((int) widthdist, (int) heightdist, BufferedImage.TYPE_INT_RGB);
//
//			tag.getGraphics().drawImage(image.getScaledInstance(widthdist, heightdist,Image.SCALE_SMOOTH), 0, 0, null);
//
//			FileOutputStream out = new FileOutputStream(imgdist);
//			
//			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
//			encoder.encode(tag);
//			out.close();
//
//		} catch (IOException ex) {
//			ex.printStackTrace();
//		}
//	}
	
	public static Image getImageByFilePath(String imgsrc) {
		try {
			File srcFile = new File(imgsrc);
			if (!srcFile.exists()) {
				return null;
			}
			return javax.imageio.ImageIO.read(srcFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static void convertImgLocal(String imgsrc, String imgdist, int widthdist, int heightdist) {
			
		File srcfile = new File(imgsrc);
		if(null == srcfile)
			return;
		File[] files = srcfile.listFiles();
		for(File file : files){
			if (!file.exists() || ( !file.getName().endsWith(".jpg") && !file.getName().endsWith(".JPG"))  ) {
				continue;
			}
			convertImg(file.getAbsolutePath(), imgdist+File.separator+file.getName(), widthdist, heightdist);
		}
	}
	
	public static String convertImg(String imgsrc, String imgdist, int widthdist, int heightdist) {
		try {
			File srcfile = new File(imgsrc);
			if (!srcfile.exists()) {
				return "";
			}
			Image image = javax.imageio.ImageIO.read(srcfile);
			int width = image.getWidth(null);
			int height = image.getHeight(null);
			
			if(width > widthdist && height > heightdist){
				if(width >= height){
					heightdist = (height*widthdist)/width;
				}else{
					widthdist = (heightdist*width)/height;
				}
			}else if(width >= widthdist){
				heightdist = (height*widthdist)/width;
			}else if(height >= heightdist){
				widthdist = (heightdist*width)/height;
			}else{
				if(widthdist > width && heightdist > height ) {
					widthdist = width;
					heightdist = height;
				}
			}
			
//			if(height < heightdist){
//				heightdist = height;
//			}
//			if(heightdist == -1){
//				heightdist = 0;
//			}
//			if(width<widthdist || widthdist == -1){
//				widthdist = width;
//			}else{
//				if(heightdist == 0){
//					heightdist = (height*widthdist)/width;
//				}
//			}
			
			BufferedImage tag = new BufferedImage((int) widthdist, (int) heightdist, BufferedImage.TYPE_INT_RGB);
			tag.getGraphics().drawImage(image.getScaledInstance(widthdist, heightdist,Image.SCALE_SMOOTH), 0, 0, null);
			FileOutputStream out = new FileOutputStream(imgdist);
			
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			encoder.encode(tag);
			out.close();

		} catch (IOException ex) {
			ex.printStackTrace();
		}
		
		return imgdist;
	}
	
	public static void generateMinaturePics(){
		String projectLocalPath = "";
		String pictureZoomPath = "";
		String pictureSrcPath = "";
		
		int pictureZoomWidth = MyStringUtils.toInteger("");
		int pictureZoomHeight = MyStringUtils.toInteger("");
		
		ImageUtils.convertImgLocal(projectLocalPath + pictureSrcPath, projectLocalPath+pictureZoomPath, pictureZoomWidth, pictureZoomHeight);
		
	}
	
	public static void main(String args[]){
		
		ImageUtils.convertImgLocal("/home/sean/work/project/abgent/document/none_min_img", "/home/sean/work/project/abgent/document/none_min_img/minature", 150, 150);
		
		/*int final_width=500;
		int final_hight = 0;
		
		String imgsrc = "C:/11.jpg";
		String imgdist = "C:/test/13.jpg";
		
		Image image = ImageUtils.getImageByFilePath(imgsrc);
		int width = image.getWidth(null);
		int height = image.getHeight(null);
		System.out.println(width);
		System.out.println(height);
		if(width < final_width){
			ImageUtils.convertImg(imgsrc, imgdist, 150, 150);
		}
		if(width > final_width){
			ImageUtils.convertImg(imgsrc, imgdist, 150, 150);
		}*/
		
//		ImageUtils.reduceImg("C:/11.jpg", "C:/test/13.jpg", 400, 200);
	}
}
