package com.cherryfunding.spring.dao;

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

	public int insert(FundingVo vo) { //������ �ۼ�
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

	public int getMaxNum() { //�ε���
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public List<FundingVo> prepare() { // �غ���
		return sqlSession.selectList(NAMESPACE + "prepare");
	}

	public List<FundingVo> end() { // ����
		return sqlSession.selectList(NAMESPACE + "end");
	}
}
