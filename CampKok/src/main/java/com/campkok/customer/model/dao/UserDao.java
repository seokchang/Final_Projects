package com.campkok.customer.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.customer.model.vo.DmVO;
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

	// 아이디 찾기
	public String findUserId(String userName, String userPhone) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("userName", userName);
		map.put("userPhone", userPhone);
		return sqlSession.selectOne("user.findUserId",map);
	}

	public int dmCount(String userId) {
		// TODO Auto-generated method stub
		List<DmVO> list = sqlSession.selectList("user.dmList", userId);
		return list.size();
	}

	// 비밀번호 찾기
	public String findUserPw(String userName, String userPhone, String userId) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userName", userName);
		map.put("userPhone", userPhone);
		map.put("userId", userId);
		return sqlSession.selectOne("user.findUserPw",map);
	}
}
