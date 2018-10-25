package com.cherryfunding.spring.controller.charity;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.TestLoginService;
import com.cherryfunding.spring.service.charity.CPictureService;
import com.cherryfunding.spring.service.charity.CharityService;

import com.cherryfunding.spring.vo.CPictureVo;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.UsersVo;

@Controller
public class CharityController {

	@Autowired
	private TestLoginService testLoginService;

	@Autowired
	private CharityService charityService;

	@Autowired
	private CPictureService cPictureService;

	// for Testing
	@RequestMapping(value = "/testlogin", method = RequestMethod.GET)
	public String loginForm() {
		return "cicadas_login";
	}

	@RequestMapping(value = "/testlogin", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		UsersVo vo = new UsersVo();
		vo.setId(id);
		vo.setPwd(pwd);
		if (testLoginService.login(vo) != null) {
			session.setAttribute("id", vo.getId());
		}
		return "cicadas";
	}

	@RequestMapping(value = "/charityList/showAll", method = RequestMethod.GET)
	public String list(Model model) { // ? ?Œ?ˆç­Œï½?˜™ ? ?™?˜™? ?ˆ?ƒ?–«?ì˜™ ï¿½ê²«ï¿½ëœ„ï¿½ì‘? ?Œê¶ç–«?ì˜™
		List<CharityVo> list = charityService.list();
		model.addAttribute("list", list);
		return "charity/charityBoard/charityList";
	}

	@RequestMapping(value = "/charityList/detail", method = RequestMethod.GET)
	public String detail(int num, Model model) {
		CharityVo vo = charityService.select(num); // æ¹²ï¿½ ï¿½ë¸¯ï¿½êµ¹ï§ï¿½ è­°ê³ ?‰¶
		List<CPictureVo> list = cPictureService.list(num); // ï¿½ï¿½ï¿½ëµ«è¸°ëŠ?ƒ‡æ¿¡ï¿½ ï¿½ì” èª˜ëª„ï¿½ï¿½?™†ï¿½ì”ª è­°ê³ ?‰¶
		// service.addHit(num);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		// model.addAttribute("prev",prev);
		// model.addAttribute("next",next);
		return "/charity/charityBoard/charityDetail";
	}

	@RequestMapping(value = "/charityList/delete", method = RequestMethod.GET)
	public String delete(int num, Model model) {
		int n = charityService.delete(num); // ï¿½ë¼¨ï¿½ë¨¯?‚• ï¿½ëœï¿½ëŸ¡ï§ë?£ëœï¿½ëŸ¡ï¿½ëªï¿½ëœï¿½ëŸ©ï¿½ì §ï¿½ì†»æ´¹â‘¥?‚•
		if (n > 0) {
			return "redirect:/charityList/showAll";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/charityList/update", method = RequestMethod.GET)
	public String update(int num, Model model) {
		CharityVo vo = charityService.select(num);
		model.addAttribute("vo", vo);
		return "/charity/charityBoard/charityUpdate";
	}

	@RequestMapping(value = "/charityList/update", method = RequestMethod.POST)
	public String updateOk(CharityVo vo, Model model) {
		int n = charityService.update(vo);
		if (n > 0) {
			return "redirect:/charityList/showAll";
		} else {
			return "error";
		}
	}
}
