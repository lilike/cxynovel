package com.chawuzhi.novel.common.mapper;

import java.util.List;

import com.chawuzhi.novel.common.domain.Menu;


public interface MenuMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

	List<Menu> getList();
}