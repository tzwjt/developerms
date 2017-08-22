package com.jsyouyun.developer.common.utils;

import java.io.File;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.IOException;

import java.io.BufferedOutputStream;
 import java.io.FileInputStream;
import java.io.FileOutputStream;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipOutputStream;


public class FileUtil {
	
	public static void writeFile(String fileName, String content, String targetPath) {
		//String data = " This content will append to the end of the file";
		try {
			System.out.println("fileName:" + fileName);
			File file =new File(fileName);

	      //if file doesnt exists, then create it
			if(!file.exists()){
				file.createNewFile();
			}

	      //true = append file
			FileWriter fileWritter = new FileWriter(file.getName(),true);
			BufferedWriter bufferWritter = new BufferedWriter(fileWritter);
			bufferWritter.write(content);
			bufferWritter.close();
			
			compressedFile(fileName, targetPath);
			System.out.println("file Done");
		} catch (Exception e) {
			 e.printStackTrace();
		} 
	}
	
	 /**
	25      * @desc 将源文件/文件夹生成指定格式的压缩文件,格式zip
	26      * @param resourePath 源文件/文件夹
	27      * @param targetPath  目的压缩文件保存路径
	28      * @return void
	29      * @throws Exception 
	30      */
	public static void compressedFile(String resourcesPath,String targetPath) throws Exception{
		System.out.println("resourcesPath:" + resourcesPath);
	       File resourcesFile = new File(resourcesPath);     //源文件
           File targetFile = new File(targetPath);           //目的
           //如果目的路径不存在，则新建
	         if(!targetFile.exists()){     
	            targetFile.mkdirs();  
	         }
	         
	         String targetName = resourcesFile.getName()+".zip";   //目的压缩文件名
	         FileOutputStream outputStream = new FileOutputStream(targetPath+"\\"+targetName);
	         ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(outputStream));
	         
	         createCompressedFile(out, resourcesFile, "");
	         
	         out.close();  
	         System.out.println("compressed Done");
	     }
	     
	     /**
	      * @desc 生成压缩文件。
	      *                  如果是文件夹，则使用递归，进行文件遍历、压缩
	      *       如果是文件，直接压缩
	      * @param out  输出流
	      * @param file  目标文件
	      * @return void
	      * @throws Exception 
	      */
	     public static void createCompressedFile(ZipOutputStream out,File file,String dir) throws Exception{
	         //如果当前的是文件夹，则进行进一步处理
	         if(file.isDirectory()){
	             //得到文件列表信息
	             File[] files = file.listFiles();
	             //将文件夹添加到下一级打包目录
	             out.putNextEntry(new ZipEntry(dir+"/"));
	             
	             dir = dir.length() == 0 ? "" : dir +"/";
	             
	             //循环将文件夹中的文件打包
	             for(int i = 0 ; i < files.length ; i++){
	                 createCompressedFile(out, files[i], dir + files[i].getName());         //递归处理
	             }
	         }
	         else{   //当前的是文件，打包处理
	             //文件输入流
	             FileInputStream fis = new FileInputStream(file);
	             
	             out.putNextEntry(new ZipEntry(dir));
	             //进行写操作
	             int j =  0;
	             byte[] buffer = new byte[1024];
	             while((j = fis.read(buffer)) > 0){
	                 out.write(buffer,0,j);
	             }
	             //关闭输入流
	             fis.close();
	         }
	     }

}
