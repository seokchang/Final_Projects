package com.campkok.camp.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.camp.model.vo.CampRoomVO;
import com.campkok.camp.model.vo.CampVO;
import com.campkok.camp.model.vo.ReviewVO;
import com.campkok.camp.model.vo.UserVO;

@Repository
public class CampDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public CampRoomVO selectRoomInfo(int roomNo) {
		return sqlSession.selectOne("camp.selectRoomInfo",roomNo);
	}

	public CampVO selectCampInfo(int campNo) {		
		return sqlSession.selectOne("camp.selectCampInfo",campNo);
	}

	public int campRes(HashMap<String, Object> map) {
		return sqlSession.insert("camp.campRes",map);
	}

	public UserVO selectUserPoint(int userNo) {
		return sqlSession.selectOne("camp.selectUserPoint",userNo);
	}

	public int userPointUpdate(HashMap<String, Object> map) {
		return sqlSession.update("camp.updateUserPoint",map);
	}

	public int totalPoint(int userNo) {
		return sqlSession.selectOne("camp.totalPoint",userNo);
	}

	public int pointUpdate(HashMap<String, Object> map) {
		return sqlSession.insert("camp.insertPoint",map);
	}

	public int insertComment(HashMap<String, Object> map) {
		return sqlSession.insert("camp.insertComment",map);
	}

	public ArrayList<ReviewVO> selectAllComment() {
		List<ReviewVO> commentList = sqlSession.selectList("camp.selectAllComment"); 
		return (ArrayList<ReviewVO>)commentList;
	}


}
