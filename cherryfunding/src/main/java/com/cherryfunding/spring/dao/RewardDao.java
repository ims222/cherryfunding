package com.cherryfunding.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.RewardVo;

@Repository
public class RewardDao {
	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.RewardMapper.";
 
	public int insert(RewardVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public List<RewardVo> rewardItem(int fnum) {
		return sqlSession.selectList(NAMESPACE + "rewardList", fnum);
	}

	public RewardVo detail(int rNum) {
		return sqlSession.selectOne(NAMESPACE + "detail", rNum);
	}

	public int getPrice(int rNum) {
		return sqlSession.selectOne(NAMESPACE + "getPrice", rNum);
	}

	public int updateAmount(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE + "updateAmount", map);
	}

	public int getAmount(int rNum) {
		return sqlSession.selectOne(NAMESPACE + "getAmount", rNum);
	}

}
