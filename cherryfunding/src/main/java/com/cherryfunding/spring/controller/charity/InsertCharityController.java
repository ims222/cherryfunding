package com.cherryfunding.spring.controller.charity;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherryfunding.spring.service.charity.CHashtagService;
import com.cherryfunding.spring.service.charity.CPictureService;
import com.cherryfunding.spring.service.charity.CharityService;
import com.cherryfunding.spring.service.charity.InsertCharityService;

import com.cherryfunding.spring.vo.CHashtagVo;
import com.cherryfunding.spring.vo.CPictureVo;
import com.cherryfunding.spring.vo.CharityVo;

@Controller
public class InsertCharityController {
	@Autowired
	private CHashtagService cHashtagService;

	@Autowired
	private CharityService charityService;

	@Autowired
	private CPictureService cPictureService;

	@Autowired
	private InsertCharityService insertCharityService;

	@RequestMapping(value = "/charity/charityApplication", method = RequestMethod.GET)
	public String CharityForm() {
		return ".inputCharity";
	}

	@RequestMapping(value = "/charity/charityApplication", method = RequestMethod.POST)
	public String charityApplication(MultipartHttpServletRequest request, HttpSession session) {
		String title = request.getParameter("title"); // Ïß??õê?Ñú ?ñë?ãù
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		String amount = request.getParameter("amount");
		String category = request.getParameter("category");
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String[] hashtags = request.getParameterValues("hashtag");
		String[] prices = request.getParameterValues("price");
		String[] cpinfo = request.getParameterValues("CPinfo");

		int cnum = charityService.getMaxNum() + 1; // ???î©Î≤àÌò∏
		String uploadPath = session.getServletContext().getRealPath("/resources/upload/charity");
		File f = new File(uploadPath);
		if (f.exists() == false) { // ?åå?ùº ?Éù?Ñ±
			f.mkdirs();
		}
		try { // ???î©???û•
			CharityVo cvo = new CharityVo();
			cvo.setcNum(cnum);
			cvo.setTitle(title);
			cvo.setContent(content);
			cvo.setAmount(Integer.parseInt(amount));
			java.util.Date jsdate = new SimpleDateFormat("yyyy-mm-dd").parse(sDate);
			cvo.setsDate(new Date(jsdate.getTime()));
			java.util.Date jedate = new SimpleDateFormat("yyyy-mm-dd").parse(eDate);
			cvo.seteDate(new Date(jedate.getTime()));
			cvo.setCategory(category);
			cvo.setConfirm("n");
			cvo.setAddr("");
			cvo.setaId("");
			cvo.setId(id);
			insertCharityService.cinsert(cvo); // db

			for (String hashtag : hashtags) { // ?ï¥?ãú?ÉúÍ∑? ???û•
				CHashtagVo chvo = new CHashtagVo(cHashtagService.getMaxNum() + 1, cnum, hashtag);
				insertCharityService.chinsert(chvo);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		List<MultipartFile> files = request.getFiles("cPicture");
		int num = 0;
		for (MultipartFile file : files) { // ?Ç¨ÏßÑÎì§
			String orgfilename = file.getOriginalFilename();
			String savefilename = id + "_" + title + "_" + num + orgfilename;
			try { // ?Ç¨ÏßÑdb???û•
				long filesize = file.getSize();
				if (filesize > 0) {
					CPictureVo cpvo = new CPictureVo();
					cpvo.setCpNum(cPictureService.getMaxNum() + 1);
					cpvo.setcNum(cnum);
					cpvo.setSaveName(savefilename);
					cpvo.setOrgName(orgfilename);
					cpvo.setFileSize(filesize);
					cpvo.setCpinfo(cpinfo[num++]);

					insertCharityService.cpinsert(cpvo); // ???û•
					InputStream is = file.getInputStream();
					FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + savefilename);
					FileCopyUtils.copy(is, fos);
					is.close();
					fos.close();
				}
			} catch (Exception io) {
				System.out.println(io.getMessage());
				return "error";
			}
		}
		return "charity/application/charityApplicationProcess";
	}
}
