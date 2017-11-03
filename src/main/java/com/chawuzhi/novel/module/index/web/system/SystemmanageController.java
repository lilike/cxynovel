package com.chawuzhi.novel.module.index.web.system;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chawuzhi.novel.common.domain.SysUser;
import com.chawuzhi.novel.module.index.service.SysUserService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/system")
public class SystemmanageController {
	@Autowired
	private SysUserService sysUserService;
	
	@RequestMapping("/sysUserList")
	public String getSysUserList() {
		return "/system/jsp/sysUserList";
	}
	
	@ResponseBody
	@RequestMapping("/getList")
	public Map<String, Object> getList(HttpServletRequest request,String page,String rows) {
		String pageNum = page;
		String pageSize = rows;
		Map<String, Object> params = new HashMap<>();
		params.put("pageNum", pageNum);
		params.put("pageSize", pageSize);
		PageInfo<SysUser> result = sysUserService.getList(params);
		
		Map<String, Object> data = new HashMap<>();
		data.put("page", result.getPageNum());
		data.put("records", result.getTotal());
		data.put("rows", result.getList());
		data.put("total", result.getPages());
		return data;
		
	}
}
