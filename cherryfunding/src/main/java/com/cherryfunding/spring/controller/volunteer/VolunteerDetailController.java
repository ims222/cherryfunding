package com.cherryfunding.spring.controller.volunteer;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.volunteer.VRecommendService;
import com.cherryfunding.spring.service.volunteer.VolunteerListService;
import com.cherryfunding.spring.service.volunteer.VolunteerService;
import com.cherryfunding.spring.util.PageUtil;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.VolunteerVo;

@Controller
public class VolunteerDetailController {

	@Autowired
	private VolunteerService volunteerService;

	@Autowired
	private VolunteerListService volunteerListService;
	
	@Autowired
	private VRecommendService vRecommendService;
	
	@Autowired
	private S3Util s3;

	@RequestMapping(value = "/volunteer/volunteerDetail", method = RequestMethod.GET)
	public String volunteerDetail(int vNum, Model model) {
		model.addAttribute("vo", volunteerService.detail(vNum));
		return ".VolunteerDetail";
	}

	@RequestMapping("/volunteer/volunteerFirstShow")
	@ResponseBody
	public HashMap<String, Object> volunteerFirstShow(String pageNum, String vNum) { // 첫번째 6개 글
		int pageNumInt = Integer.parseInt(pageNum);
		int vNumInt = (volunteerService.getMaxNum())+1;
		int startNum = ((pageNumInt - 1) * 6) + 1; // 시작행 번호
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("vNum", vNumInt);
		List<VolunteerVo> list = volunteerService.showMore(map);
		for (VolunteerVo vo : list) {
			String thumbnail = volunteerListService.thumbnail(vo.getvNum()).getSaveName();
			vo.setSaveName(s3.getFileURL("volunteer/" + thumbnail));
			vo.setVpInfo(volunteerListService.thumbnail(vo.getvNum()).getVpInfo());
			vo.setRecommend(vRecommendService.getRecomm(vo.getvNum()));
		}
		map.put("startNum", startNum);
		map.put("vNum", vNumInt);
		map.put("list", list);
		return map;
	}
	
	@RequestMapping("/volunteer/volunteerShowMore")
	@ResponseBody
	public HashMap<String, Object> volunteerShowMore(String pageNum, String vNum) { // 페이지번호에 해당하는 글 6개를 얻어옴
		//System.out.println(pageNum +",,,,,,,,,,,,,,,,,,,,,,,,,,"+vNum);
		int pageNumInt = Integer.parseInt(pageNum);
		int vNumInt = Integer.parseInt(vNum);
		int startNum = ((pageNumInt - 1) * 6) + 1; // 시작행 번호
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("vNum", vNumInt);
		List<VolunteerVo> list = volunteerService.showMore(map);
		for (VolunteerVo vo : list) {
			String thumbnail = volunteerListService.thumbnail(vo.getvNum()).getSaveName();
			vo.setSaveName(s3.getFileURL("volunteer/" + thumbnail));
			vo.setVpInfo(volunteerListService.thumbnail(vo.getvNum()).getVpInfo());
			vo.setRecommend(vRecommendService.getRecomm(vo.getvNum()));
		}
		map.put("startNum", startNum);
		map.put("vNum", vNumInt);
		map.put("list", list);
		return map;
	}

	@RequestMapping("/volunteer/moreVolunteerList")
	@ResponseBody
	public String moreVolunteerList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
		PageUtil pageUtil = new PageUtil();//현재 페이지 번호(NULL이 들어오면 자동으로 1로 된다), 전체 페이지 번호 
		return null;
	}
}
