package com.cherryfunding.spring.service.funding;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.FCommentDao;
import com.cherryfunding.spring.vo.FCommentVo;

@Service
public class FCommentService {

	@Autowired
	private FCommentDao fCommentDao;

	public int insert(FCommentVo vo) {
		return fCommentDao.insert(vo);
	}

	public int getMaxNum() {
		return fCommentDao.getMaxNum();
	}

	public List<FCommentVo> commentList(int fnum) {
		return fCommentDao.commentList(fnum);
	}
}