package com.campkok.admin.camp.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.campkok.admin.camp.model.dao.AdminCampDao;
import com.campkok.admin.camp.model.vo.Camp;

@Service
public class AdminCampService {
	@Autowired
	private AdminCampDao dao;

	public Camp selectCampInfo(String ceoId) {
		return dao.selectCampInfo(ceoId);
	}
}
