package com.lyric.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.chawuzhi.novel.common.domain.TBook;
import com.chawuzhi.novel.common.domain.TSystemBlock;
import com.chawuzhi.novel.module.index.service.TBookService;
import com.chawuzhi.novel.module.index.service.TSystemBlockService;


@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml"})  
public class TestUser {

	@Autowired
	private TSystemBlockService tSystemBlockService;
	
	@Autowired
	private TBookService tBookService;
	
	@Test
	public void test01() throws Exception {
		List<TSystemBlock> findAll = tSystemBlockService.findAll();
		for (TSystemBlock tSystemBlock : findAll) {
			System.out.println(tSystemBlock);
		}
	}
	
	
	@Test
	private void test02() {
		List<TBook> findAll = tBookService.findAll();
		for (TBook tBook : findAll) {
			System.out.println(tBook);
		}
		
	}
	
	@Test
	public void test010() {
		System.out.println("haha");
	
	}
	
	public static void main(String[] args) {
		System.out.println("hello");
	}
	
}
