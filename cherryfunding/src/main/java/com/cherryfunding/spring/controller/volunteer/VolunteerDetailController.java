package com.cherryfunding.spring.controller.volunteer;

import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.volunteer.VolunteerListService;
import com.cherryfunding.spring.service.volunteer.VolunteerService;
import com.cherryfunding.spring.vo.VolunteerVo;

@Controller
public class VolunteerDetailController {
	
	@Autowired
	private VolunteerService volunteerService;
	
	@Autowired
	private VolunteerListService volunteerListService;
	
	@RequestMapping(value="/volunteer/volunteerDetail", method=RequestMethod.GET)
	public String volunteerDetail(int vNum, Model model) {
		model.addAttribute("vo", volunteerService.detail(vNum));
		return ".VolunteerDetail";
	}
	
	@RequestMapping("/volunteer/volunteerShowMore")
	@ResponseBody
	public HashMap<String, Object> volunteerShowMore(String pageNum, String vNum) {	//페이지번호에 해당하는 글 6개를 얻어옴
		int pageNumInt = Integer.parseInt(pageNum);
		int vNumInt = Integer.parseInt(vNum);
		int startNum = ((pageNumInt-1)*6)+1;	//시작행 번호
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("vNum", vNumInt);
		List<VolunteerVo> list = volunteerService.showMore(map);
		for (VolunteerVo vo : list) {
			vo.setSaveName(volunteerListService.thumbnail(vo.getvNum()).getSaveName());
			vo.setVpInfo(volunteerListService.thumbnail(vo.getvNum()).getVpInfo());
		}
		//System.out.println("////////////////////////////////리스트: " + list);
		//System.out.println("맵:" + map);
		map.put("startNum", startNum);
		map.put("vNum", vNumInt);
		map.put("list", list);
		return map;
	}
}
