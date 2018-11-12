package com.cherryfunding.spring.controller.charity;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value = "/charity/relatedWords", method = RequestMethod.GET)
	@ResponseBody
	public List<String> relatedWords(Model model, HttpServletRequest request) {
		System.out.println("컨트롤러");
		String keyword = request.getParameter("keyword");
		String field = request.getParameter("field");
		// 한글로 넘어온 필드를 원 컬럼명으로 변경
		if (field.equals("제목")) {
			field = "title";
		} else if (field.equals("내용")) {
			field = "content";
		} else {
			field = "id";
		}
		// 해당 field에서 keyword가 포함된 단어 5개를 List<String>로 얻어오기
		List<String> list = ingCharityListService.relatedWords(keyword, field);
		model.addAttribute("list", list);
		return list;
	}
}