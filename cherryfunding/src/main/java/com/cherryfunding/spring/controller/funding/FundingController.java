package com.cherryfunding.spring.controller.funding;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.TestLoginService;
import com.cherryfunding.spring.service.funding.FPictureService;
import com.cherryfunding.spring.service.funding.FundingService;
import com.cherryfunding.spring.service.funding.IngFundingListService;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;
import com.cherryfunding.spring.vo.UsersVo;

@Controller
public class FundingController {

	@Autowired
	private TestLoginService testLoginService;

	@Autowired
	private FundingService fundingService;

	@Autowired
	private FPictureService fPictureService;

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

	@RequestMapping(value = "/fundingList/showAll", method = RequestMethod.GET)
	public String list(Model model) { // 占쎌읈筌ｏ옙 占쏙옙占쎈뎃疫뀐옙 �겫�뜄�쑎占쎌궎疫뀐옙
		List<FundingVo> list = fundingService.list();
		model.addAttribute("list", list);
		return "funding/fundingBoard/fundingList";
	}

	@RequestMapping(value = "/fundingList/detail", method = RequestMethod.GET)
	public String detail(int num, Model model) {
		FundingVo vo = fundingService.select(num); // 湲� �븯�굹留� 議고쉶
		List<FPictureVo> list = fPictureService.list(num); // ���뵫踰덊샇濡� �씠誘몄��뙆�씪 議고쉶
		// service.addHit(num);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		// model.addAttribute("prev",prev);
		// model.addAttribute("next",next);
		return "/funding/fundingBoard/fundingDetail";
	}

	@RequestMapping(value = "/fundingList/delete", method = RequestMethod.GET)
	public String delete(int num, Model model) {
		int n = fundingService.delete(num); // �뼨�먯삕 �뜝�럡留믣뜝�럡�돪�뜝�럩�젧�솻洹⑥삕
		if (n > 0) {
			return "redirect:/fundingList/showAll";
		} else {
			return "error";
		}
	}

	@RequestMapping(value = "/fundingList/update", method = RequestMethod.GET)
	public String update(int num, Model model) {
		FundingVo vo = fundingService.select(num);
		model.addAttribute("vo", vo);
		return "/funding/fundingBoard/fundingUpdate";
	}

	@RequestMapping(value = "/fundingList/update", method = RequestMethod.POST)
	public String updateOk(FundingVo vo, Model model) {
		int n = fundingService.update(vo);
		if (n > 0) {
			return "redirect:/fundingList/showAll";
		} else {
			return "error";
		}
	}
}
