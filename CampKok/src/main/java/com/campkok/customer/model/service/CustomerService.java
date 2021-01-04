package com.campkok.customer.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.customer.model.dao.CustomerDao;

@Service
public class CustomerService {

	@Autowired
	private CustomerDao dao;
}
