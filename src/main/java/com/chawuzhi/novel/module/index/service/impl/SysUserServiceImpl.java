package com.chawuzhi.novel.module.index.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chawuzhi.novel.common.domain.SysUser;
import com.chawuzhi.novel.common.mapper.SysUserMapper;
import com.chawuzhi.novel.common.utils.CommonUtil;
import com.chawuzhi.novel.module.index.service.SysUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
@Transactional
public class SysUserServiceImpl implements SysUserService {

	@Autowired
	private SysUserMapper sysUserMapper;
	
	public boolean validate(SysUser sysUser) {
		if (sysUser != null && !CommonUtil.isEmpty(sysUser.getUserName()) && !CommonUtil.isEmpty(sysUser.getPassword())) {
			List<SysUser> list = sysUserMapper.select(sysUser.getUserName(),sysUser.getPassword());
			if(list.size() > 0) {
				try {
					BeanUtils.copyProperties(sysUser,list.get(0));
				} catch (Exception e) {
					e.printStackTrace();
					return false;
				}
				return true;
			}
			return false;
		}
		return false;
	}

	@Override
	public PageInfo<SysUser> getList(Map<String, Object> params) {
		PageHelper.startPage(Integer.parseInt((String)params.get("pageNum"))+1, Integer.parseInt((String)params.get("pageSize")));
		List<SysUser> selectAll = sysUserMapper.selectAll();
		PageInfo<SysUser> pageInfo = new PageInfo<>(selectAll);
		return pageInfo;
	}
	
}
