package com.campkok.customer.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.customer.model.vo.UserVO;

@Repository
public class UserDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertUser(UserVO u) {
		return sqlSession.insert("user.insertUser",u);
	}

	public UserVO selectOneUser(UserVO u) {
		return sqlSession.selectOne("user.selectOneUser",u);
	}
}
