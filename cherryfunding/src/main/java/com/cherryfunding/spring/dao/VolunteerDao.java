package com.cherryfunding.spring.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cherryfunding.spring.vo.VolunteerVo;

@Repository
public class VolunteerDao {
	@Autowired
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.cherryfunding.spring.vo.VolunteerMapper.";
	public int insert(VolunteerVo vo) {
		return sqlSession.insert(NAMESPACE + "insert", vo);
	}
	public VolunteerVo detail(int vNum) {
		return sqlSession.selectOne(NAMESPACE + "detail", vNum);
	}
	public List<VolunteerVo> list(){
		return sqlSession.selectList(NAMESPACE + "list");
	}
	public List<VolunteerVo> getFirstSix(){
		return sqlSession.selectList(NAMESPACE + "getFirstSix");
	}
	public int getMaxNum() {
		return sqlSession.selectOne(NAMESPACE + "getMaxNum");
	}
	public int getMembers(int vNum) {
		return sqlSession.selectOne(NAMESPACE + "getMembers", vNum);
	}
	public HashMap<String, Object> getEnded() {
		return sqlSession.selectOne(NAMESPACE + "getEnded");
	}
	
	public int updateEnded(HashMap<String, Object> map) {
		return sqlSession.update(NAMESPACE + "updateEnded", map);
	}
	
	public List<Integer> getNearNum(){
		return sqlSession.selectList(NAMESPACE + "getNearNum");
	}
	
	public String getTitle(int vNum) {
		return sqlSession.selectOne(NAMESPACE + "getTitle", vNum);
	}
	
	public List<VolunteerVo> showMore(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + "showMore", map);
	}
}
