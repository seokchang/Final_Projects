package com.campkok.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.admin.model.dao.AdminDao;

@Service
public class AdminService {
	@Autowired
	private AdminDao dao;

}
