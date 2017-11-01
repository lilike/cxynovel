package com.chawuzhi.novel.module.index.web.system;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chawuzhi.novel.common.constant.PageCodeEnum;
import com.chawuzhi.novel.common.constant.SessionKeyConst;
import com.chawuzhi.novel.common.domain.SysUser;
import com.chawuzhi.novel.module.index.service.SysUserService;

/**
 * 登录相关
 */
@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private SysUserService sysUserService;
	
	@Autowired
	private HttpSession session;

	/**
	 * 登录页面
	 */
	@RequestMapping
	public String index() {
		return "/login";
	}

	/**
	 * session超时
	 */
	@RequestMapping("/sessionTimeout")
	public String sessionTimeout(Model model) {
		model.addAttribute(PageCodeEnum.KEY, PageCodeEnum.SESSION_TIMEOUT);
		return "/system/error";
	}
//	
//	/**
//	 * 没有权限访问
//	 */
//	@RequestMapping("/noAuth")
//	public String noAuth(Model model) {
//		model.addAttribute(PageCodeEnum.KEY, PageCodeEnum.NO_AUTH);
//		session.invalidate();
//		return "/system/error";
//	}

	/**
	 * 验证用户名/密码是否正确 验证通过跳转至后台管理首页，验证失败，返回至登录页。
	 */
	@RequestMapping("/validate")
	public String validate(SysUser sysUser, RedirectAttributes attr) {
		if (sysUserService.validate(sysUser)) {
			session.setAttribute(SessionKeyConst.USER_INFO,sysUser);
			/*GroupDto groupDto = groupService.getByIdWithMenuAction(userDto.getGroupId());
			session.setAttribute(SessionKeyConst.MENU_INFO,groupDto.getMenuDtoList());*/
			return "redirect:/system/jsp/index.jsp";
		}
		//重定向后传的参数缓存一下。
		attr.addFlashAttribute(PageCodeEnum.KEY, PageCodeEnum.LOGIN_FAIL);
		return "redirect:/login";
	}
}