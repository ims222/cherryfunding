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
	public String charityForm() {
		return ".inputCharity";
	}

	@RequestMapping(value = "/charity/charityApplication", method = RequestMethod.POST)
	public String charityApplication(MultipartHttpServletRequest request, HttpSession session) {
		String title = request.getParameter("title"); // 지원서 양식
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		String amount = request.getParameter("amount");
		String category = request.getParameter("category");
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String[] hashtags = request.getParameterValues("hashtag");
		String cPrice = request.getParameter("cPrice");
		String[] cpinfo = request.getParameterValues("cPinfo");

		int cnum = charityService.getMaxNum() + 1; // 펀딩번호
		String uploadPath = session.getServletContext().getRealPath("/resources/upload/charity");
		File f = new File(uploadPath);
		if (f.exists() == false) { // 파일 생성
			f.mkdirs();
		}
		try { // 후원저장
			CharityVo cvo = new CharityVo();
			cvo.setcNum(cnum);
			cvo.setTitle(title);
			cvo.setContent(content);
			cvo.setAmount(Integer.parseInt(amount));
			System.out.println("sDate: " + sDate + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			java.util.Date jsdate = new SimpleDateFormat("yyyy-MM-dd").parse(sDate);
			cvo.setsDate(new Date(jsdate.getTime()));
			System.out.println("jsdate: " + jsdate + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			java.util.Date jedate = new SimpleDateFormat("yyyy-MM-dd").parse(eDate);
			cvo.seteDate(new Date(jedate.getTime()));
			cvo.setCategory(category);
			cvo.setcPrice(Integer.parseInt(cPrice));
			cvo.setConfirm("n");
			cvo.setAddr("");
			cvo.setaId("");
			cvo.setId(id);
			insertCharityService.cinsert(cvo); // db

			for (String hashtag : hashtags) { // 해시태그 저장
				if (hashtag != null && !hashtag.equals("")) {
					CHashtagVo chvo = new CHashtagVo(cHashtagService.getMaxNum() + 1, cnum, hashtag);
					insertCharityService.chinsert(chvo);
				}
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		List<MultipartFile> files = request.getFiles("cPicture");
		int num = 0;
		for (MultipartFile file : files) { // 사진들
			String orgfilename = file.getOriginalFilename();
			String savefilename = id + "_" + title + "_" + num + orgfilename;
			try { // 사진db저장
				long filesize = file.getSize();
				if (filesize > 0) {
					CPictureVo cpvo = new CPictureVo();
					cpvo.setCpNum(cPictureService.getMaxNum() + 1);
					cpvo.setcNum(cnum);
					cpvo.setSaveName(savefilename);
					cpvo.setOrgName(orgfilename);
					cpvo.setFileSize(filesize);
					cpvo.setCpinfo(cpinfo[num++]);
					insertCharityService.cpinsert(cpvo); // 저장
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
		return "redirect:/charity/ingCharityList";
	}
}
