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

	public int insert(FundingVo vo) { // 지원서 작성
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int update(FundingVo vo) {
		return sqlSession.update(NAMESPACE + "update", vo);
	}

	public int delete(int num) {
		return sqlSession.delete(NAMESPACE + "delete", num);
	}

	public FundingVo select(int fNum) {
		return sqlSession.selectOne(NAMESPACE + "select", fNum);
	}

	public List<FundingVo> list() { // 전체 목록
		return sqlSession.selectList(NAMESPACE + "list");
	}

	public int getMaxNum() { // 인덱스
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

	public int hitUp(int fNum) { // 조회수 증가
		return sqlSession.update(NAMESPACE + "hitUp", fNum);
	}

	// 메인 요악
	public FundingVo mainEnd() {// 종료임박
		return sqlSession.selectOne(NAMESPACE + "mainEnd");
	}

	public FundingVo mainNew() {// 새로 시작하는 펀딩
		return sqlSession.selectOne(NAMESPACE + "mainNew");
	}

	public FundingVo mainHot() {// 조회수높은
		return sqlSession.selectOne(NAMESPACE + "mainHot");
	}

	public FundingVo mainPrice() {// 참여금액이 제일 높은
		return sqlSession.selectOne(NAMESPACE + "mainPrice");
	}

	public HashMap<String, Object> totFunding() { // 전체 펀딩 갯수, 합계
		return sqlSession.selectOne(NAMESPACE + "totFunding");
	}

	public int todayFundingPrice() { // 오늘 펀딩 금액
		return sqlSession.selectOne(NAMESPACE + "todayFundingPrice");
	}

	public int todayFundingCount() { // 오늘 펀딩 갯수
		return sqlSession.selectOne(NAMESPACE + "todayFundingCount");
	}

	public List<FundingVo> waitList() { // 대기목록
		return sqlSession.selectList(NAMESPACE + "waitList");
	}

	public int confirm(int fNum) { // 컨펌
		return sqlSession.update(NAMESPACE + "confirm", fNum);
	}

	public int wait(int fNum) { // 컨펌
		return sqlSession.update(NAMESPACE + "wait", fNum);
	}

	public List<FundingVo> searchwaitList(HashMap<String, String> map) {
		return sqlSession.selectList(NAMESPACE + "searchwaitList", map);
	}

	public List<FundingVo> searchconfirmList(HashMap<String, String> map) {
		return sqlSession.selectList(NAMESPACE + "searchconfirmList", map);
	}

	public List<FundingVo> confirmList() { // 컨펌 확인 후 목록
		return sqlSession.selectList(NAMESPACE + "confirmList");
	}

	public int addCamout(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE + "addCamout", map);
	}

	public List<FundingVo> hashtag(String hashtag) {
		return sqlSession.selectList(NAMESPACE + "hashtag", hashtag);
	}

	public FundingVo detail(int fNum) {
		return sqlSession.selectOne(NAMESPACE + "detail", fNum);
	}

	public int getTotCount() {
		return sqlSession.selectOne(NAMESPACE + "getTotCount");
	}

}
