package com.chawuzhi.novel.module.index.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chawuzhi.novel.common.domain.Menu;
import com.chawuzhi.novel.common.mapper.MenuMapper;
import com.chawuzhi.novel.module.index.service.MenuService;

@Service
@Transactional
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuMapper menuMapper;
	
	public List<Menu> getList() {
		return menuMapper.getList();
	}
	
}
