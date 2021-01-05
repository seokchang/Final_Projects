package com.campkok.camp.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CampDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
