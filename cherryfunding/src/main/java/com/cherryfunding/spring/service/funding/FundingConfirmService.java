package com.cherryfunding.spring.service.funding;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FPictureDao;
import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;

@Service
public class FundingConfirmService {

	@Autowired
	private FundingDao fundingDao;

	@Autowired
	private FPictureDao fPictureDao;

	@Autowired
	private S3Util s3;

	public List<FundingVo> waitList() { // 대기 목록
		return fundingDao.waitList();
	}

	public List<FundingVo> confirmList() { // 승인 목록
		return fundingDao.confirmList();
	}

	public int confirm(int fNum) { // 컨펌
		return fundingDao.confirm(fNum);
	}

	public int wait(int fNum) { // 컨펌취소
		return fundingDao.wait(fNum);
	}

	public List<FundingVo> list() { // 전체목록
		return fundingDao.list();
	}

	public FundingVo detail(int fNum) {
		return fundingDao.detail(fNum);
	}

	public List<FPictureVo> fPictureList(int fNum) {

		List<FPictureVo> list = fPictureDao.list(fNum);
		for (FPictureVo vo : list) {
			vo.setSavename(s3.getFileURL("funding/" + vo.getSavename()));
		}

		return list;
	}

}
