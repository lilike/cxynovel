package com.chawuzhi.novel.module.listener;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

public class DataInitProcessorListener implements ServletContextListener {

	/**'
	 * 分类信息Map
	 */
	public static Map<String,String> categoryMap = new LinkedHashMap<String,String>();
	
	/**
	 * 所有的配置文件
	 */
	public static Map<String,String> packageMap = new LinkedHashMap<String,String>();
	
	private void initData() throws Exception {

		//Properties languageConf = new Properties(Thread.currentThread().getContextClassLoader().getResource("language/package.properties"));
		//String value = languageConf.getString("collectionProperties.article.category");
		Properties pro = new Properties();
		String pathStr = this.getClass().getClassLoader().getResource("package.properties").toURI().getPath();
		 if("\\".equals(File.separator)) {
			 pathStr = pathStr.substring(1).replaceAll("/", "\\\\");
		}
		InputStream in = new FileInputStream(new File(pathStr));
			pro.load(in);
			// 初始化小说分类
			initCategoryData(pro);
			
			// 初始化
			initPackageData(pro);
		
	}


	private void initPackageData(Properties pro) {
		for (Object key : pro.keySet()) {
			String keyStr = key.toString();
			packageMap.put(keyStr, pro.getProperty(keyStr));
		}
	}


	private void initCategoryData(Properties pro) {
		String value = (String) pro.get("collectionProperties.article.category");
		String[] items = StringUtils.split(value, ",");
		for (int j = 0; j < items.length; j++) {
			String[] property = StringUtils.split(items[j], ":");
			if (property.length == 2) {
				categoryMap.put(property[0], property[1]);
			}
		}
	}

	
	public static void main(String[] args) throws Exception {
//		DataInitProcessorListener dp = new DataInitProcessorListener();
//		try {
//			dp.initData();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println(packageMap);
//		System.err.println(categoryMap);
		System.out.println(DataInitProcessorListener.class.getClassLoader().getResource("package.properties").toURI().getPath().substring(1));

	}


	@Override
	public void contextInitialized(ServletContextEvent sce) {
		try {
			initData();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}
		
	
	
}
