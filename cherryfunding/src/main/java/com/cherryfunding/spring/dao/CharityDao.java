package com.cherryfunding.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.CharityVo;

@Repository
public class CharityDao {
	@Autowired
	SqlSession sqlSession;

	private static final String NAMESPACE = "com.cherryfunding.spring.vo.CharityMapper.";

	public int insert(CharityVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}

	public int update(CharityVo vo) {
		return sqlSession.update(NAMESPACE + "update", vo);
	}

	public int delete(int num) {
		return sqlSession.delete(NAMESPACE + "delete", num);
	}

	public CharityVo select(int cNum) {
		return sqlSession.selectOne(NAMESPACE + "select", cNum);
	}

	public List<CharityVo> list() {
		return sqlSession.selectList(NAMESPACE + "list");
	}

	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}

	public List<CharityVo> prepare(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + "prepare", map);
	}

	public List<CharityVo> end(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + "end", map);
	}

	public List<HashMap<String, Object>> ing(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + "ing", map);
	}

	public int hitUp(int cNum) { // 조회수 증가
		return sqlSession.update(NAMESPACE + "hitUp", cNum);
	}

	// 메인 요악
	public CharityVo mainEnd() {// 종료임박
		return sqlSession.selectOne(NAMESPACE + "mainEnd");
	}

	public CharityVo mainNew() {// 새로 시작하는 펀딩
		return sqlSession.selectOne(NAMESPACE + "mainNew");
	}

	public CharityVo mainHot() {// 조회수높은
		return sqlSession.selectOne(NAMESPACE + "mainHot");
	}

	public CharityVo mainPrice() {// 참여금액이 제일 높은
		return sqlSession.selectOne(NAMESPACE + "mainPrice");
	}

	public HashMap<String, Object> todayCharity() {
		return sqlSession.selectOne(NAMESPACE + "todayCharity");
	}

	public int wait(int cNum) { // 컨펌
		return sqlSession.update(NAMESPACE + "wait", cNum);
	}

	public List<CharityVo> waitList() { // 대기목록
		return sqlSession.selectList(NAMESPACE + "waitList");
	}

	public List<CharityVo> searchwaitList(HashMap<String, String> map) {
		return sqlSession.selectList(NAMESPACE + "searchwaitList", map);
	}

	public List<CharityVo> searchconfirmList(HashMap<String, String> map) {
		return sqlSession.selectList(NAMESPACE + "searchconfirmList", map);
	}

	public int confirm(int cNum) { // 컨펌
		return sqlSession.update(NAMESPACE + "confirm", cNum);
	}

	public List<CharityVo> confirmList() {
		return sqlSession.selectList(NAMESPACE + "confirmList");
	}

	public HashMap<String, Object> totCharity() { // 전체 후원 갯수, 합계
		return sqlSession.selectOne(NAMESPACE + "totCharity");
	}

	public int todayCharityPrice() { // 오늘 후원 합계
		return sqlSession.selectOne(NAMESPACE + "todayCharityPrice");
	}

	public int todayCharityCount() { // 오늘 후원 갯수
		return sqlSession.selectOne(NAMESPACE + "todayCharityCount");
	}

	public List<String> relatedWords(HashMap<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + "related", map);
	}

	public int getTotCount(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + "getTotCount", map);
	}
}