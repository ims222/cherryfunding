package com.cherryfunding.spring.controller.sharing;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cherryfunding.spring.service.sharing.SharingListService;
import com.cherryfunding.spring.util.PageUtil;

@Controller
public class SharingListController {

	@Autowired
	private SharingListService sharingListService;
 
	@RequestMapping(value = "/sharing/sharingList", method = RequestMethod.GET)
	public String sharingList() {
		return ".sharingList";
	}

	@RequestMapping("/sharing/moreSharingList")
	@ResponseBody
	public HashMap<String, Object> sharingList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		PageUtil pageUtil = new PageUtil(pageNum, sharingListService.getTotCount());
		map.put("startRow", pageUtil.getStartRow());
		map.put("endRow", pageUtil.getEndRow());

		List<HashMap<String, Object>> list = sharingListService.list(map);

		if (list.size() == 0 && pageNum > 1) {
			map.put("list", "no");
			map.put("pageNum", pageNum);
		} else {
			map.put("list", list);
			map.put("pageNum", pageNum + 1);
		}
		return map;
	}

}
