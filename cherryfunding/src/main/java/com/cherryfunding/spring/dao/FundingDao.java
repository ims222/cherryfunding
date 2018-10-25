package com.cherryfunding.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.FundingVo;

@Repository
public class FundingDao {
	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.FundingMapper.";

	public int insert(FundingVo vo) { //지원서 작성
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int update(FundingVo vo) {
		return sqlSession.update(NAMESPACE + "update", vo);
	}

	public int delete(int num) {
		return sqlSession.delete(NAMESPACE + "delete", num);
	}

	public FundingVo select(int num) {
		return sqlSession.selectOne(NAMESPACE + "select", num);
	}

	public List<FundingVo> list() {
		return sqlSession.selectList(NAMESPACE + "list");
	}

	public int getMaxNum() { //인덱스
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public List<FundingVo> prepare(HashMap<String, Object> map) { // 준비중
		return sqlSession.selectList(NAMESPACE + "prepare", map);
	}

	public List<FundingVo> end(HashMap<String, Object> map) { // 종료
		return sqlSession.selectList(NAMESPACE + "end", map);
	}
	public List<FundingVo> ing(HashMap<String, Object> map) { // 진행
		return sqlSession.selectList(NAMESPACE + "ing", map);
	}
}
