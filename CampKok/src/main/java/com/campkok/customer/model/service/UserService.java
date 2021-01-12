package com.campkok.customer.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.customer.model.dao.UserDao;
import com.campkok.customer.model.vo.UserVO;

@Service
public class UserService {

	@Autowired
	private UserDao dao;

	public int insertUser(UserVO u) {
		int result = dao.insertUser(u);
		return result;
	}

	public UserVO selectOneUser(UserVO u) {
		return dao.selectOneUser(u);
	}
}
