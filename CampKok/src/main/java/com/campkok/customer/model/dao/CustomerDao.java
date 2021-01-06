package com.campkok.customer.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campkok.customer.model.vo.UserVO;

@Repository
public class CustomerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public UserVO selectOneCutomer(int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("customer.mypage", userNo);
	}
}
