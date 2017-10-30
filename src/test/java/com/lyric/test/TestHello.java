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
public class TestHello {

	@Autowired
	private TSystemBlockService tSystemBlockService;
	
	@Autowired
	private TBookService tBookService;
	
	@Test
	public void test01() {
		try {
			List<TBook> findAll = tBookService.findAll();
			for (TBook tBook : findAll) {
				System.out.println("=====");
				System.out.println(tBook);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void test02() {
		
		List<TSystemBlock> findAll = tSystemBlockService.findAll();
		for (TSystemBlock tSystemBlock : findAll) {
			System.out.println(tSystemBlock.getContent());
			System.out.println(tSystemBlock.getBlockName());
		}
		
		
	}
	
	
	
}
