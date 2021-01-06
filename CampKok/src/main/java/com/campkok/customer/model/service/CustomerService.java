package com.campkok.customer.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.customer.model.dao.CustomerDao;
import com.campkok.customer.model.vo.UserVO;

@Service
public class CustomerService {

	@Autowired
	private CustomerDao dao;

	public UserVO selectOneCustomer(int userNo) {
		// TODO Auto-generated method stub
		return dao.selectOneCutomer(userNo);
	}
}
