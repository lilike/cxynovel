package com.chawuzhi.novel.module.index.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chawuzhi.novel.common.domain.TSystemBlock;
import com.chawuzhi.novel.common.domain.TSystemBlockExample;
import com.chawuzhi.novel.common.mapper.TSystemBlockMapper;
import com.chawuzhi.novel.module.index.service.TSystemBlockService;

@Service
@Transactional
public class TSystemBlockServiceImpl implements TSystemBlockService {
	
	@Autowired
	private TSystemBlockMapper tSystemBlockMapper;
	
	@Override
	public List<TSystemBlock> findAll() {
		return tSystemBlockMapper.selectByExampleWithBLOBs(new TSystemBlockExample());
	}

}
