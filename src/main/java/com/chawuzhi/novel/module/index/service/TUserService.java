package com.chawuzhi.novel.module.index.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chawuzhi.novel.common.domain.TUser;

public interface TUserService {
	
	public TUser getUserById(Integer id);
	
	
}
