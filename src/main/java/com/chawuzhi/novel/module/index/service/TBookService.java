package com.chawuzhi.novel.module.index.service;

import java.util.List;

import com.chawuzhi.novel.common.domain.TBook;

public interface TBookService {

	List<TBook> findAll();
	
	
	TBook findByPrimaryKey(Integer id);
}
