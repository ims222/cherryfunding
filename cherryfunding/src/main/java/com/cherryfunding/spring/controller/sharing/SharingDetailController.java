package com.cherryfunding.spring.controller.sharing;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.sharing.SItemService;
import com.cherryfunding.spring.service.sharing.ShareService;

@Controller
public class SharingDetailController {

	@Autowired
	private ShareService shareService;
	
	@Autowired
	private SItemService sItemService;

	@RequestMapping(value="/sharing/sharingDetail", method=RequestMethod.GET)
	public String sharingDetail(int sNum, Model model) {
		model.addAttribute("vo", shareService.detail(sNum));
		model.addAttribute("itemList", sItemService.itemList(sNum));
		return ".sharingDetail";
	}

}
