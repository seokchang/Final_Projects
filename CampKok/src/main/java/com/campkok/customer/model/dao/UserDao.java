package com.campkok.customer.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.customer.model.vo.UserVO;

@Repository
public class UserDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 회원가입
	public int insertUser(UserVO u) {
		return sqlSession.insert("user.insertUser",u);
	}
	
	// 로그인
	public UserVO selectOneUser(UserVO u) {
		return sqlSession.selectOne("user.selectOneUser",u);
	}
	
	// 아이디중복
	public UserVO checkId(UserVO u) {
		return sqlSession.selectOne("user.checkId",u);
	}
}
