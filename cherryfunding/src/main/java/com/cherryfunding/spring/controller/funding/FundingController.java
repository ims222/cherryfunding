package com.cherryfunding.spring.controller.funding;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherryfunding.spring.service.TestLoginService;
import com.cherryfunding.spring.service.funding.FHashtagService;
import com.cherryfunding.spring.service.funding.FPictureService;
import com.cherryfunding.spring.service.funding.FundingService;
import com.cherryfunding.spring.service.funding.RewardService;
import com.cherryfunding.spring.vo.FHashtagVo;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;
import com.cherryfunding.spring.vo.RewardVo;
import com.cherryfunding.spring.vo.UsersVo;

@Controller
public class FundingController {

	@Autowired
	private TestLoginService testLoginService;

	@Autowired
	private FundingService fundingService;

	@Autowired
	private FHashtagService fHashtagService;

	@Autowired
	private RewardService rewardService;
	
	@Autowired
	private FPictureService fPictureService; 

	// for Testing
	@RequestMapping(value = "/testlogin", method = RequestMethod.GET)
	public String loginForm() {
		return "cicadas_login";
	}

	@RequestMapping(value = "/testlogin", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		UsersVo vo = new UsersVo();
		vo.setId(id);
		vo.setPwd(pwd);
		if (testLoginService.login(vo) != null) {
			session.setAttribute("id", vo.getId());
		}
		return "cicadas";
	}

	@RequestMapping(value = "/funding/fundingApplication", method = RequestMethod.GET)
	public String fundingForm() {
		return "funding/application/fundingApplicationProcess";
	}

	@RequestMapping(value = "/funding/fundingApplication", method = RequestMethod.POST)
	public String fundingApplication(MultipartHttpServletRequest request, HttpSession session) {
		String title = request.getParameter("title");
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		String amount = request.getParameter("amount");
		String category = request.getParameter("category");
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String[] hashtags = request.getParameterValues("hashtag");
		String[] rewards = request.getParameterValues("reward");
		String[] prices = request.getParameterValues("price");
		String[] fpinfo = request.getParameterValues("fPinfo");

		int fnum = fundingService.getMaxNum() + 1;
		String uploadPath = session.getServletContext().getRealPath("/resources/upload");
		File f = new File(uploadPath);
		if (f.exists() == false) { // 폴더 만들기
			f.mkdirs();
		}
		try {
			FundingVo fvo = new FundingVo();
			fvo.setFnum(fnum);
			fvo.setTitle(title);
			fvo.setContent(content);
			fvo.setAmount(Integer.parseInt(amount));
			java.util.Date jsdate = new SimpleDateFormat("yyyy-mm-dd").parse(sDate);
			fvo.setSdate(new Date(jsdate.getTime()));
			java.util.Date jedate = new SimpleDateFormat("yyyy-mm-dd").parse(eDate);
			fvo.setEdate(new Date(jedate.getTime()));
			fvo.setCategory(category);
			fvo.setConfirm("n");
			fvo.setAddr("");
			fvo.setAid("");
			fvo.setId(id);
			fundingService.insert(fvo);

			for (String hashtag : hashtags) {
				FHashtagVo fhvo = new FHashtagVo(fHashtagService.getMaxNum() + 1, fnum, hashtag);
				fHashtagService.insert(fhvo);
			}

			for (int ind = 0; ind < rewards.length; ind++) {
				RewardVo rvo = new RewardVo();
				rvo.setRnum(rewardService.getMaxNum() + 1);
				rvo.setFnum(fnum);
				rvo.setTitle(rewards[ind]);
				rvo.setPrice(Integer.parseInt(prices[ind]));
				rewardService.insert(rvo);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		List<MultipartFile> files = request.getFiles("fPicture");
		int num = 0;
		for (MultipartFile file : files) {
			String orgfilename = file.getOriginalFilename();
			String savefilename = id + "_" + title + "_" + num + orgfilename;
			try { // 파일저장
				long filesize = file.getSize();
				FPictureVo fpvo = new FPictureVo();
				fpvo.setFpNum(fPictureService.getMaxNum() + 1);
				fpvo.setfNum(fnum);
				fpvo.setSavename(savefilename);
				fpvo.setOrgname(orgfilename);
				fpvo.setFilesize(filesize);
				fpvo.setFpinfo(fpinfo[num++]);

				fPictureService.insert(fpvo);
				if (filesize > 0) {
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
		return "funding/application/fundingApplicationProcess";
	}

	@RequestMapping(value = "/funding/ingFundingList", method = RequestMethod.GET)
	public String fundingList(Model model) {

		return "funding/fundingBoard/ingFundingList";
	}

	@RequestMapping(value = "/fundingList/showAll", method = RequestMethod.GET)
	public String list(Model model) { // 전체 목록
		List<FundingVo> list = fundingService.list();
		model.addAttribute("list", list);
		return "funding/fundingBoard/fundingList";
	}


	@RequestMapping(value = "/fundingList/detail", method = RequestMethod.GET)
	public String detail(int num, Model model) {
		FundingVo vo = fundingService.select(num); // 글 하나만 조회
		List<FPictureVo> list = fPictureService.list(num);	//펀딩번호로 이미지파일 조회
		// 조회수 증가시켜야 하는데 조회수가 필요한지 잘 모르겠음 
		// service.addHit(num);
		model.addAttribute("vo", vo);
		model.addAttribute("list",list);
		// model.addAttribute("prev",prev);
		// model.addAttribute("next",next);
		return "/funding/fundingBoard/fundingDetail";
	}

	@RequestMapping(value = "/fundingList/delete", method = RequestMethod.GET)
	public String delete(int num, Model model) {
		int n = fundingService.delete(num); // 疫뀐옙 占쎄맒占쎄쉭占쎌젟癰귨옙
		if (n > 0) {
			return "redirect:/fundingList/showAll";
		} else {
			return "error";
		}
	}
	
	@RequestMapping(value = "/fundingList/update", method = RequestMethod.GET)
	public String update(int num, Model model) {
		FundingVo vo = fundingService.select(num); 
		model.addAttribute("vo", vo);
		return "/funding/fundingBoard/fundingUpdate";
	}
	
	@RequestMapping(value = "/fundingList/update", method = RequestMethod.POST)
	public String updateOk(FundingVo vo, Model model) {
		int n = fundingService.update(vo);
		if(n>0) {
			return "redirect:/fundingList/showAll";
		}else {
			return "error";
		}
	}
}
