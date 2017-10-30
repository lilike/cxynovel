package com.chawuzhi.novel.module.index.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chawuzhi.novel.common.domain.TBook;
import com.chawuzhi.novel.common.domain.TBookExample;
import com.chawuzhi.novel.common.mapper.TBookMapper;
import com.chawuzhi.novel.module.index.service.TBookService;

@Service
@Transactional
public class TBookServiceImpl implements TBookService{

	@Autowired
	private TBookMapper tBookMapper;
	
	@Override
	public List<TBook> findAll() {
		return tBookMapper.selectByExample(new TBookExample());
	}

	@Override
	public TBook findByPrimaryKey(Integer id) {
		return tBookMapper.selectByPrimaryKey(id);
	}

}
