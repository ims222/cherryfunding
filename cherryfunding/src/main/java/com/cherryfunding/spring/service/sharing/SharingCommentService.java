package com.cherryfunding.spring.service.sharing;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.SCommentDao;
import com.cherryfunding.spring.vo.SCommentVo;

@Service
public class SharingCommentService {

	@Autowired
	private SCommentDao sCommentDao;

	public int insert(SCommentVo vo) {
		return sCommentDao.insert(vo);
	}

	public int getMaxNum() {
		return sCommentDao.getMaxNum();
	}

	public List<SCommentVo> commentList(int sNum) {
		return sCommentDao.commentList(sNum);
	}

	public int getCommentCount(int sNum) {
		return sCommentDao.getCommentCount(sNum);
	}
}
