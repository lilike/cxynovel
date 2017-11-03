package com.chawuzhi.novel.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.chawuzhi.novel.common.domain.SysUser;
import com.github.pagehelper.PageInfo;


public interface SysUserMapper {
    int deleteByPrimaryKey(String userId);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(String userId);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

    /**
     * 通过用户名和密码查询用户
     * @param userName
     * @param password
     * @return
     */
	List<SysUser> select(@Param( "userName") String userName ,@Param("password") String password);

	/**
	 * 查询所有系统用户
	 * @return
	 */
	List<SysUser> selectAll();
}