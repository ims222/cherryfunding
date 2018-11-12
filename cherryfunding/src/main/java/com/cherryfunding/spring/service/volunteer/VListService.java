package com.cherryfunding.spring.service.volunteer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cherryfunding.spring.dao.VListDao;
import com.cherryfunding.spring.vo.VListVo;

@Service
public class VListService {

	@Autowired
	private VListDao vListDao;
	
	public VListVo isApply(VListVo vo) {
		return vListDao.isApply(vo);
	}
	public int insert(VListVo vo) {
		return vListDao.insert(vo);
	}
	public int getMaxNum() {
		return vListDao.getMaxNum();
	}
	public int delete(VListVo vo) {
		return vListDao.delete(vo);
	}
	public int getTotal(int vNum) {
		return vListDao.getTotal(vNum);
	}
	public List<String> getNearId(int vNum){
		return vListDao.getNearId(vNum);
	}
}
