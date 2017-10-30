package com.chawuzhi.novel.module.index.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chawuzhi.novel.common.base.BaseController;
import com.chawuzhi.novel.common.constant.PageType;
import com.chawuzhi.novel.common.domain.TBook;
import com.chawuzhi.novel.common.domain.TSystemBlock;
import com.chawuzhi.novel.module.index.service.TBookService;
import com.chawuzhi.novel.module.index.service.TSystemBlockService;



@Controller
@RequestMapping("/index")
public class DemoController extends BaseController {

	@Autowired
	private TSystemBlockService tSystemBlockService;
	@Autowired
	private TBookService tBookService;
	
	
	@RequestMapping("")
	public String toIndex(HttpServletRequest request,Model model) {
		// 初始化页面内容
		initialPageData(request, model);
		model.addAttribute("pageType", PageType.publicPage);

		// 封装系统块
		List<TSystemBlock> tSystemBlocks = tSystemBlockService.findAll();
		getSystemBlockBooks(tSystemBlocks);
		Map<String,TSystemBlock> blocks = new HashMap<>();
		for (TSystemBlock tSystemBlock : tSystemBlocks) {
			blocks.put(tSystemBlock.getBlockId(), tSystemBlock);
		}
		model.addAttribute("blocks", blocks);
		return "pc/index";
	}

	private void getSystemBlockBooks(List<TSystemBlock> blocks) {

		for (TSystemBlock tSystemBlock : blocks) {
			// 推荐书的内容
			String content = tSystemBlock.getContent();
			if (content == null || tSystemBlock.getBlockId().equals("friend_link")) {
				continue;
			}
			String[] ids = content.split(",");
			for (String id : ids) {
				TBook book = tBookService.findByPrimaryKey(StringUtils.isBlank(id)?0:Integer.parseInt(id));
			
			String blockId = tSystemBlock.getBlockId();
				switch (blockId) {
				case "index_yanqing_tuijian":
					tSystemBlock.getIndex_yanqing_tuijian().add(book);
					break;
				case "last_insert_list":
					tSystemBlock.getLast_insert_list().add(book);
					break;
				case "index_wuxia_tuijian":
					tSystemBlock.getIndex_wuxia_tuijian().add(book);
					break;
				case "index_xuanhuan_tuijian":
					tSystemBlock.getIndex_xuanhuan_tuijian().add(book);
					break;
				case "index_junshi_tuijian":
					tSystemBlock.getIndex_junshi_tuijian().add(book);
					break;
				case "index_kongbu_tuijian":
					tSystemBlock.getIndex_kongbu_tuijian().add(book);
					break;
				case "last_update_list":
					tSystemBlock.getLast_update_list().add(book);
					break;
				default:
					break;
				}
			}
		}
	}
}
