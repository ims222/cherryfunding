package com.cherryfunding.spring.service.funding;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.CPictureDao;
import com.cherryfunding.spring.dao.CharityDao;
import com.cherryfunding.spring.dao.FPictureDao;
import com.cherryfunding.spring.dao.FundingDao;
import com.cherryfunding.spring.dao.RestKeyDao;
import com.cherryfunding.spring.util.S3Util;
import com.cherryfunding.spring.vo.CPictureVo;
import com.cherryfunding.spring.vo.CharityVo;
import com.cherryfunding.spring.vo.FPictureVo;
import com.cherryfunding.spring.vo.FundingVo;

@Service
public class FundingConfirmService {

	@Autowired
	private FundingDao fundingDao;

	@Autowired 
	private CharityDao charityDao;

	@Autowired
	private FPictureDao fPictureDao;

	@Autowired
	private CPictureDao cPictureDao;

	@Autowired
	private RestKeyDao restKeyDao;

	public List<FundingVo> waitList() { // 대기 목록
		return fundingDao.waitList();
	}

	public List<FundingVo> confirmList() { // 승인 목록
		return fundingDao.confirmList();
	}

	public int confirm(HashMap<Object, Object> map) { // 컨펌
		return fundingDao.confirm(map);
	}

	public int wait(int fNum) { // 컨펌취소
		return fundingDao.wait(fNum);
	}

	public List<FundingVo> list() { // 전체목록
		return fundingDao.list();
	}

	public FundingVo fundingDetail(int fNum) {
		return fundingDao.detail(fNum);
	}

	public CharityVo charityDetail(int cNum) {
		return charityDao.select(cNum);
	}

	public List<FPictureVo> fPictureList(int fNum) {

		List<FPictureVo> list = fPictureDao.list(fNum);
		for (FPictureVo vo : list) {
			S3Util s3Util = new S3Util(restKeyDao.getKeyValue("s3_accessKey"),
					restKeyDao.getKeyValue("s3_secretKey"));
			vo.setSavename(s3Util.getFileURL("funding/" + vo.getSavename()));
		}

		return list;
	}

	public List<CPictureVo> cPictureList(int cNum) {

		List<CPictureVo> list = cPictureDao.list(cNum);
		for (CPictureVo vo : list) {
			S3Util s3Util = new S3Util(restKeyDao.getKeyValue("s3_accessKey"),
					restKeyDao.getKeyValue("s3_secretKey"));
			vo.setSaveName(s3Util.getFileURL("charity/" + vo.getSaveName()));
		}

		return list;
	}

}
