package com.cherryfunding.spring.controller.sharing;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cherryfunding.spring.service.sharing.SharingListService;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.ShareVo;

@Controller
public class SharingListController {

	@Autowired
	private S3Util s3;

	@Autowired
	private SharingListService sharingListService;

	@RequestMapping(value = "/sharing/sharingList", method = RequestMethod.GET)
	public String sharingList(Model model) {

		List<ShareVo> list = sharingListService.list();

		for (ShareVo vo : list) {
			String thumbnail = sharingListService.thumbnail(vo.getsNum()).getSaveName();
			vo.setSaveName(s3.getFileURL("sharing/" + thumbnail));
			vo.setsPinfo(sharingListService.thumbnail(vo.getsNum()).getsPinfo());
		}

		model.addAttribute("list", list);
		return ".sharingList";
	}

}
