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
		String title = request.getParameter("title"); //폼 정보
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

		int fnum = fundingService.getMaxNum() + 1; //펀딩 인덱스
		String uploadPath = session.getServletContext().getRealPath("/resources/upload");
		File f = new File(uploadPath);
		if (f.exists() == false) { // 폴더 만들기
			f.mkdirs();
		}
		try { //펀딩 지원서 저장
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
			fundingService.insert(fvo); //db

			for (String hashtag : hashtags) { //해시태그 저장
				FHashtagVo fhvo = new FHashtagVo(fHashtagService.getMaxNum() + 1, fnum, hashtag);
				fHashtagService.insert(fhvo);
			}

			for (int ind = 0; ind < rewards.length; ind++) { //리와드 저장
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
		for (MultipartFile file : files) { //파일들
			String orgfilename = file.getOriginalFilename();
			String savefilename = id + "_" + title + "_" + num + orgfilename;
			try { // 파일저장
				long filesize = file.getSize();
				if (filesize > 0) {
					FPictureVo fpvo = new FPictureVo();
					fpvo.setFpNum(fPictureService.getMaxNum() + 1);
					fpvo.setfNum(fnum);
					fpvo.setSavename(savefilename);
					fpvo.setOrgname(orgfilename);
					fpvo.setFilesize(filesize);
					fpvo.setFpinfo(fpinfo[num++]);

					fPictureService.insert(fpvo); //파일 정보 저장
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
	public String list(Model model) { // �쟾泥� ���뵫湲� 遺덈윭�삤湲�
		List<FundingVo> list = fundingService.list();
		model.addAttribute("list", list);
		return "funding/fundingBoard/fundingList";
	}

	@RequestMapping(value = "/fundingList/detail", method = RequestMethod.GET)
	public String detail(int num, Model model) {
		FundingVo vo = fundingService.select(num); // 疫뀐옙 占쎄맒占쎄쉭占쎌젟癰귨옙
		// 鈺곌퀬�돳占쎈땾 筌앹빓占쏙옙�뻻占쎄텕疫뀐옙(域뱀눖�쑓 占쎈연疫꿸퀣苑� 鈺곌퀬�돳占쎈땾揶쏉옙 占쎈툡占쎌뒄占쎈립筌욑옙 占쎌벥�눧紐꾩뵠..)
		// service.addHit(num);
		model.addAttribute("vo", vo);
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
		if (n > 0) {
			return "redirect:/fundingList/showAll";
		} else {
			return "error";
		}
	}
}
