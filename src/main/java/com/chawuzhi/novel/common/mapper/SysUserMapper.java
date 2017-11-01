package com.chawuzhi.novel.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chawuzhi.novel.common.domain.SysUser;


public interface SysUserMapper {
    int deleteByPrimaryKey(String userId);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

	List<SysUser> select(@Param( "userName") String userName ,@Param("password") String password);
}