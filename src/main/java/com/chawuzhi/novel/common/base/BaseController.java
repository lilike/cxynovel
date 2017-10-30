package com.chawuzhi.novel.common.base;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import com.alibaba.fastjson.JSON;
import com.chawuzhi.novel.module.listener.DataInitProcessorListener;
import com.google.common.base.Splitter;
import com.google.common.collect.Lists;



public class BaseController {

	public String toPage(HttpServletRequest request, HttpServletResponse response, Model model) {
		String servletPath = request.getServletPath();
		List<String> list = Lists.newArrayList(Splitter.on("/").trimResults().omitEmptyStrings().limit(3).split(servletPath));
		// url:sys/user  => sys/user_index.jsp
		// url:sys/user/index  => sys/user_index.jsp
		if(list.size()<=2){
			list.add("index");
		}
		String page=list.get(0)+"/"+list.get(1)+"_"+list.get(2);
		String modelName=list.get(0)+"/"+list.get(1);
		model.addAttribute("model", modelName);
		return page;
	}
	
	public String toPage(HttpServletRequest request, HttpServletResponse response, Model model,String page){
		String servletPath = request.getServletPath();
		List<String> list = Lists.newArrayList(Splitter.on("/").trimResults().omitEmptyStrings().limit(3).split(servletPath));
		if(list.size()<=2){
			list.add("index");
		}
		page=list.get(0)+"/"+page;
		String modelName=list.get(0)+"/"+list.get(1);
		model.addAttribute("model", modelName);
		return page;
	}
	
	/**
	 * 初始化页面某些不变化的数据
	 * @param model
	 */
	public void initialPageData(HttpServletRequest request,Model model) {
		// 路径
		model.addAttribute("contextPath", request.getContextPath());
		// 系统分类表
		model.addAttribute("categoryData",JSON.toJSONString(DataInitProcessorListener.categoryMap));
		// 系统名称
		model.addAttribute("labelSystemTitle",DataInitProcessorListener.packageMap.get("label.system.title"));
		model.addAttribute("labelSystemName",DataInitProcessorListener.packageMap.get("label.system.name"));
		model.addAttribute("labelSystemSiteDescription",DataInitProcessorListener.packageMap.get("label.system.siteDescription"));
		model.addAttribute("labelSystemSiteKeywords",DataInitProcessorListener.packageMap.get("label.system.siteKeywords"));
		model.addAttribute("labelSystemUrl",DataInitProcessorListener.packageMap.get("label.system.url"));
		model.addAttribute("labelSystemCopyright",DataInitProcessorListener.packageMap.get("label.system.copyright"));
		model.addAttribute("labelSystemBeianNo",DataInitProcessorListener.packageMap.get("label.system.beianNo"));
		model.addAttribute("labelSystemAnalyticscode",DataInitProcessorListener.packageMap.get("label.system.analyticscode"));
		model.addAttribute("labelSystemSupport",DataInitProcessorListener.packageMap.get("label.system.support"));
	}
	

}
