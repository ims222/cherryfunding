package com.cherryfunding.spring.controller.sharing;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherryfunding.spring.service.sharing.InsertSharingService;
import com.cherryfunding.spring.service.sharing.SItemService;
import com.cherryfunding.spring.service.sharing.SPictureService;
import com.cherryfunding.spring.service.sharing.ShareService;
import com.cherryfunding.spring.vo.SItemVo;
import com.cherryfunding.spring.vo.SPictureVo;
import com.cherryfunding.spring.vo.ShareVo;

@Controller
public class InsertSharingController {

	@Autowired
	private ShareService shareService;

	@Autowired
	private SItemService sItemService;

	@Autowired
	private SPictureService sPictureService;

	@Autowired
	private InsertSharingService insertSharingService;

	@RequestMapping(value = "/sharing/insertSharing", method = RequestMethod.GET)
	public String inputSharingForm() {
		return ".insertSharing";
	}

	@RequestMapping(value = "/sharing/insertSharing", method = RequestMethod.POST)
	public String inputSharing(MultipartHttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		String[] sItems = request.getParameterValues("sItem");
		String[] amounts = request.getParameterValues("amount");
		String[] sPinfos = request.getParameterValues("sPinfo");

		int sNum = shareService.getMaxNum() + 1;
		String uploadPath = session.getServletContext().getRealPath("/resources/upload/sharing");
		File f = new File(uploadPath);
		if (f.exists() == false) { // 파일 생성
			f.mkdirs();
		}
		try { // 나눔 저장
			ShareVo svo = new ShareVo();
			svo.setsNum(sNum);
			svo.setId(id);
			svo.setTitle(title);
			svo.setCategory(category);
			svo.setContent(content);
			insertSharingService.sInsert(svo);

			for (int ind = 0; ind < sItems.length; ind++) {
				SItemVo sivo = new SItemVo();
				sivo.setSiNum(sItemService.getMaxNum() + 1);
				sivo.setsNum(sNum);
				sivo.setTitle(sItems[ind]);
				sivo.setAmount(Integer.parseInt(amounts[ind]));
				insertSharingService.siInsert(sivo);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		try {
			List<MultipartFile> files = request.getFiles("sPicture");
			int num = 0;
			for (MultipartFile file : files) {
				String orgfilename = file.getOriginalFilename();
				String savefilename = id + "_" + title + "_" + num + orgfilename;
				long filesize = file.getSize();
				if (filesize > 0) {
					SPictureVo spvo = new SPictureVo();
					spvo.setSpNum(sPictureService.getMaxNum() + 1);
					spvo.setsNum(sNum);
					spvo.setSaveName(savefilename);
					spvo.setOrgName(orgfilename);
					spvo.setFileSize(filesize);
					spvo.setsPinfo(sPinfos[num++]);

					insertSharingService.spInsert(spvo); // 저장
					InputStream is = file.getInputStream();
					FileOutputStream fos = new FileOutputStream(uploadPath + "\\" + savefilename);
					FileCopyUtils.copy(is, fos);
					is.close();
					fos.close();
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/sharing/sharingList";
	}

}
