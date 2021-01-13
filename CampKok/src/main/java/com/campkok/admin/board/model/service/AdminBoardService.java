package com.campkok.admin.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.admin.board.model.dao.AdminBoardDao;

@Service
public class AdminBoardService {
	@Autowired
	private AdminBoardDao dao;
}
