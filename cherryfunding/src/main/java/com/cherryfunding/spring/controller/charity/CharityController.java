package com.cherryfunding.spring.controller.charity;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.charity.CPictureService;
import com.cherryfunding.spring.service.charity.CharityService;
import com.cherryfunding.spring.vo.CPictureVo;
import com.cherryfunding.spring.vo.CharityVo;

@Controller
public class CharityController {
	@Autowired
	private CharityService charityService;
 
	@Autowired
	private CPictureService cPictureService;

	@RequestMapping(value = "/charityList/showAll", method = RequestMethod.GET)
	public String list(Model model) { // ?��?��?��筌ｏ?�� ?��?��?��?��?��?��?��?�옙 �겫�뜄�쑎?��?��궎疫?�옙
		List<CharityVo> list = charityService.list();
		model.addAttribute("list", list);
		return "charity/charitytBoard/charityList";
	}

	@RequestMapping(value = "/charityList/detail", method = RequestMethod.GET)
	public String detail(int num, Model model) {
		CharityVo vo = charityService.select(num); // 湲� �븯�굹留� 議고?��
		List<CPictureVo> list = cPictureService.list(num); // ���뵫踰덊?��濡� �씠誘몄��?���씪 議고?��
		// service.addHit(num);
		model.addAttribute("vo", vo);
		model.addAttribute("list", list);
		// model.addAttribute("prev",prev);
		// model.addAttribute("next",next);
		return "/charity/charitytBoard/charityDetail";
	}

	@RequestMapping(value = "/charityList/delete", method = RequestMethod.GET)
	public String delete(int num, Model model) {
		int n = charityService.delete(num); // �뼨�먯?�� �뜝�럡留�?�뜝�럡�돪�뜝�럩�젧�솻洹⑥?��
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
		return "/charity/charitytBoard/charityUpdate";
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
