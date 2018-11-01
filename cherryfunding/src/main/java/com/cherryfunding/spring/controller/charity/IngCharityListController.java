package com.cherryfunding.spring.controller.charity;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.charity.IngCharityListService;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.CharityVo;


@Controller
public class IngCharityListController {
	@Autowired
	private S3Util s3;
	@Autowired
	IngCharityListService ingCharityListService;

	@RequestMapping(value = "/charity/ingCharityList", method = RequestMethod.GET)
	public String ingCharityList(Model model, HttpServletRequest request) {
		String category = request.getParameter("category");
		String field = request.getParameter("field");
		String keyword = request.getParameter("keyword");
		String sort = request.getParameter("sort");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("sort", sort);
		List<CharityVo> list = ingCharityListService.list(map);

		for (CharityVo vo : list) {
			String thumbnail = ingCharityListService.thumbnail(vo.getcNum()).getSaveName();
			vo.setSavename(s3.getFileURL("charity/"+ thumbnail));
			vo.setCpinfo(ingCharityListService.thumbnail(vo.getcNum()).getCpinfo());
		}
		
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sort", sort);
		return ".ingCharityList";
	}
}