package com.lsxyz.baolu.core.common.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class WriteAndReadText {
	/**
     * Path
     */
    private String textPath;   
    /**  
     * Read text content
     * @param textname file name
     * @return  
     */  
    public String readText(String textname){   
        File file=new File(textPath+File.separator+textname);   
        try {   
            BufferedReader br = new BufferedReader(new java.io.FileReader(file));   
            StringBuffer sb = new StringBuffer();   
            String line = br.readLine();   
            while (line != null) {   
                sb.append(line);   
                line = br.readLine();   
            }   
            br.close();   
            return sb.toString();   
        } catch (IOException e) {   
            e.printStackTrace();   
            return null;   
        }   
    }   
   
    /**  
     * write content to file
     * @param textname　file name
     * @param data content
     * @return  
     */  
    public boolean writeText(String textname,String data){   
        boolean flag=false;   
        File filePath=new File(textPath);   
        if(!filePath.exists()){   
            filePath.mkdirs();   
        }   
        try {   
            FileWriter fw =new FileWriter(textPath+File.separator+textname);   
            fw.write(data);
            flag=true;   
            if(fw!=null)   
                fw.close();   
        } catch (IOException e) {   
            e.printStackTrace();   
        }   
  
        return flag;           
    }   
    /**  
     * append content  
     * @param textName  
     * @param data
     * @return  
     */  
    public boolean appendText(String textName,String data){   
        boolean flag=false;   
        File filePath=new File(textPath);   
        if(!filePath.exists()){   
            filePath.mkdirs();   
        }   
        try {   
            FileWriter fw =new FileWriter(textPath+File.separator+textName,true);   
            fw.append(data);
            flag=true;   
            if(fw!=null)   
                fw.close();   
        } catch (IOException e) {   
            e.printStackTrace();   
        }   
        return flag;       
    }   
    public String getTextPath() {   
        return textPath;   
    }   
    public void setTextPath(String textPath) {   
        this.textPath = textPath;   
    }   

}
