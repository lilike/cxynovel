package com.lyric.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chawuzhi.novel.domain.TUser;
import com.chawuzhi.novel.service.TUserService;

@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml"})  
public class TestUser {

	@Autowired
	private TUserService tUserService;
	
	@Test
	public void test01() throws Exception {
		
		TUser userById = tUserService.getUserById(1);
		System.out.println(userById.getQq());
	}
	
	
}
