package com.chawuzhi.novel.common.base;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

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
	

}
