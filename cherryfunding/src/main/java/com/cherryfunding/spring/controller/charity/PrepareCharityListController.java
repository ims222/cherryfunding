package com.cherryfunding.spring.controller.charity;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cherryfunding.spring.service.charity.PrepareCharityListService;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.CharityVo;

@Controller
public class PrepareCharityListController {

	@Autowired
	private S3Util s3;
	
	@Autowired
	private PrepareCharityListService prepareService;
	
	@RequestMapping("/charity/prepareCharityList")
	public String prepare(Model model, HttpServletRequest request) {
		String category = request.getParameter("category");
		String field = request.getParameter("field");
		String keyword = request.getParameter("keyword");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("field", field);
		map.put("keyword", keyword);
		map.put("category", request.getParameter("category"));
		List<CharityVo> list = prepareService.list(map);
		
		for (CharityVo vo : list) {
			String thumbnail = prepareService.thumbnail(vo.getcNum()).getSaveName();
			vo.setSavename(s3.getFileURL("charity/"+ thumbnail));
			vo.setCpinfo(prepareService.thumbnail(vo.getcNum()).getCpinfo());
		}
		model.addAttribute("list", list);
		model.addAttribute("category", category);
		model.addAttribute("field", field);
		model.addAttribute("keyword", keyword);
		return ".prepareCharityList";
	}
}
