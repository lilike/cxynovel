package com.chawuzhi.novel.module.index.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chawuzhi.novel.module.index.service.TUserService;



@Controller
@RequestMapping("/index")
public class DemoController {

	@Autowired
	private TUserService tUserService;
	
	@RequestMapping("")
	public String toIndex(HttpServletRequest request,Model model) {
		model.addAttribute("contextPath", request.getContextPath());
		return "pc/index";
	}
}
