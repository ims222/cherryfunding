package com.cherryfunding.spring.service.volunteer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.VCommentDao;
import com.cherryfunding.spring.vo.VCommentVo;



@Service
public class VolunteerCommentService {
	
	@Autowired
	private VCommentDao vCommentDao;

	public int insert(VCommentVo vo) {
		return vCommentDao.insert(vo);
	}

	public int getMaxNum() {
		return vCommentDao.getMaxNum();
	}

	public List<VCommentVo> commentList(int vNum) {
		return vCommentDao.commentList(vNum);
	}
	
	public int delete(int vcNum) {
		return vCommentDao.delete(vcNum);
	}
}
