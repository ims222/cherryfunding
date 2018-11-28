package com.cherryfunding.spring.controller.volunteer;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cherryfunding.spring.dao.RestKeyDao;
import com.cherryfunding.spring.service.volunteer.VPictureService;
import com.cherryfunding.spring.service.volunteer.VolunteerService;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.VPictureVo;
import com.cherryfunding.spring.vo.VolunteerVo;

@Controller
public class InsertVolunteerController {
	@Autowired
	private VolunteerService volunteerService;

	@Autowired
	private VPictureService vPictureService;

	@Autowired
	private RestKeyDao restKeyDao;

	@RequestMapping(value = "/volunteer/insertVolunteer", method = RequestMethod.GET)
	public String insertVolunteerForm() {
		return ".insertVolunteer";
	}

	@RequestMapping(value = "/volunteer/insertVolunteer", method = RequestMethod.POST)
	public String insertVolunteer(MultipartHttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		String dDay = request.getParameter("dDay");
		int members = Integer.parseInt(request.getParameter("members"));
		String place = request.getParameter("place");

		String[] vPinfo = request.getParameterValues("vPinfo");
		List<MultipartFile> files = request.getFiles("vPicture");

		int vNum = volunteerService.getMaxNum() + 1;

		String uploadPath = session.getServletContext().getRealPath("/resources/upload/volunteer");
		File f = new File(uploadPath);
		if (f.exists() == false) { // 파일 생성
			f.mkdirs();
		}

		try { // 텍스트 저장
			VolunteerVo vo = new VolunteerVo();
			vo.setvNum(vNum);
			vo.setId(id);
			vo.setTitle(title);
			vo.setCategory(category);
			vo.setContent(content);
			java.util.Date dDay2 = new SimpleDateFormat("yyyy-MM-dd").parse(dDay);
			vo.setdDay(new Date(dDay2.getTime()));
			vo.setMembers(members);
			vo.setPlace(place);
			volunteerService.insert(vo);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		try { // 사진 저장
			int num = 0;
			for (MultipartFile file : files) {
				String orgfilename = file.getOriginalFilename();
				String savefilename = String.valueOf(UUID.randomUUID());
				long filesize = file.getSize();
				if (filesize > 0) {

					VPictureVo vpvo = new VPictureVo();
					vpvo.setVpNum(vPictureService.getMaxNum() + 1);
					vpvo.setvNum(vNum);
					vpvo.setOrgName(orgfilename);
					vpvo.setSaveName(savefilename);
					vpvo.setFileSize(filesize);
					vpvo.setVpInfo(vPinfo[num++]);
					S3Util s3Util = new S3Util(restKeyDao.getKeyValue("s3_accessKey"),
							restKeyDao.getKeyValue("s3_secretKey"));
					s3Util.fileUpload("volunteer/" + savefilename, file.getBytes()); // 파일 업로드
					vPictureService.insert(vpvo);
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/volunteer/volunteerList";
	}
}
