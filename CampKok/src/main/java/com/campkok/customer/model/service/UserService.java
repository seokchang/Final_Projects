package com.campkok.customer.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.customer.model.dao.UserDao;
import com.campkok.customer.model.vo.UserVO;

@Service
public class UserService {

	@Autowired
	private UserDao dao;

	// 회원가입 
	public int insertUser(UserVO u) {
		System.out.println("servise 1 이 메시지는 한번만 돌아야 합니다.");
		// if(u.getUserId() != null) 해봤는데 실패 메세지 알람 계속뜸....꺼지지도 않어...
		int result = dao.insertUser(u);
		System.out.println("service 2 이 메시지는 한번만 돌아야 합니다.");
		return result;
	}

	// 로그인, 아이디 중복체크
	public UserVO selectOneUser(UserVO u) {
		return dao.selectOneUser(u);
	}
}
