package com.chawuzhi.novel.module.index.service;

import java.util.Map;

import com.chawuzhi.novel.common.domain.SysUser;
import com.github.pagehelper.PageInfo;

public interface SysUserService {
	
	/**
	 * 登陆验证
	 * @param sysUser
	 * @return
	 */
	public boolean validate(SysUser sysUser);

	/**
	 * 查询系统用户列表
	 * @param params
	 * @return
	 */
	public PageInfo<SysUser> getList(Map<String, Object> params);
	
}
