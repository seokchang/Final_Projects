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
		System.out.println("dao 이 메시지는 한번만 돌아야 합니다.");
		return sqlSession.insert("user.insertUser",u);
	}
	
	// 로그인, 아이디중복
	public UserVO selectOneUser(UserVO u) {
		return sqlSession.selectOne("user.selectOneUser",u);
	}
}
