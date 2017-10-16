package com.chawuzhi.novel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chawuzhi.novel.domain.TUser;
import com.chawuzhi.novel.mapper.TUserMapper;


@Service
@Transactional
public class TUserService {

	@Autowired
	TUserMapper tUserMapper;
	
	public TUser getUserById(Integer id) {
		
		return tUserMapper.selectByPrimaryKey(id);
		
	}
	
	
}
