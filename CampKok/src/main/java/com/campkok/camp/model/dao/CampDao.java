package com.campkok.camp.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.camp.model.vo.CampRoomVO;

@Repository
public class CampDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public CampRoomVO selectRoomInfo(int roomNo) {
		return sqlSession.selectOne("camp.selectRoomInfo",roomNo);
	}
}
