package com.chawuzhi.novel.module.index.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chawuzhi.novel.common.domain.TUser;
import com.chawuzhi.novel.common.mapper.TUserMapper;


@Service
@Transactional
public class TUserServiceImpl {

	@Autowired
	TUserMapper tUserMapper;
	
	public TUser getUserById(Integer id) {
		
		return tUserMapper.selectByPrimaryKey(id);
		
	}
	
	
}
